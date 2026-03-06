namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class UserSessionEntity
{
    public required string Id { get; set; }

    public required string UserId { get; set; }

    public required string TokenId { get; set; }

    public DateTime IssuedAtUtc { get; set; }

    public DateTime ExpiresAtUtc { get; set; }

    public DateTime? RevokedAtUtc { get; set; }

    public string? ClientVersion { get; set; }

    public string? Capabilities { get; set; }

    public string? Platform { get; set; }

    public string? DeviceId { get; set; }

    public UserEntity? User { get; set; }
}
