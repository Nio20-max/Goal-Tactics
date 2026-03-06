using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class DailyRewardResetJob(ILogger<DailyRewardResetJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(24))
{
    protected override string JobName => nameof(DailyRewardResetJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Daily reward reset executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
