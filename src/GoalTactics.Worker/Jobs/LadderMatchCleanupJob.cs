using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class LadderMatchCleanupJob(ILogger<LadderMatchCleanupJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(15))
{
    protected override string JobName => nameof(LadderMatchCleanupJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Ladder cleanup executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
