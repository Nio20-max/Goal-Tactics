using GoalTactics.Application.Auth;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Authentication;

public sealed class AuthDbStore(GoalTacticsDbContext dbContext) : IAuthStore
{
    public async Task<AuthUserRecord?> GetUserByEmailAsync(string email, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Email == email, cancellationToken);
        return user is null
            ? null
            : new AuthUserRecord(user.Id, user.Email, user.PasswordHash, user.ManagerName);
    }

    public async Task<AuthUserRecord?> GetUserByIdAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        return user is null
            ? null
            : new AuthUserRecord(user.Id, user.Email, user.PasswordHash, user.ManagerName);
    }

    public async Task<bool> AddUserAsync(AuthUserRecord user, CancellationToken cancellationToken = default)
    {
        var exists = await dbContext.Users.AnyAsync(x => x.Email == user.Email, cancellationToken);
        if (exists)
        {
            return false;
        }

        dbContext.Users.Add(new UserEntity
        {
            Id = user.UserId,
            Email = user.Email,
            PasswordHash = user.PasswordHash,
            ManagerName = user.ManagerName,
            CreatedAtUtc = DateTime.UtcNow
        });
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task AddSessionAsync(AuthSessionRecord session, CancellationToken cancellationToken = default)
    {
        dbContext.UserSessions.Add(new UserSessionEntity
        {
            Id = session.SessionId,
            UserId = session.UserId,
            TokenId = session.TokenId,
            IssuedAtUtc = session.IssuedAtUtc,
            ExpiresAtUtc = session.ExpiresAtUtc,
            RevokedAtUtc = session.RevokedAtUtc,
            ClientVersion = session.ClientVersion,
            Capabilities = session.Capabilities,
            Platform = session.Platform,
            DeviceId = session.DeviceId
        });

        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == session.UserId, cancellationToken);
        if (user is not null)
        {
            user.LastLoginAtUtc = session.IssuedAtUtc;
            user.LastActivityAtUtc = session.IssuedAtUtc;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public Task<bool> IsSessionActiveAsync(string tokenId, CancellationToken cancellationToken = default)
    {
        var now = DateTime.UtcNow;
        return dbContext.UserSessions.AnyAsync(
            x => x.TokenId == tokenId && x.RevokedAtUtc == null && x.ExpiresAtUtc > now,
            cancellationToken);
    }

    public async Task RevokeSessionAsync(string tokenId, CancellationToken cancellationToken = default)
    {
        var session = await dbContext.UserSessions.FirstOrDefaultAsync(x => x.TokenId == tokenId, cancellationToken);
        if (session is null || session.RevokedAtUtc is not null)
        {
            return;
        }

        session.RevokedAtUtc = DateTime.UtcNow;
        await dbContext.SaveChangesAsync(cancellationToken);
    }
}
