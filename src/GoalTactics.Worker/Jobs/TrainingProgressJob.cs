using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class TrainingProgressJob(
    ILogger<TrainingProgressJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(10))
{
    protected override string JobName => nameof(TrainingProgressJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var now = DateTime.UtcNow;
        var cutoff = now.AddHours(-23);

        var teamResources = await dbContext.TeamResources
            .Where(r => r.LastTrainingTickUtc == null || r.LastTrainingTickUtc < cutoff)
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
                foreach (var player in players)
                {
                    // Strength gain based on training center level
                    var baseGain = (decimal)resources.TrainingCenterLevel / 20m * 0.5m;

                    // Bonus if individual training is active
                    var hasIndividualTraining = player.IndividualTrainingSkill != null
                        && player.IndividualTrainingUntilUtc > now;
                    if (hasIndividualTraining)
                    {
                        baseGain += 0.2m;
                    }

                    player.Strength = Math.Min(700m, player.Strength + baseGain);

                    // Fitness recovery
                    var fitnessRecovery = Math.Max(1, resources.TrainingCenterLevel / 5);
                    player.Fitness = Math.Min(100, player.Fitness + fitnessRecovery);
                }
            }

            resources.LastTrainingTickUtc = now;
            resources.ProgressDayCounter++;
            processedCount++;
        }

        if (processedCount > 0)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
            logger.LogInformation("Training progress: processed {Count} teams", processedCount);
        }
    }
}
