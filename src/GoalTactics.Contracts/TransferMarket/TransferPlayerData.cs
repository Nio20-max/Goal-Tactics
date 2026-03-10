namespace GoalTactics.Contracts.TransferMarket;

/// <summary>TransfermarketPlayerData : PlayerData in decompiled app.</summary>
public sealed class TransferPlayerData
{
    // PlayerData base fields
    public Guid ID { get; init; }
    public string? Name { get; init; }
    public string? Country { get; init; }
    public string? Head { get; init; }
    public decimal Strength { get; init; }
    public int Talent { get; init; }
    public int Age { get; init; }
    public int Position { get; init; }
    public string? EndDate { get; init; }
    // TransfermarketPlayerData specific
    public Guid AuctionId { get; init; }
    public bool IsFrozen { get; init; }
    public string? BidTeamName { get; init; }
    public string? BidTeamLogo { get; init; }
    public decimal Bid { get; init; }
}
