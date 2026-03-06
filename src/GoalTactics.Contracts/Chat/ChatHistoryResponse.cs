using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Chat;

public sealed class ChatHistoryResponse : ResponseObject
{
    public IReadOnlyList<ChatMessageData> Messages { get; init; } = [];
}
