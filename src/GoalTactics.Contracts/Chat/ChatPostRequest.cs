using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Chat;

public sealed class ChatPostRequest : RequestObject
{
    public string? Message { get; init; }

    /// <summary>Allowed values: global, group, private.</summary>
    public string? Channel { get; init; }

    /// <summary>Required for private chat messages.</summary>
    public Guid? TargetUserId { get; init; }
}
