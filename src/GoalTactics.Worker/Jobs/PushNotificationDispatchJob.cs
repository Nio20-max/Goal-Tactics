using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class PushNotificationDispatchJob(ILogger<PushNotificationDispatchJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(5))
{
    protected override string JobName => nameof(PushNotificationDispatchJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Push notification dispatch executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
