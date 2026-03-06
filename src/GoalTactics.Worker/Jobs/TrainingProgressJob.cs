using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class TrainingProgressJob(ILogger<TrainingProgressJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(10))
{
    protected override string JobName => nameof(TrainingProgressJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Training progress run executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
