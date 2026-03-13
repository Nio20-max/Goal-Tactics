using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class SellPlayerRequest : RequestObject
{
    public Guid PlayerId { get; init; }

    // Legacy clients often post player id as Id instead of PlayerId.
    public Guid Id { get; init; }

    public int MinimumBid { get; init; }

    // Legacy aliases used by older clients.
    public int? StartingBid { get; init; }
    public decimal? SellPrice { get; init; }
    public int? Hours { get; init; }

    /// <summary>Duration in hours (1–24). Defaults to 4.</summary>
    public int DurationHours { get; init; } = 4;

    public Guid ResolvedPlayerId => PlayerId != Guid.Empty ? PlayerId : Id;

    public int ResolvedMinimumBid
    {
        get
        {
            if (MinimumBid > 0)
            {
                return MinimumBid;
            }

            if (StartingBid.HasValue && StartingBid.Value > 0)
            {
                return StartingBid.Value;
            }

            if (SellPrice.HasValue && SellPrice.Value > 0)
            {
                return (int)Math.Round(SellPrice.Value, MidpointRounding.AwayFromZero);
            }

            return 0;
        }
    }

    public int ResolvedDurationHours => Hours.HasValue && Hours.Value > 0 ? Hours.Value : DurationHours;
}
