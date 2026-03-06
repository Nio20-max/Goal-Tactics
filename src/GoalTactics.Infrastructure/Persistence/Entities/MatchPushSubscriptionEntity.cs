namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class MatchPushSubscriptionEntity
{
    public required string UserId { get; set; }

    public required string MatchId { get; set; }

    public DateTime EnabledAtUtc { get; set; }

    public UserEntity? User { get; set; }
}
