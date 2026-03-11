namespace GoalTactics.Contracts.Friends;

public sealed class FriendData
{
    public Guid Id { get; init; }
    public Guid ForeignUserId { get; init; }
    public Guid ForeignTeamId { get; init; }
    public string? Name { get; init; }
    public bool IsFriend { get; init; }
    public bool IsRequestIncoming { get; init; }
    public bool IsRequestOutgoing { get; init; }
    public bool IsLiked { get; init; }
}
