using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.User;

public sealed class EnableMatchPushResponse : ResponseObject
{
    public Guid MatchId { get; init; }

    public bool IsEnabled { get; init; }
}
