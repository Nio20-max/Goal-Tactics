using GoalTactics.Application.League;
using GoalTactics.Application.Live;
using GoalTactics.Application.Mechanics;
using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class ScheduledMatchResolutionJob(
    ILogger<ScheduledMatchResolutionJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(2))
{
    protected override string JobName => nameof(ScheduledMatchResolutionJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();
        var leagueStore = scope.ServiceProvider.GetRequiredService<ILeagueStore>();
        var broadcaster = scope.ServiceProvider.GetService<IMatchEventBroadcaster>();
        var engine = new MatchSimulationEngine();

        var now = DateTime.UtcNow;

        // Find all unplayed matches that should have been played by now
        var pendingMatches = await dbContext.LeagueMatches
            .Where(m => !m.IsPlayed && m.ScheduledDateUtc <= now)
            .OrderBy(m => m.ScheduledDateUtc)
            .Take(50) // Process in batches
            .ToListAsync(cancellationToken);

        if (pendingMatches.Count == 0) return;

        logger.LogInformation("Resolving {Count} pending league matches", pendingMatches.Count);

        foreach (var match in pendingMatches)
        {
            // Lookup home and away league teams for strength and optional real team data
            var homeLeagueTeam = await dbContext.LeagueTeams
                .AsNoTracking()
                .FirstOrDefaultAsync(lt => lt.Id == match.HomeLeagueTeamId, cancellationToken);
            var awayLeagueTeam = await dbContext.LeagueTeams
                .AsNoTracking()
                .FirstOrDefaultAsync(lt => lt.Id == match.AwayLeagueTeamId, cancellationToken);

            var homeStrength = homeLeagueTeam?.Strength ?? match.HomeStrength;
            var awayStrength = awayLeagueTeam?.Strength ?? match.AwayStrength;

            // Try to get real players for goal attribution
            List<SimulationPlayer>? homePlayers = null;
            List<SimulationPlayer>? awayPlayers = null;
            string? homeTactic = null;
            string? awayTactic = null;
            double homeTacticTraining = 0;
            double awayTacticTraining = 0;

            if (homeLeagueTeam?.TeamId is not null)
            {
                homePlayers = await dbContext.TeamPlayers
                    .AsNoTracking()
                    .Where(p => p.TeamId == homeLeagueTeam.TeamId && !p.IsScouted)
                    .Select(p => new SimulationPlayer(p.Id, p.Name, p.Position, p.Strength, p.TeamId))
                    .ToListAsync(cancellationToken);

                var trainingState = await dbContext.TeamTrainingStates
                    .AsNoTracking()
                    .FirstOrDefaultAsync(t => t.TeamId == homeLeagueTeam.TeamId, cancellationToken);
                homeTactic = trainingState?.SelectedTacticId;
                // Training percentage based on how long the tactic has been trained
                if (trainingState?.SelectedTacticStartUtc is not null)
                {
                    var daysTrained = (now - trainingState.SelectedTacticStartUtc.Value).TotalDays;
                    homeTacticTraining = Math.Clamp(daysTrained / 30.0, 0, 1); // 30 days = 100%
                }
            }

            if (awayLeagueTeam?.TeamId is not null)
            {
                awayPlayers = await dbContext.TeamPlayers
                    .AsNoTracking()
                    .Where(p => p.TeamId == awayLeagueTeam.TeamId && !p.IsScouted)
                    .Select(p => new SimulationPlayer(p.Id, p.Name, p.Position, p.Strength, p.TeamId))
                    .ToListAsync(cancellationToken);

                var trainingState = await dbContext.TeamTrainingStates
                    .AsNoTracking()
                    .FirstOrDefaultAsync(t => t.TeamId == awayLeagueTeam.TeamId, cancellationToken);
                awayTactic = trainingState?.SelectedTacticId;
                if (trainingState?.SelectedTacticStartUtc is not null)
                {
                    var daysTrained = (now - trainingState.SelectedTacticStartUtc.Value).TotalDays;
                    awayTacticTraining = Math.Clamp(daysTrained / 30.0, 0, 1);
                }
            }

            // Deterministic seed from match ID for reproducibility
            var matchGuid = Guid.TryParse(match.Id, out var mg) ? mg : Guid.Empty;
            var seed = matchGuid.GetHashCode();

            var result = engine.SimulateDetailed(
                (int)homeStrength, (int)awayStrength,
                homeTactic, awayTactic,
                homeTacticTraining, awayTacticTraining,
                homePlayers, awayPlayers,
                seed);

            // Map scorers to their team IDs
            var scorers = result.Scorers.Select(s =>
            {
                var teamId = result.Events
                    .Where(e => e.Type == MatchEventType.Goal && e.PlayerId == s.PlayerId && e.Minute == s.Minute)
                    .Select(e =>
                    {
                        if (e.IsHome && homeLeagueTeam?.TeamId is not null) return homeLeagueTeam.TeamId;
                        if (!e.IsHome && awayLeagueTeam?.TeamId is not null) return awayLeagueTeam.TeamId;
                        return "";
                    })
                    .FirstOrDefault() ?? "";
                return new MatchScorerEvent(teamId, s.PlayerId, s.Minute);
            }).Where(s => !string.IsNullOrEmpty(s.TeamId)).ToList();

            await leagueStore.ResolveMatchAsync(matchGuid, result.HomeScore, result.AwayScore, scorers, cancellationToken);

            if (broadcaster is not null)
            {
                await broadcaster.BroadcastMatchResultAsync(
                    matchGuid,
                    match.HomeTeamName ?? "Home",
                    match.AwayTeamName ?? "Away",
                    result.HomeScore,
                    result.AwayScore,
                    result.Events,
                    cancellationToken);
            }
        }

        logger.LogInformation("Match resolution complete: {Count} matches resolved", pendingMatches.Count);
    }
}
