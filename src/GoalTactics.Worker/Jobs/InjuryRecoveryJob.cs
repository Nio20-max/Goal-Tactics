using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class InjuryRecoveryJob(ILogger<InjuryRecoveryJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(6))
{
    protected override string JobName => nameof(InjuryRecoveryJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Injury recovery run executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
