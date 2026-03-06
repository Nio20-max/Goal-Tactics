using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class SponsorRefreshJob(ILogger<SponsorRefreshJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(12))
{
    protected override string JobName => nameof(SponsorRefreshJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Sponsor refresh run executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
