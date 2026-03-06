using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class ScoutingCompletionJob(ILogger<ScoutingCompletionJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(10))
{
    protected override string JobName => nameof(ScoutingCompletionJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Scouting completion run executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
