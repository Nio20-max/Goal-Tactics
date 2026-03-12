namespace GoalTactics.Contracts.TransferMarket;

/// <summary>Transfer market player — includes Xamarin fields (auctionId, bid, etc.) and Android fields.</summary>
public sealed class TransferPlayerData
{
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public string? Country { get; init; }
    public decimal Strength { get; init; }
    public int Talent { get; init; }
    public int Age { get; init; }
    public int Position { get; init; }
    public string? Head { get; init; }
    public string? EndDate { get; init; }

    // Xamarin auction fields
    public Guid AuctionId { get; init; }
    public string? BidTeamName { get; init; }
    public string? BidTeamLogo { get; init; }
    public long Bid { get; init; }
    public bool IsFrozen { get; init; }

    // Android compat
    public int MinimumBid => (int)Bid;
}
