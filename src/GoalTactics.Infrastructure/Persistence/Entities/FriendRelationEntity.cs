namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class FriendRelationEntity
{
    public required string Id { get; set; }

    public required string PairKey { get; set; }

    public required string RequesterUserId { get; set; }

    public required string AddresseeUserId { get; set; }

    public int Status { get; set; }

    public bool IsLikedByRequester { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime UpdatedAtUtc { get; set; }
}
