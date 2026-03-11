using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class TransferSearchRequest : RequestObject
{
    public RangeValue? Talent { get; init; }

    public int SkillIndex { get; init; } = -1;

    public int? MinimumBid { get; init; }

    public int? Strength { get; init; }

    public bool? OnlyKeeper { get; init; }
}

public sealed class RangeValue
{
    public int? Min { get; init; }

    public int? Max { get; init; }
}
