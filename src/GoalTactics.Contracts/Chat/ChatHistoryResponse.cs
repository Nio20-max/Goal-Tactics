using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Chat;

public sealed class ChatHistoryResponse : ResponseObject
{
    public IReadOnlyList<ChatMessageData> Messages { get; init; } = [];
    public Guid UserId { get; init; }
    public string Channel { get; init; } = "global";
    public Guid? TargetUserId { get; init; }
    public string? GroupKey { get; init; }
}
