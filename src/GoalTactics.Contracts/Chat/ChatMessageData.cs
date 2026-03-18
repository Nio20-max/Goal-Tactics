namespace GoalTactics.Contracts.Chat;

public sealed class ChatMessageData
{
    public Guid Id { get; init; }
    public Guid UserId { get; init; }
    public Guid? TargetUserId { get; init; }
    public Guid TeamId { get; init; }
    public string? Logo { get; init; }
    public string? Date { get; init; }
    public string? Name { get; init; }
    public string? Message { get; init; }
    public string? Channel { get; init; }
    public string? GroupKey { get; init; }
    public bool IsAdmin { get; init; }
    public bool IsMine { get; init; }
    public bool IsNewUser { get; init; }
}
