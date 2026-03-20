namespace GoalTactics.Contracts.TransferMarket;

// Legacy payload used by old /GetBid and /PlaceBid JSON routes.
public sealed class LegacyTransferBidResponse : Common.ResponseObject
{
    public Guid ID { get; init; }
    public Guid PlayerID { get; init; }
    public Guid TeamID { get; init; }
    public decimal Offer { get; init; }
    public Guid OfferTeamID { get; init; }
    public decimal Bid { get; init; }
    public string EndDate { get; init; } = string.Empty;
    public string BidTeamLogo { get; init; } = string.Empty;
    public bool HasUpgrade { get; init; }
    public bool IsSuccessfulBid { get; init; }
    public TransferExtendedPlayerData Player { get; init; } = new();
}