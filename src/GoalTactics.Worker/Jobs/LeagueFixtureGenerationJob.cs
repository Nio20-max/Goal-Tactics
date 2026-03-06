using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class LeagueFixtureGenerationJob(ILogger<LeagueFixtureGenerationJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(1))
{
    protected override string JobName => nameof(LeagueFixtureGenerationJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("League fixtures generation scan executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
