namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class UserEntity
{
    public required string Id { get; set; }

    public required string ManagerName { get; set; }

    public required string Email { get; set; }

    public required string PasswordHash { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public DateTime? LastLoginAtUtc { get; set; }

    public DateTime? LastActivityAtUtc { get; set; }

    public DateTime? DeletedAtUtc { get; set; }

    public ICollection<UserSessionEntity> Sessions { get; set; } = new List<UserSessionEntity>();
}
