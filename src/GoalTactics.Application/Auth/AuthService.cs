using System.Security.Cryptography;
using GoalTactics.Application.Abstractions;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;

namespace GoalTactics.Application.Auth;

public interface IAuthService
{
    Task<RegisterResponse> RegisterAsync(RegisterRequest request, CancellationToken cancellationToken = default);

    Task<AuthResponse> LoginAsync(AuthRequest request, CancellationToken cancellationToken = default);

    Task<AuthResponse> VerifyLoginAsync(string token, CancellationToken cancellationToken = default);

    Task LogoutAsync(string tokenId, CancellationToken cancellationToken = default);

    Task<AuthResponse> RefreshTokenAsync(string refreshToken, CancellationToken cancellationToken = default);

    Task<ResponseObject> RequestPasswordResetAsync(string email, CancellationToken cancellationToken = default);

    Task<ResponseObject> ConfirmPasswordResetAsync(string email, string token, string newPassword, CancellationToken cancellationToken = default);

    Task<ResponseObject> VerifyEmailAsync(string userId, string token, CancellationToken cancellationToken = default);

    Task<ResponseObject> ResendEmailVerificationAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class AuthService(IAuthStore authStore, IPasswordHasher passwordHasher, ITokenService tokenService) : IAuthService
{
    private const int MaxFailedAttempts = 5;
    private static readonly TimeSpan LockoutDuration = TimeSpan.FromMinutes(15);
    private static readonly TimeSpan RefreshTokenLifetime = TimeSpan.FromDays(30);
    private static readonly TimeSpan PasswordResetTokenLifetime = TimeSpan.FromHours(1);
    private static readonly TimeSpan EmailVerificationTokenLifetime = TimeSpan.FromDays(7);

    private static string GenerateSecureToken()
    {
        return Convert.ToBase64String(RandomNumberGenerator.GetBytes(32));
    }
    public async Task<RegisterResponse> RegisterAsync(RegisterRequest request, CancellationToken cancellationToken = default)
    {
        var managerName = request.ResolvedManagerName;

        // For guest registration, generate credentials server-side.
        string email;
        string password;
        if (request.IsGuest)
        {
            var guestId = Guid.NewGuid().ToString("N")[..12];
            email = $"guest_{guestId}@guests.goaltactics.local";
            password = Guid.NewGuid().ToString("N");
        }
        else
        {
            email = request.ResolvedEmail!;
            password = request.Password!;
        }

        var existingUser = await authStore.GetUserByEmailAsync(email, cancellationToken);
        if (existingUser is not null)
        {
            return new RegisterResponse
            {
                Success = false,
                Message = "Email already registered",
                ErrorMessage = "Email already registered",
                Status = 2
            };
        }

        var user = new AuthUserRecord(
            Guid.NewGuid().ToString("N"),
            email,
            passwordHasher.Hash(password),
            managerName!);

        var added = await authStore.AddUserAsync(user, cancellationToken);
        if (!added)
        {
            return new RegisterResponse
            {
                Success = false,
                Message = "Email already registered",
                ErrorMessage = "Email already registered",
                Status = 2
            };
        }

        return new RegisterResponse
        {
            Success = true,
            UserId = user.UserId,
            Message = "Registered",
            Login = email,
            Password = password,
            Status = 1
        };
    }

    public async Task<AuthResponse> LoginAsync(AuthRequest request, CancellationToken cancellationToken = default)
    {
        var login = request.ResolvedLogin;
        var user = login is not null ? await authStore.GetUserByEmailAsync(login, cancellationToken) : null;

        if (user is null)
        {
            return new AuthResponse { Success = false, Message = "Invalid credentials" };
        }

        // Check account lockout
        if (user.LockedUntilUtc.HasValue && user.LockedUntilUtc.Value > DateTime.UtcNow)
        {
            return new AuthResponse { Success = false, Message = "Account is temporarily locked. Try again later." };
        }

        if (!passwordHasher.Verify(request.Password, user.PasswordHash))
        {
            await authStore.RecordFailedLoginAsync(user.UserId, cancellationToken);

            // Lock after too many failed attempts
            if (user.FailedLoginAttempts + 1 >= MaxFailedAttempts)
            {
                await authStore.LockAccountAsync(user.UserId, DateTime.UtcNow.Add(LockoutDuration), cancellationToken);
                return new AuthResponse { Success = false, Message = "Account locked due to too many failed attempts. Try again in 15 minutes." };
            }

            return new AuthResponse { Success = false, Message = "Invalid credentials" };
        }

        // Successful login — reset failed attempts
        if (user.FailedLoginAttempts > 0)
        {
            await authStore.ResetFailedLoginsAsync(user.UserId, cancellationToken);
        }

        var issuedAt = DateTime.UtcNow;
        var tokenId = Guid.NewGuid().ToString("N");
        var expiresAt = tokenService.GetExpiryUtc(issuedAt);
        var token = tokenService.CreateToken(user.UserId, user.ManagerName, tokenId);
        var refreshToken = GenerateSecureToken();

        await authStore.AddSessionAsync(new AuthSessionRecord(
            SessionId: Guid.NewGuid().ToString("N"),
            UserId: user.UserId,
            TokenId: tokenId,
            IssuedAtUtc: issuedAt,
            ExpiresAtUtc: expiresAt,
            RevokedAtUtc: null,
            ClientVersion: null,
            Capabilities: null,
            Platform: null,
            DeviceId: null,
            RefreshToken: refreshToken,
            RefreshTokenExpiresUtc: issuedAt.Add(RefreshTokenLifetime)), cancellationToken);

        return new AuthResponse
        {
            Success = true,
            Token = token,
            RefreshToken = refreshToken,
            ManagerName = user.ManagerName,
            UserId = Guid.TryParse(user.UserId, out var uid) ? uid : Guid.Empty,
            Message = "Authenticated"
        };
    }

    public async Task<AuthResponse> VerifyLoginAsync(string text, CancellationToken cancellationToken = default)
    {
        // Try JWT token validation first (session resume flow).
        var validation = tokenService.ValidateToken(text);
        if (validation.IsValid && !string.IsNullOrWhiteSpace(validation.UserId) && !string.IsNullOrWhiteSpace(validation.TokenId))
        {
            var isActive = await authStore.IsSessionActiveAsync(validation.TokenId, cancellationToken);
            if (isActive)
            {
                var user = await authStore.GetUserByIdAsync(validation.UserId, cancellationToken);
                if (user is not null)
                {
                    return new AuthResponse
                    {
                        Success = true,
                        Token = text,
                        ManagerName = user.ManagerName,
                        UserId = Guid.TryParse(user.UserId, out var uid2) ? uid2 : Guid.Empty,
                        Message = "Token valid"
                    };
                }
            }
        }

        // Fallback: treat text as a manager-name availability check (registration flow).
        var nameTaken = await authStore.IsManagerNameTakenAsync(text, cancellationToken);
        if (nameTaken)
        {
            return new AuthResponse
            {
                Success = false,
                Message = "Manager name already taken"
            };
        }

        return new AuthResponse
        {
            Success = true,
            Message = "Name available"
        };
    }

    public Task LogoutAsync(string tokenId, CancellationToken cancellationToken = default)
    {
        return authStore.RevokeSessionAsync(tokenId, cancellationToken);
    }

    public async Task<AuthResponse> RefreshTokenAsync(string refreshToken, CancellationToken cancellationToken = default)
    {
        var session = await authStore.GetSessionByRefreshTokenAsync(refreshToken, cancellationToken);
        if (session is null || session.RevokedAtUtc.HasValue)
        {
            return new AuthResponse { Success = false, Message = "Invalid refresh token" };
        }

        if (session.RefreshTokenExpiresUtc.HasValue && session.RefreshTokenExpiresUtc.Value < DateTime.UtcNow)
        {
            return new AuthResponse { Success = false, Message = "Refresh token expired" };
        }

        var user = await authStore.GetUserByIdAsync(session.UserId, cancellationToken);
        if (user is null)
        {
            return new AuthResponse { Success = false, Message = "User not found" };
        }

        // Rotate: mark old session's refresh token as used
        await authStore.MarkRefreshTokenUsedAsync(session.SessionId, cancellationToken);

        // Issue new JWT + new refresh token
        var issuedAt = DateTime.UtcNow;
        var newTokenId = Guid.NewGuid().ToString("N");
        var expiresAt = tokenService.GetExpiryUtc(issuedAt);
        var newJwt = tokenService.CreateToken(user.UserId, user.ManagerName, newTokenId);
        var newRefreshToken = GenerateSecureToken();

        await authStore.AddSessionAsync(new AuthSessionRecord(
            SessionId: Guid.NewGuid().ToString("N"),
            UserId: user.UserId,
            TokenId: newTokenId,
            IssuedAtUtc: issuedAt,
            ExpiresAtUtc: expiresAt,
            RevokedAtUtc: null,
            ClientVersion: session.ClientVersion,
            Capabilities: session.Capabilities,
            Platform: session.Platform,
            DeviceId: session.DeviceId,
            RefreshToken: newRefreshToken,
            RefreshTokenExpiresUtc: issuedAt.Add(RefreshTokenLifetime)), cancellationToken);

        return new AuthResponse
        {
            Success = true,
            Token = newJwt,
            RefreshToken = newRefreshToken,
            ManagerName = user.ManagerName,
            UserId = Guid.TryParse(user.UserId, out var uid) ? uid : Guid.Empty,
            Message = "Token refreshed"
        };
    }

    public async Task<ResponseObject> RequestPasswordResetAsync(string email, CancellationToken cancellationToken = default)
    {
        var user = await authStore.GetUserByEmailAsync(email, cancellationToken);
        if (user is null)
        {
            // Return success even if user not found to prevent email enumeration
            return new ResponseObject { Success = true, Message = "If the email exists, a reset link has been sent." };
        }

        var token = GenerateSecureToken();
        var expiresUtc = DateTime.UtcNow.Add(PasswordResetTokenLifetime);
        await authStore.SetPasswordResetTokenAsync(user.UserId, token, expiresUtc, cancellationToken);

        // In production, send email here. For now, the token is stored and can be
        // retrieved via the API for testing. Log it server-side only.
        return new ResponseObject { Success = true, Message = "If the email exists, a reset link has been sent." };
    }

    public async Task<ResponseObject> ConfirmPasswordResetAsync(string email, string token, string newPassword, CancellationToken cancellationToken = default)
    {
        var newHash = passwordHasher.Hash(newPassword);
        var result = await authStore.ResetPasswordAsync(email, token, newHash, cancellationToken);
        if (!result)
        {
            return new ResponseObject { Success = false, Message = "Invalid or expired reset token." };
        }

        return new ResponseObject { Success = true, Message = "Password has been reset." };
    }

    public async Task<ResponseObject> VerifyEmailAsync(string userId, string token, CancellationToken cancellationToken = default)
    {
        var result = await authStore.VerifyEmailAsync(userId, token, cancellationToken);
        if (!result)
        {
            return new ResponseObject { Success = false, Message = "Invalid or expired verification token." };
        }

        return new ResponseObject { Success = true, Message = "Email verified." };
    }

    public async Task<ResponseObject> ResendEmailVerificationAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await authStore.GetUserByIdAsync(userId, cancellationToken);
        if (user is null)
        {
            return new ResponseObject { Success = false, Message = "User not found." };
        }

        if (user.EmailVerified)
        {
            return new ResponseObject { Success = true, Message = "Email already verified." };
        }

        var token = GenerateSecureToken();
        var expiresUtc = DateTime.UtcNow.Add(EmailVerificationTokenLifetime);
        await authStore.SetEmailVerificationTokenAsync(userId, token, expiresUtc, cancellationToken);

        // In production, send verification email here.
        return new ResponseObject { Success = true, Message = "Verification email sent." };
    }
}
