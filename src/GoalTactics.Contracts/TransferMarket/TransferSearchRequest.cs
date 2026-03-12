using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class TransferSearchRequest : RequestObject
{
    public RangeValue? Age { get; init; }

    public RangeValue? Talent { get; init; }

    public RangeValue? Strength { get; init; }

    public RangeValue? Skill { get; init; }

    public int SkillIndex { get; init; } = -1;

    public int? MinimumBid { get; init; }

    public decimal? Budget { get; init; }

    public bool? OnlyKeeper { get; init; }
}

public sealed class RangeValue
{
    public int? Min { get; init; }

    public int? Max { get; init; }
}
