using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class SellPlayerRequest : RequestObject
{
    public Guid PlayerId { get; init; }

    public int MinimumBid { get; init; }

    /// <summary>Duration in hours (1–24). Defaults to 4.</summary>
    public int DurationHours { get; init; } = 4;
}
