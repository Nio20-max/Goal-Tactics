namespace GoalTactics.Contracts.Friends;

public sealed class FriendData
{
    // Android fields
    public Guid Id { get; init; }
    public Guid ForeignUserId { get; init; }
    public Guid ForeignTeamId { get; init; }
    public string? Name { get; init; }
    public bool IsFriend { get; init; }
    public bool IsRequestIncoming { get; init; }
    public bool IsRequestOutgoing { get; init; }
    public bool IsLiked { get; init; }

    // Xamarin fields
    public Guid TeamId { get; init; }
    public string? UserName { get; init; }
    public string? TeamName { get; init; }
    public string? Country { get; init; }
    public string? TeamLogo { get; init; }
    public int Strength { get; init; }
    public string? LastActivity { get; init; }
    public string? Language { get; init; }
    public bool MyLike { get; init; }
    public bool LikesMe { get; init; }
    public int ChallengeStatus { get; init; }
    public Guid ChallengeId { get; init; }
}
