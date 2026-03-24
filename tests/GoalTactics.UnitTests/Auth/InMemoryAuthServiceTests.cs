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

    [Fact]
    public async Task Account_Locks_After_5_Failed_Attempts()
    {
        var service = new AuthService(new FakeAuthStore(), new FakePasswordHasher(), new FakeTokenService());
        await service.RegisterAsync(new RegisterRequest
        {
            Email = "lockme@example.com",
            Password = "pass123",
            ManagerName = "LockTest"
        });

        for (var i = 0; i < 5; i++)
        {
            await service.LoginAsync(new AuthRequest { Email = "lockme@example.com", Password = "wrong" });
        }

        // Even correct password should fail now due to lockout
        var lockedLogin = await service.LoginAsync(new AuthRequest { Email = "lockme@example.com", Password = "pass123" });
        Assert.False(lockedLogin.Success);
        Assert.Contains("locked", lockedLogin.Message, StringComparison.OrdinalIgnoreCase);
    }

    [Fact]
    public async Task Refresh_Token_Rotation_Works()
    {
        var service = new AuthService(new FakeAuthStore(), new FakePasswordHasher(), new FakeTokenService());
        await service.RegisterAsync(new RegisterRequest
        {
            Email = "refresh@example.com",
            Password = "pass123",
            ManagerName = "RefreshUser"
        });

        var login = await service.LoginAsync(new AuthRequest
        {
            Email = "refresh@example.com",
            Password = "pass123"
        });

        Assert.True(login.Success);
        Assert.NotNull(login.RefreshToken);

        var refreshed = await service.RefreshTokenAsync(login.RefreshToken!);
        Assert.True(refreshed.Success);
        Assert.NotNull(refreshed.Token);
        Assert.NotNull(refreshed.RefreshToken);
        Assert.NotEqual(login.RefreshToken, refreshed.RefreshToken);

        // Old refresh token should no longer work
        var replayAttempt = await service.RefreshTokenAsync(login.RefreshToken!);
        Assert.False(replayAttempt.Success);
    }

    [Fact]
    public async Task Successful_Login_Resets_Failed_Attempts()
    {
        var service = new AuthService(new FakeAuthStore(), new FakePasswordHasher(), new FakeTokenService());
        await service.RegisterAsync(new RegisterRequest
        {
            Email = "resetcount@example.com",
            Password = "pass123",
            ManagerName = "ResetCount"
        });

        // Fail 3 times
        for (var i = 0; i < 3; i++)
        {
            await service.LoginAsync(new AuthRequest { Email = "resetcount@example.com", Password = "wrong" });
        }

        // Succeed once — should reset counter
        var success = await service.LoginAsync(new AuthRequest { Email = "resetcount@example.com", Password = "pass123" });
        Assert.True(success.Success);

        // Fail 4 more times — should NOT be locked (counter was reset)
        for (var i = 0; i < 4; i++)
        {
            var fail = await service.LoginAsync(new AuthRequest { Email = "resetcount@example.com", Password = "wrong" });
            Assert.False(fail.Success);
            Assert.DoesNotContain("locked", fail.Message ?? "", StringComparison.OrdinalIgnoreCase);
        }
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
        private readonly Dictionary<string, AuthSessionRecord> sessionsByRefreshToken = new(StringComparer.Ordinal);
        private readonly Dictionary<string, AuthSessionRecord> sessionsById = new(StringComparer.Ordinal);
        private readonly Dictionary<string, (string Token, DateTime Expires)> emailVerificationTokens = new();
        private readonly Dictionary<string, (string Token, DateTime Expires)> passwordResetTokens = new();

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

        public Task<bool> AddUserAsync(AuthUserRecord user, bool isBotRegistration = false, CancellationToken cancellationToken = default)
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
            sessionsById[session.SessionId] = session;
            if (!string.IsNullOrEmpty(session.RefreshToken))
                sessionsByRefreshToken[session.RefreshToken] = session;
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

        public Task RecordFailedLoginAsync(string userId, CancellationToken cancellationToken = default)
        {
            if (usersById.TryGetValue(userId, out var user))
            {
                var updated = user with { FailedLoginAttempts = user.FailedLoginAttempts + 1 };
                usersById[userId] = updated;
                usersByEmail[user.Email] = updated;
            }
            return Task.CompletedTask;
        }

        public Task ResetFailedLoginsAsync(string userId, CancellationToken cancellationToken = default)
        {
            if (usersById.TryGetValue(userId, out var user))
            {
                var updated = user with { FailedLoginAttempts = 0, LockedUntilUtc = null };
                usersById[userId] = updated;
                usersByEmail[user.Email] = updated;
            }
            return Task.CompletedTask;
        }

        public Task LockAccountAsync(string userId, DateTime lockedUntilUtc, CancellationToken cancellationToken = default)
        {
            if (usersById.TryGetValue(userId, out var user))
            {
                var updated = user with { LockedUntilUtc = lockedUntilUtc };
                usersById[userId] = updated;
                usersByEmail[user.Email] = updated;
            }
            return Task.CompletedTask;
        }

        public Task SetEmailVerificationTokenAsync(string userId, string token, DateTime expiresUtc, CancellationToken cancellationToken = default)
        {
            emailVerificationTokens[userId] = (token, expiresUtc);
            return Task.CompletedTask;
        }

        public Task<bool> VerifyEmailAsync(string userId, string token, CancellationToken cancellationToken = default)
        {
            if (!emailVerificationTokens.TryGetValue(userId, out var stored) || stored.Token != token || stored.Expires < DateTime.UtcNow)
                return Task.FromResult(false);

            emailVerificationTokens.Remove(userId);
            if (usersById.TryGetValue(userId, out var user))
            {
                var updated = user with { EmailVerified = true };
                usersById[userId] = updated;
                usersByEmail[user.Email] = updated;
            }
            return Task.FromResult(true);
        }

        public Task SetPasswordResetTokenAsync(string userId, string token, DateTime expiresUtc, CancellationToken cancellationToken = default)
        {
            passwordResetTokens[userId] = (token, expiresUtc);
            return Task.CompletedTask;
        }

        public Task<bool> ResetPasswordAsync(string email, string token, string newPasswordHash, CancellationToken cancellationToken = default)
        {
            if (!usersByEmail.TryGetValue(email, out var user))
                return Task.FromResult(false);
            if (!passwordResetTokens.TryGetValue(user.UserId, out var stored) || stored.Token != token || stored.Expires < DateTime.UtcNow)
                return Task.FromResult(false);

            passwordResetTokens.Remove(user.UserId);
            var updated = user with { PasswordHash = newPasswordHash, FailedLoginAttempts = 0, LockedUntilUtc = null };
            usersById[user.UserId] = updated;
            usersByEmail[email] = updated;
            return Task.FromResult(true);
        }

        public Task<AuthSessionRecord?> GetSessionByRefreshTokenAsync(string refreshToken, CancellationToken cancellationToken = default)
        {
            sessionsByRefreshToken.TryGetValue(refreshToken, out var session);
            return Task.FromResult<AuthSessionRecord?>(session);
        }

        public Task MarkRefreshTokenUsedAsync(string sessionId, CancellationToken cancellationToken = default)
        {
            if (sessionsById.TryGetValue(sessionId, out var session))
            {
                var revoked = session with { RevokedAtUtc = DateTime.UtcNow };
                sessionsById[sessionId] = revoked;
                sessionsByTokenId[session.TokenId] = revoked;
                if (!string.IsNullOrEmpty(session.RefreshToken))
                    sessionsByRefreshToken.Remove(session.RefreshToken);
            }
            return Task.CompletedTask;
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
