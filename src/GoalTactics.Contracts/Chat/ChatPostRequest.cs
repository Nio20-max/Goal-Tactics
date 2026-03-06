using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Chat;

public sealed class ChatPostRequest : RequestObject
{
    public string? Message { get; init; }
}
