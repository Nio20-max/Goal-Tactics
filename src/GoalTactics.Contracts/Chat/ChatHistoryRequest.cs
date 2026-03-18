using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Chat;

public sealed class ChatHistoryRequest : RequestObject
{
    /// <summary>Allowed values: global, group, private. Defaults to global.</summary>
    public string? Channel { get; init; }

    /// <summary>Required when Channel is private.</summary>
    public Guid? TargetUserId { get; init; }
}
