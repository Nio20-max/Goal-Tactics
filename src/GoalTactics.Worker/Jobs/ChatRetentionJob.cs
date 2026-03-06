using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class ChatRetentionJob(ILogger<ChatRetentionJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(24))
{
    protected override string JobName => nameof(ChatRetentionJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Chat retention cleanup executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
