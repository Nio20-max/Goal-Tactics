namespace GoalTactics.Application.Auth;

public interface IAuthStore
{
    Task<AuthUserRecord?> GetUserByEmailAsync(string email, CancellationToken cancellationToken = default);

    Task<AuthUserRecord?> GetUserByIdAsync(string userId, CancellationToken cancellationToken = default);

    Task<bool> IsManagerNameTakenAsync(string managerName, CancellationToken cancellationToken = default);

    Task<bool> AddUserAsync(AuthUserRecord user, CancellationToken cancellationToken = default);

    Task AddSessionAsync(AuthSessionRecord session, CancellationToken cancellationToken = default);

    Task<bool> IsSessionActiveAsync(string tokenId, CancellationToken cancellationToken = default);

    Task RevokeSessionAsync(string tokenId, CancellationToken cancellationToken = default);
}

public sealed record AuthUserRecord(string UserId, string Email, string PasswordHash, string ManagerName);

public sealed record AuthSessionRecord(
    string SessionId,
    string UserId,
    string TokenId,
    DateTime IssuedAtUtc,
    DateTime ExpiresAtUtc,
    DateTime? RevokedAtUtc,
    string? ClientVersion,
    string? Capabilities,
    string? Platform,
    string? DeviceId);
