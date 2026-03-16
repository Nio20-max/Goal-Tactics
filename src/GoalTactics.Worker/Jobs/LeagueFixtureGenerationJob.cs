using GoalTactics.Application.League;
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

        var leagues = await dbContext.Leagues.ToListAsync(cancellationToken);

        // Generate schedules for all leagues that have no fixtures yet.
        var leagueStore = scope.ServiceProvider.GetRequiredService<ILeagueStore>();
        var existingMatchCount = await dbContext.LeagueMatches.CountAsync(cancellationToken);

        foreach (var league in leagues)
        {
            await leagueStore.EnsureScheduleForLeagueAsync(Guid.Parse(league.Id), cancellationToken);
        }

        var newMatchCount = await dbContext.LeagueMatches.CountAsync(cancellationToken);
        var fixturesGenerated = newMatchCount - existingMatchCount;
        if (fixturesGenerated > 0)
        {
            logger.LogInformation("League fixtures: generated {Count} matches", fixturesGenerated);
        }
    }

}
