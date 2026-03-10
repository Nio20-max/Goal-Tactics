namespace GoalTactics.Contracts.Friends;

public sealed class FriendData
{
    public string? UserName { get; init; }
    public string? TeamName { get; init; }
    public string? Country { get; init; }
    public string? TeamLogo { get; init; }
    public int Strength { get; init; }
    public string? LastActivity { get; init; }
    public string? Language { get; init; }
    public bool MyLike { get; init; }
    public bool LikesMe { get; init; }
    public Guid TeamId { get; init; }
    public Guid ChallengeId { get; init; }
    public int ChallengeStatus { get; init; }
}
