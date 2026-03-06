using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Friends;

public sealed class ChallengeReplyRequest : IdRequest
{
    public bool Accept { get; init; }
}
