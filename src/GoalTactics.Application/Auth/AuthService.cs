using GoalTactics.Application.Abstractions;
using GoalTactics.Contracts.Auth;

namespace GoalTactics.Application.Auth;

public interface IAuthService
{
    Task<RegisterResponse> RegisterAsync(RegisterRequest request, CancellationToken cancellationToken = default);

    Task<AuthResponse> LoginAsync(AuthRequest request, CancellationToken cancellationToken = default);

    Task<AuthResponse> VerifyLoginAsync(string token, CancellationToken cancellationToken = default);

    Task LogoutAsync(string tokenId, CancellationToken cancellationToken = default);
}

public sealed class AuthService(IAuthStore authStore, IPasswordHasher passwordHasher, ITokenService tokenService) : IAuthService
{
    public async Task<RegisterResponse> RegisterAsync(RegisterRequest request, CancellationToken cancellationToken = default)
    {
        var email = request.ResolvedEmail;
        var managerName = request.ResolvedManagerName;

        var existingUser = email is not null ? await authStore.GetUserByEmailAsync(email, cancellationToken) : null;
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
            email!,
            passwordHasher.Hash(request.Password),
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
            Status = 1
        };
    }

    public async Task<AuthResponse> LoginAsync(AuthRequest request, CancellationToken cancellationToken = default)
    {
        var login = request.ResolvedLogin;
        var user = login is not null ? await authStore.GetUserByEmailAsync(login, cancellationToken) : null;
        if (user is null || !passwordHasher.Verify(request.Password, user.PasswordHash))
        {
            return new AuthResponse
            {
                Success = false,
                Message = "Invalid credentials"
            };
        }

        var issuedAt = DateTime.UtcNow;
        var tokenId = Guid.NewGuid().ToString("N");
        var expiresAt = tokenService.GetExpiryUtc(issuedAt);
        var token = tokenService.CreateToken(user.UserId, user.ManagerName, tokenId);

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
            DeviceId: null), cancellationToken);

        return new AuthResponse
        {
            Success = true,
            Token = token,
            ManagerName = user.ManagerName,
            UserId = Guid.TryParse(user.UserId, out var uid) ? uid : null,
            Message = "Authenticated"
        };
    }

    public async Task<AuthResponse> VerifyLoginAsync(string token, CancellationToken cancellationToken = default)
    {
        var validation = tokenService.ValidateToken(token);
        if (!validation.IsValid || string.IsNullOrWhiteSpace(validation.UserId) || string.IsNullOrWhiteSpace(validation.TokenId))
        {
            return new AuthResponse
            {
                Success = false,
                Message = "Invalid token"
            };
        }

        var isActive = await authStore.IsSessionActiveAsync(validation.TokenId, cancellationToken);
        if (!isActive)
        {
            return new AuthResponse
            {
                Success = false,
                Message = "Invalid token"
            };
        }

        var user = await authStore.GetUserByIdAsync(validation.UserId, cancellationToken);
        if (user is null)
        {
            return new AuthResponse
            {
                Success = false,
                Message = "Invalid token"
            };
        }

        return new AuthResponse
        {
            Success = true,
            Token = token,
            ManagerName = user.ManagerName,
            Message = "Token valid"
        };
    }

    public Task LogoutAsync(string tokenId, CancellationToken cancellationToken = default)
    {
        return authStore.RevokeSessionAsync(tokenId, cancellationToken);
    }
}
