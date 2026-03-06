namespace GoalTactics.Application.Friends;

public interface IFriendsStore
{
    Task<IReadOnlyList<FriendRecord>> GetFriendsAsync(string userId, string? queryText, CancellationToken cancellationToken = default);

    Task<string?> FindFriendNameAsync(string? queryText, CancellationToken cancellationToken = default);

    Task LikeAsync(string userId, Guid targetId, CancellationToken cancellationToken = default);

    Task UnlikeAsync(string userId, Guid targetId, CancellationToken cancellationToken = default);

    Task AcceptAsync(string userId, Guid relationId, CancellationToken cancellationToken = default);

    Task DeclineAsync(string userId, Guid relationId, CancellationToken cancellationToken = default);

    Task<ChallengeOverviewRecord> GetChallengesAsync(string userId, CancellationToken cancellationToken = default);

    Task<ChallengeOverviewRecord> SendChallengeAsync(string userId, Guid targetId, CancellationToken cancellationToken = default);

    Task<ChallengeOverviewRecord> ReplyChallengeAsync(string userId, Guid challengeId, bool accept, CancellationToken cancellationToken = default);
}

public sealed record FriendRecord(
    string RelationId,
    string ForeignUserId,
    string ForeignTeamId,
    string Name,
    bool IsFriend,
    bool IsRequestIncoming,
    bool IsRequestOutgoing,
    bool IsLiked);

public sealed record ChallengeRecord(
    string Id,
    string ForeignTeamId,
    string OpponentName,
    bool Accepted,
    DateTime MatchDateUtc);

public sealed record ChallengeOverviewRecord(
    IReadOnlyList<ChallengeRecord> Challenges,
    IReadOnlyList<FriendRecord> Friends,
    DateTime MatchDateUtc,
    DateTime EndDateUtc);
