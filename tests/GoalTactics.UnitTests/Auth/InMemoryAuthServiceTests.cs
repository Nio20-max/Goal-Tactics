using GoalTactics.Application.Auth;
using GoalTactics.Application.Abstractions;
using GoalTactics.Contracts.Auth;

namespace GoalTactics.UnitTests.Auth;

public sealed class InMemoryAuthServiceTests
{
    [Fact]
    public async Task Register_ThenLogin_ThenVerify_Works()
    {
        var service = new AuthService(new FakeAuthStore(), new FakePasswordHasher(), new FakeTokenService());

        var register = await service.RegisterAsync(new RegisterRequest
        {
            Email = "manager@example.com",
            Password = "pass123",
            ManagerName = "ManagerOne"
        });

        Assert.True(register.Success);
        Assert.False(string.IsNullOrWhiteSpace(register.UserId));

        var login = await service.LoginAsync(new AuthRequest
        {
            Email = "manager@example.com",
            Password = "pass123"
        });

        Assert.True(login.Success);
        Assert.False(string.IsNullOrWhiteSpace(login.Token));
        Assert.Equal("ManagerOne", login.ManagerName);

        var verify = await service.VerifyLoginAsync(login.Token!);
        Assert.True(verify.Success);
        Assert.Equal("ManagerOne", verify.ManagerName);
    }

    [Fact]
    public async Task Login_WithWrongPassword_Fails()
    {
        var service = new AuthService(new FakeAuthStore(), new FakePasswordHasher(), new FakeTokenService());
        await service.RegisterAsync(new RegisterRequest
        {
            Email = "manager@example.com",
            Password = "pass123",
            ManagerName = "ManagerOne"
        });

        var login = await service.LoginAsync(new AuthRequest
        {
            Email = "manager@example.com",
            Password = "wrong"
        });

        Assert.False(login.Success);
        Assert.Equal("Invalid credentials", login.Message);
    }

    private sealed class FakePasswordHasher : IPasswordHasher
    {
        public string Hash(string password) => $"hash::{password}";

        public bool Verify(string password, string hash) => hash == Hash(password);
    }

    private sealed class FakeAuthStore : IAuthStore
    {
        private readonly Dictionary<string, AuthUserRecord> usersByEmail = new(StringComparer.OrdinalIgnoreCase);
        private readonly Dictionary<string, AuthUserRecord> usersById = new(StringComparer.Ordinal);
        private readonly Dictionary<string, AuthSessionRecord> sessionsByTokenId = new(StringComparer.Ordinal);

        public Task<AuthUserRecord?> GetUserByEmailAsync(string email, CancellationToken cancellationToken = default)
        {
            usersByEmail.TryGetValue(email, out var user);
            return Task.FromResult<AuthUserRecord?>(user);
        }

        public Task<AuthUserRecord?> GetUserByIdAsync(string userId, CancellationToken cancellationToken = default)
        {
            usersById.TryGetValue(userId, out var user);
            return Task.FromResult<AuthUserRecord?>(user);
        }

        public Task<bool> AddUserAsync(AuthUserRecord user, CancellationToken cancellationToken = default)
        {
            if (usersByEmail.ContainsKey(user.Email))
            {
                return Task.FromResult(false);
            }

            usersByEmail[user.Email] = user;
            usersById[user.UserId] = user;
            return Task.FromResult(true);
        }

        public Task AddSessionAsync(AuthSessionRecord session, CancellationToken cancellationToken = default)
        {
            sessionsByTokenId[session.TokenId] = session;
            return Task.CompletedTask;
        }

        public Task<bool> IsSessionActiveAsync(string tokenId, CancellationToken cancellationToken = default)
        {
            var now = DateTime.UtcNow;
            var isActive = sessionsByTokenId.TryGetValue(tokenId, out var session)
                && session.RevokedAtUtc is null
                && session.ExpiresAtUtc > now;
            return Task.FromResult(isActive);
        }

        public Task RevokeSessionAsync(string tokenId, CancellationToken cancellationToken = default)
        {
            if (sessionsByTokenId.TryGetValue(tokenId, out var session))
            {
                sessionsByTokenId[tokenId] = session with { RevokedAtUtc = DateTime.UtcNow };
            }

            return Task.CompletedTask;
        }

        public Task<bool> IsManagerNameTakenAsync(string managerName, CancellationToken cancellationToken = default)
        {
            var taken = usersByEmail.Values.Any(u => string.Equals(u.ManagerName, managerName, StringComparison.OrdinalIgnoreCase));
            return Task.FromResult(taken);
        }
    }

    private sealed class FakeTokenService : ITokenService
    {
        public string CreateToken(string userId, string managerName, string tokenId) => $"token::{userId}::{managerName}::{tokenId}";

        public DateTime GetExpiryUtc(DateTime utcNow) => utcNow.AddHours(1);

        public TokenValidationResult ValidateToken(string token)
        {
            var parts = token.Split("::");
            if (parts.Length != 4 || parts[0] != "token")
            {
                return new TokenValidationResult(false, null, null, null);
            }

            return new TokenValidationResult(true, parts[1], parts[2], parts[3]);
        }
    }
}
