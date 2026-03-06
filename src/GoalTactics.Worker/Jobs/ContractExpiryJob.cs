using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class ContractExpiryJob(ILogger<ContractExpiryJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(6))
{
    protected override string JobName => nameof(ContractExpiryJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Contract expiry run executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
