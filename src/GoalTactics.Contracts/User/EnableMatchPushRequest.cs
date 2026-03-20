using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.User;

public sealed class EnableMatchPushRequest : RequestObject
{
    public Guid MatchId { get; init; }

    public bool? Enabled { get; init; }

    public string? DeviceToken { get; init; }
}
