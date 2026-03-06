using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class TransferSearchRequest : RequestObject
{
    public int? MinimumBid { get; init; }

    public int? Strength { get; init; }

    public bool? OnlyKeeper { get; init; }
}
