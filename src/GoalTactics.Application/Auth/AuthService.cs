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
}
