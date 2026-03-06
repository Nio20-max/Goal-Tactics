using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class AuctionSettlementJob(ILogger<AuctionSettlementJob> logger)
    : ScheduledBackgroundJob(logger, TimeSpan.FromSeconds(30))
{
    protected override string JobName => nameof(AuctionSettlementJob);

    protected override Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        logger.LogInformation("Auction settlement run executed at {UtcNow}", DateTime.UtcNow);
        return Task.CompletedTask;
    }
}
