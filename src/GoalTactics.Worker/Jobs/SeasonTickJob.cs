using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class SeasonTickJob(
    ILogger<SeasonTickJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(5))
{
    protected override string JobName => nameof(SeasonTickJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var now = DateTime.UtcNow;
        var cutoff = now.AddHours(-23);

        var teamResources = await dbContext.TeamResources
            .Where(r => r.LastEconomyTickUtc == null || r.LastEconomyTickUtc < cutoff)
            .ToListAsync(cancellationToken);

        if (teamResources.Count == 0)
        {
            return;
        }

        var teamIds = teamResources.Select(r => r.TeamId).ToList();

        var trainingStates = await dbContext.TeamTrainingStates
            .Where(t => teamIds.Contains(t.TeamId))
            .ToDictionaryAsync(t => t.TeamId, cancellationToken);

        var playersByTeam = (await dbContext.TeamPlayers
            .Where(p => teamIds.Contains(p.TeamId) && !p.IsScouted)
            .ToListAsync(cancellationToken))
            .GroupBy(p => p.TeamId)
            .ToDictionary(g => g.Key, g => g.ToList());

        var processedCount = 0;
        foreach (var resources in teamResources)
        {
            if (playersByTeam.TryGetValue(resources.TeamId, out var players))
            {
                trainingStates.TryGetValue(resources.TeamId, out var trainingState);

                foreach (var player in players)
                {
                    // Player aging: monthly (every 30 progress days), age players over 18
                    if (resources.ProgressDayCounter % 30 == 0 && player.Age > 18)
                    {
                        player.Age++;
                    }

                    // Fitness decay for players not in a camp and without individual training
                    var inCamp = trainingState?.CampActiveUntilUtc > now;
                    var hasIndividualTraining = player.IndividualTrainingSkill != null
                        && player.IndividualTrainingUntilUtc > now;

                    if (!inCamp && !hasIndividualTraining)
                    {
                        player.Fitness = Math.Max(50, player.Fitness - 1);
                    }
                }
            }

            resources.LastEconomyTickUtc = now;
            processedCount++;
        }

        if (processedCount > 0)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
            logger.LogInformation("Season tick: processed {Count} teams", processedCount);
        }
    }
}
