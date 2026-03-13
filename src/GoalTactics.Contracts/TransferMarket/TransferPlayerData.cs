namespace GoalTactics.Contracts.TransferMarket;

/// <summary>Transfer market player — includes Xamarin fields (auctionId, bid, etc.) and Android fields.</summary>
public sealed class TransferPlayerData
{
    public Guid Id { get; init; }
    public string Name { get; init; } = string.Empty;
    public string Country { get; init; } = "de";
    public decimal Strength { get; init; }
    public int Talent { get; init; }
    public int Age { get; init; }
    public int Position { get; init; }
    public string Head { get; init; } = "01_head-A01";
    public string EndDate { get; init; } = string.Empty;

    // Xamarin auction fields
    public Guid AuctionId { get; init; }
    public string BidTeamName { get; init; } = string.Empty;
    public string BidTeamLogo { get; init; } = string.Empty;
    public long Bid { get; init; }
    public bool IsFrozen { get; init; }

    // Android compat
    public int MinimumBid => (int)Bid;
}
