namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class ChatMessageEntity
{
    public required string Id { get; set; }

    public required string UserId { get; set; }

    public string Channel { get; set; } = "global";

    public string? GroupKey { get; set; }

    public string? TargetUserId { get; set; }

    public required string Message { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public UserEntity? User { get; set; }
}
