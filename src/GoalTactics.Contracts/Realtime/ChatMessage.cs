namespace GoalTactics.Contracts.Realtime;

public sealed class ChatMessage
{
    public Guid Id { get; init; }

    public Guid UserId { get; init; }

    public string? UserName { get; init; }

    public string? Text { get; init; }

    public string? CreatedAt { get; init; }
}
