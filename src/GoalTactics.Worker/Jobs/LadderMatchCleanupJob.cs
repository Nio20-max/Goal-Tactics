using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class LadderMatchCleanupJob(ILogger<LadderMatchCleanupJob> logger, IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(15))
{
    protected override string JobName => nameof(LadderMatchCleanupJob);

    // Reward tiers: rank 1 gets 1,000,000, rank 2 gets 900,000, etc.
    private static readonly int[] RewardTiers = [1_000_000, 900_000, 800_000, 700_000, 600_000, 500_000, 400_000, 300_000, 200_000, 100_000];

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var db = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var now = DateTime.UtcNow;
        var expiredSeasons = await db.LadderSeasons
            .Where(x => x.EndDateUtc <= now)
            .ToListAsync(cancellationToken);

        foreach (var season in expiredSeasons)
        {
            var entries = await db.LadderEntries
                .Where(x => x.LadderId == season.Id)
                .OrderByDescending(x => x.Points)
                .ThenByDescending(x => x.Strength)
                .ThenBy(x => x.TeamName)
                .ToListAsync(cancellationToken);

            // Distribute rewards to human players
            for (var i = 0; i < entries.Count; i++)
            {
                var entry = entries[i];
                if (entry.TeamId is null || entry.IsBot) continue;
                if (i >= RewardTiers.Length) break;

                var reward = (decimal)RewardTiers[i];
                var resources = await db.TeamResources.FirstOrDefaultAsync(x => x.TeamId == entry.TeamId, cancellationToken);
                if (resources is not null)
                {
                    resources.Money += reward;
                }
            }

            // Remove the expired season and its entries (cascade delete)
            db.LadderSeasons.Remove(season);
        }

        if (expiredSeasons.Count > 0)
        {
            await db.SaveChangesAsync(cancellationToken);
            logger.LogInformation("Processed {Count} expired ladder season(s) with reward distribution", expiredSeasons.Count);
        }
    }
}
