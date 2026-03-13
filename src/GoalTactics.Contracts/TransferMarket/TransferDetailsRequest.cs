namespace GoalTactics.Contracts.TransferMarket;

public class TransferDetailsRequest : Common.RequestObject
{
    public Guid AuctionId { get; init; }

    // Legacy aliases used by older clients.
    public Guid Id { get; init; }

    public Guid TransfermarketId { get; init; }

    public Guid ResolvedAuctionId =>
        AuctionId != Guid.Empty ? AuctionId :
        Id != Guid.Empty ? Id :
        TransfermarketId;
}
