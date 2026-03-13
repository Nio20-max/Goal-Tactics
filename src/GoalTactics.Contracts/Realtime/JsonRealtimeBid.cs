namespace GoalTactics.Contracts.Realtime;

public sealed class JsonRealtimeBid
{
    public Guid AuctionID { get; init; }

    public string EndDate { get; init; } = string.Empty;

    public Guid BidTeamId { get; init; }

    public string BidTeamName { get; init; } = string.Empty;

    public string BidTeamLogo { get; init; } = string.Empty;

    public decimal Bid { get; init; }

    public decimal BidIncrement { get; init; }
}
