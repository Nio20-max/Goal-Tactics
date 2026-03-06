namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class ChatPresenceEntity
{
    public required string UserId { get; set; }

    public DateTime LastTypingAtUtc { get; set; }

    public DateTime LastSeenAtUtc { get; set; }

    public UserEntity? User { get; set; }
}
