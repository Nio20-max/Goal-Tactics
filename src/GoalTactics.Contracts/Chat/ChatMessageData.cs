namespace GoalTactics.Contracts.Chat;

public sealed class ChatMessageData
{
    public Guid Id { get; init; }

    public Guid UserId { get; init; }

    public string? UserName { get; init; }

    public string? Message { get; init; }

    public string? CreatedAt { get; init; }
}
