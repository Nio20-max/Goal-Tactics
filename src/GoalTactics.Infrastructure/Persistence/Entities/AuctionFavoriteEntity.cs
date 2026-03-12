namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class AuctionFavoriteEntity
{
    public required string UserId { get; set; }

    public required string AuctionId { get; set; }

    public AuctionEntity? Auction { get; set; }
}
