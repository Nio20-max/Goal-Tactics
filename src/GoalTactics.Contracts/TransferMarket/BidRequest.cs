using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class BidRequest : IdRequest
{
    public Guid TransfermarketId { get; init; }
    public int Bid { get; init; }

    public Guid ResolvedAuctionId => Id != Guid.Empty ? Id : TransfermarketId;
}
