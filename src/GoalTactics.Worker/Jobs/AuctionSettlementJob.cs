using GoalTactics.Application.TransferMarket;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class AuctionSettlementJob(
    ILogger<AuctionSettlementJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromSeconds(30))
{
    protected override string JobName => nameof(AuctionSettlementJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var auctionStore = scope.ServiceProvider.GetRequiredService<IAuctionStore>();

        // Settle expired auctions (transfer players, handle money)
        var settled = await auctionStore.SettleExpiredAuctionsAsync(cancellationToken);
        if (settled > 0)
        {
            logger.LogInformation("Auction settlement: processed {Count} expired auctions", settled);
        }

        // Ensure minimum number of system auctions exist
        await auctionStore.EnsureSystemAuctionsAsync(10, cancellationToken);
    }
}
