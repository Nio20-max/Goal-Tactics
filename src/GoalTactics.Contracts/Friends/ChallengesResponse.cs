using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Friends;

public sealed class ChallengesResponse : ResponseObject
{
    public IReadOnlyList<ChallengeData> Challenges { get; init; } = [];

    public IReadOnlyList<FriendData> Friends { get; init; } = [];

    public string? MatchDate { get; init; }

    public string? EndDate { get; init; }
}
