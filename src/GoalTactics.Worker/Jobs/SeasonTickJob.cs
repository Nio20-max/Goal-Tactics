using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class SeasonTickJob(ILogger<SeasonTickJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(5))
{
    protected override string JobName => nameof(SeasonTickJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Season tick executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
