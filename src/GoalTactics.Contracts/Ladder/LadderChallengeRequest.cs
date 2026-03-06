using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Ladder;

public sealed class LadderChallengeRequest : RequestObject
{
    public Guid TeamId { get; init; }
}
