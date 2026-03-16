using System.Text.Json;
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
                    .Where(p => p.TeamId == homeLeagueTeam.TeamId && !p.IsScouted && p.SuspensionMatchesRemaining <= 0)
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
                    .Where(p => p.TeamId == awayLeagueTeam.TeamId && !p.IsScouted && p.SuspensionMatchesRemaining <= 0)
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

            // Apply card suspensions (and reset cards after suspension) based on match events.
            var cardEvents = result.Events.Where(e => e.Type is MatchEventType.YellowCard or MatchEventType.RedCard)
                .Where(e => !string.IsNullOrEmpty(e.PlayerId))
                .ToList();

            if (cardEvents.Count > 0)
            {
                var playerIds = cardEvents.Select(e => e.PlayerId!).Distinct().ToArray();
                var players = await dbContext.TeamPlayers
                    .Where(p => playerIds.Contains(p.Id))
                    .ToListAsync(cancellationToken);

                foreach (var player in players)
                {
                    var yellowCount = cardEvents.Count(e => e.PlayerId == player.Id && e.Type == MatchEventType.YellowCard);
                    var redCount = cardEvents.Count(e => e.PlayerId == player.Id && e.Type == MatchEventType.RedCard);

                    player.YellowCards += yellowCount;
                    player.RedCards += redCount;

                    // If the player receives a red card, or reaches 3 yellows, mark suspension for next match.
                    if (redCount > 0 || player.YellowCards >= 3)
                    {
                        player.SuspensionMatchesRemaining = Math.Max(player.SuspensionMatchesRemaining, 1);
                    }
                }

                await dbContext.SaveChangesAsync(cancellationToken);
            }

            // Decrement suspension counters for players on the involved teams; reset their cards once suspension is served.
            if (homeLeagueTeam?.TeamId is not null || awayLeagueTeam?.TeamId is not null)
            {
                var affectedTeamIds = new List<string>();
                if (homeLeagueTeam?.TeamId is not null) affectedTeamIds.Add(homeLeagueTeam.TeamId);
                if (awayLeagueTeam?.TeamId is not null) affectedTeamIds.Add(awayLeagueTeam.TeamId);

                var suspendedPlayers = await dbContext.TeamPlayers
                    .Where(p => affectedTeamIds.Contains(p.TeamId) && p.SuspensionMatchesRemaining > 0)
                    .ToListAsync(cancellationToken);

                foreach (var player in suspendedPlayers)
                {
                    player.SuspensionMatchesRemaining--;

                    // When serving the suspension, reset card counts.
                    if (player.SuspensionMatchesRemaining <= 0)
                    {
                        player.SuspensionMatchesRemaining = 0;
                        player.YellowCards = 0;
                        player.RedCards = 0;
                    }
                }

                await dbContext.SaveChangesAsync(cancellationToken);
            }

            // Serialize events for persistent storage and report generation
            var eventsJson = JsonSerializer.Serialize(result.Events.Select(e => new
            {
                e.Minute,
                Type = e.Type.ToString(),
                e.IsHome,
                e.PlayerId,
                e.PlayerName,
                Description = MatchReportGenerator.DescribeEvent(
                    e, match.HomeTeamName ?? "Home", match.AwayTeamName ?? "Away")
            }));

            await leagueStore.ResolveMatchAsync(matchGuid, result.HomeScore, result.AwayScore, scorers, eventsJson, cancellationToken);

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
