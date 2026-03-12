namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class AuctionBidEntity
{
    public required string Id { get; set; }

    public required string AuctionId { get; set; }

    public required string TeamId { get; set; }

    public string? TeamName { get; set; }

    public long Amount { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public AuctionEntity? Auction { get; set; }
}
