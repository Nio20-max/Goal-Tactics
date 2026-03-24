namespace GoalTactics.Application.Auth;

public interface IAuthStore
{
    Task<AuthUserRecord?> GetUserByEmailAsync(string email, CancellationToken cancellationToken = default);

    Task<AuthUserRecord?> GetUserByIdAsync(string userId, CancellationToken cancellationToken = default);

    Task<bool> IsManagerNameTakenAsync(string managerName, CancellationToken cancellationToken = default);

    Task<bool> AddUserAsync(AuthUserRecord user, bool isBotRegistration = false, CancellationToken cancellationToken = default);

    Task AddSessionAsync(AuthSessionRecord session, CancellationToken cancellationToken = default);

    Task<bool> IsSessionActiveAsync(string tokenId, CancellationToken cancellationToken = default);

    Task RevokeSessionAsync(string tokenId, CancellationToken cancellationToken = default);

    /// <summary>Increment the failed login attempt counter for the user.</summary>
    Task RecordFailedLoginAsync(string userId, CancellationToken cancellationToken = default);

    /// <summary>Reset failed login counter on successful login.</summary>
    Task ResetFailedLoginsAsync(string userId, CancellationToken cancellationToken = default);

    /// <summary>Lock the account until the specified UTC time.</summary>
    Task LockAccountAsync(string userId, DateTime lockedUntilUtc, CancellationToken cancellationToken = default);

    /// <summary>Store an email verification token for the user.</summary>
    Task SetEmailVerificationTokenAsync(string userId, string token, DateTime expiresUtc, CancellationToken cancellationToken = default);

    /// <summary>Verify the email using the provided token.</summary>
    Task<bool> VerifyEmailAsync(string userId, string token, CancellationToken cancellationToken = default);

    /// <summary>Store a password-reset token for the user.</summary>
    Task SetPasswordResetTokenAsync(string userId, string token, DateTime expiresUtc, CancellationToken cancellationToken = default);

    /// <summary>Validate the password-reset token and apply a new password hash.</summary>
    Task<bool> ResetPasswordAsync(string email, string token, string newPasswordHash, CancellationToken cancellationToken = default);

    /// <summary>Find a session by its refresh token.</summary>
    Task<AuthSessionRecord?> GetSessionByRefreshTokenAsync(string refreshToken, CancellationToken cancellationToken = default);

    /// <summary>Mark a refresh token as used (consumed) to prevent replay.</summary>
    Task MarkRefreshTokenUsedAsync(string sessionId, CancellationToken cancellationToken = default);
}

public sealed record AuthUserRecord(
    string UserId, string Email, string PasswordHash, string ManagerName,
    int FailedLoginAttempts = 0, DateTime? LockedUntilUtc = null, bool EmailVerified = false);

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
    string? DeviceId,
    string? RefreshToken = null,
    DateTime? RefreshTokenExpiresUtc = null);
