using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class BidRequest : IdRequest
{
    public int Bid { get; init; }
}
