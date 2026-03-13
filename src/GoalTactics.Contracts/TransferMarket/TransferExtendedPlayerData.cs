namespace GoalTactics.Contracts.TransferMarket;

// Legacy-compatible subset of JsonExtendedPlayer used by transfermarket details screens.
public sealed class TransferExtendedPlayerData
{
    public Guid Id { get; init; }
    public Guid TeamId { get; init; }
    public string Name { get; init; } = string.Empty;
    public string CustomName { get; init; } = string.Empty;

    public Guid AuctionId { get; init; }
    public decimal Bid { get; init; }
    public decimal BidIncrement { get; init; }
    public decimal Offer { get; init; }
    public Guid OfferTeamId { get; init; }
    public string EndDate { get; init; } = string.Empty;
    public Guid BidTeamId { get; init; }
    public string BidTeamName { get; init; } = string.Empty;
    public string BidTeamLogo { get; init; } = string.Empty;
    public bool IsFavorite { get; init; }
    public bool IsFrozen { get; init; }
}
