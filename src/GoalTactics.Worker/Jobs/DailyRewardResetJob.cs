using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class DailyRewardResetJob(
    ILogger<DailyRewardResetJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(24))
{
    protected override string JobName => nameof(DailyRewardResetJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var todayUtc = DateTime.UtcNow.Date;

        var usersToReset = await dbContext.Users
            .Where(u => u.DailyRewardClaimedUtc != null && u.DailyRewardClaimedUtc < todayUtc)
            .ToListAsync(cancellationToken);

        foreach (var user in usersToReset)
        {
            user.DailyRewardClaimedUtc = null;
        }

        if (usersToReset.Count > 0)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
            logger.LogInformation("Daily reward reset: {Count} users reset", usersToReset.Count);
        }
    }
}
