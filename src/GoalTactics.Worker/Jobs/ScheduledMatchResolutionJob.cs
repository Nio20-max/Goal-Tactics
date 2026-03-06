using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class ScheduledMatchResolutionJob(ILogger<ScheduledMatchResolutionJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(2))
{
    protected override string JobName => nameof(ScheduledMatchResolutionJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Scheduled match resolution executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
