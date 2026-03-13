using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class LeagueFixtureGenerationJob(
    ILogger<LeagueFixtureGenerationJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(1))
{
    protected override string JobName => nameof(LeagueFixtureGenerationJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var now = DateTime.UtcNow;

        var seasonState = await dbContext.SeasonStates.FirstOrDefaultAsync(cancellationToken);
        if (seasonState is null)
        {
            seasonState = new SeasonStateEntity
            {
                Id = "singleton",
                SeasonNumber = 1,
                CurrentMatchday = 1,
                StartedAtUtc = now
            };
            dbContext.SeasonStates.Add(seasonState);
            await dbContext.SaveChangesAsync(cancellationToken);
        }

        var leagues = await dbContext.Leagues.ToListAsync(cancellationToken);
        var fixturesGenerated = 0;

        foreach (var league in leagues)
        {
            var upcomingWindow = now.AddDays(7);
            var unplayedCount = await dbContext.LeagueMatches
                .CountAsync(m =>
                    m.LeagueId == league.Id
                    && !m.IsPlayed
                    && m.ScheduledDateUtc <= upcomingWindow,
                    cancellationToken);

            if (unplayedCount >= 2)
            {
                continue;
            }

            var leagueTeams = await dbContext.LeagueTeams
                .Where(t => t.LeagueId == league.Id)
                .ToListAsync(cancellationToken);

            if (leagueTeams.Count < 2)
            {
                continue;
            }

            // Generate round-robin pairings for the next matchday
            var matchday = seasonState.CurrentMatchday;
            var pairings = GenerateRoundRobinPairings(leagueTeams, matchday);

            foreach (var (home, away) in pairings)
            {
                var scheduledDate = now.AddDays(Random.Shared.Next(1, 4));
                var match = new LeagueMatchEntity
                {
                    Id = Guid.NewGuid().ToString("N"),
                    LeagueId = league.Id,
                    Matchday = matchday,
                    HomeLeagueTeamId = home.Id,
                    AwayLeagueTeamId = away.Id,
                    HomeTeamName = home.TeamName,
                    AwayTeamName = away.TeamName,
                    HomeLogo = home.Logo,
                    AwayLogo = away.Logo,
                    HomeCountry = home.Country,
                    AwayCountry = away.Country,
                    HomeStrength = (int)home.Strength,
                    AwayStrength = (int)away.Strength,
                    ScheduledDateUtc = scheduledDate
                };
                dbContext.LeagueMatches.Add(match);
                fixturesGenerated++;
            }

            seasonState.CurrentMatchday++;
        }

        if (fixturesGenerated > 0)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
            logger.LogInformation("League fixtures: generated {Count} matches", fixturesGenerated);
        }
    }

    private static List<(LeagueTeamEntity Home, LeagueTeamEntity Away)> GenerateRoundRobinPairings(
        List<LeagueTeamEntity> teams, int matchday)
    {
        var pairings = new List<(LeagueTeamEntity, LeagueTeamEntity)>();
        var count = teams.Count;

        // Use matchday as rotation offset for round-robin scheduling
        var rotated = new List<LeagueTeamEntity>(teams);
        if (count > 1)
        {
            var offset = (matchday - 1) % (count - 1);
            // Keep first team fixed, rotate the rest
            var rest = rotated.GetRange(1, count - 1);
            for (var i = 0; i < offset; i++)
            {
                var last = rest[^1];
                rest.RemoveAt(rest.Count - 1);
                rest.Insert(0, last);
            }

            rotated = [teams[0], .. rest];
        }

        for (var i = 0; i < count / 2; i++)
        {
            pairings.Add((rotated[i], rotated[count - 1 - i]));
        }

        return pairings;
    }
}
