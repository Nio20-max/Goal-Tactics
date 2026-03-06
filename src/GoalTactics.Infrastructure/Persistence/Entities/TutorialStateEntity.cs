namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TutorialStateEntity
{
    public required string UserId { get; set; }

    public string? CurrentTopicId { get; set; }

    public DateTime UpdatedAtUtc { get; set; }

    public UserEntity? User { get; set; }
}
