namespace GoalTactics.Contracts.Realtime;

public sealed class JsonRealtimeBid
{
    public Guid AuctionId { get; init; }

    public Guid TeamId { get; init; }

    public int Bid { get; init; }

    public string? CreatedAt { get; init; }
}
