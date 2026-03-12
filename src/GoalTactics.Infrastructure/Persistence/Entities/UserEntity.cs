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

    public int FailedLoginAttempts { get; set; }

    public DateTime? LockedUntilUtc { get; set; }

    public bool EmailVerified { get; set; }

    public string? EmailVerificationToken { get; set; }

    public DateTime? EmailVerificationTokenExpiresUtc { get; set; }

    public string? PasswordResetToken { get; set; }

    public DateTime? PasswordResetTokenExpiresUtc { get; set; }

    public ICollection<UserSessionEntity> Sessions { get; set; } = new List<UserSessionEntity>();
}
