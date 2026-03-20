using GoalTactics.Application.User;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace GoalTactics.Infrastructure.User;

public sealed class UserDbStore(GoalTacticsDbContext dbContext) : IUserStore
{
    public async Task<UserProfileRecord?> GetUserProfileAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        return user is null
            ? null
            : new UserProfileRecord(user.Id, user.ManagerName, user.Email, user.CreatedAtUtc, user.LastActivityAtUtc, user.DeletedAtUtc);
    }

    public async Task<UserPreferencesRecord> GetOrCreatePreferencesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var preferences = await dbContext.UserPreferences.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (preferences is null)
        {
            preferences = new UserPreferencesEntity
            {
                UserId = userId,
                AuctionOverbid = true,
                MatchResults = true,
                LineupIncomplete = true,
                FriendInvite = true,
                IneffectiveTraining = true,
                FriendlyMatch = true,
                SystemNotifications = true,
                AuctionEnd = true
            };
            dbContext.UserPreferences.Add(preferences);
            await dbContext.SaveChangesAsync(cancellationToken);
        }

        return new UserPreferencesRecord(
            preferences.AuctionOverbid,
            preferences.MatchResults,
            preferences.LineupIncomplete,
            preferences.FriendInvite,
            preferences.IneffectiveTraining,
            preferences.FriendlyMatch,
            preferences.SystemNotifications,
            preferences.AuctionEnd);
    }

    public async Task SavePreferencesAsync(string userId, UserPreferencesRecord preferences, CancellationToken cancellationToken = default)
    {
        var current = await dbContext.UserPreferences.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (current is null)
        {
            current = new UserPreferencesEntity { UserId = userId };
            dbContext.UserPreferences.Add(current);
        }

        current.AuctionOverbid = preferences.AuctionOverbid;
        current.MatchResults = preferences.MatchResults;
        current.LineupIncomplete = preferences.LineupIncomplete;
        current.FriendInvite = preferences.FriendInvite;
        current.IneffectiveTraining = preferences.IneffectiveTraining;
        current.FriendlyMatch = preferences.FriendlyMatch;
        current.SystemNotifications = preferences.System;
        current.AuctionEnd = preferences.AuctionEnd;

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task SaveMatchPushSubscriptionAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var key = matchId.ToString("N");
        var existing = await dbContext.MatchPushSubscriptions
            .FirstOrDefaultAsync(x => x.UserId == userId && x.MatchId == key, cancellationToken);

        if (existing is null)
        {
            dbContext.MatchPushSubscriptions.Add(new MatchPushSubscriptionEntity
            {
                UserId = userId,
                MatchId = key,
                EnabledAtUtc = DateTime.UtcNow
            });
        }
        else
        {
            existing.EnabledAtUtc = DateTime.UtcNow;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task UpdateUserAsync(string userId, UserProfileUpdateRecord update, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user is null)
        {
            return;
        }

        if (!string.IsNullOrWhiteSpace(update.Name))
        {
            user.ManagerName = update.Name;
        }

        if (!string.IsNullOrWhiteSpace(update.Email))
        {
            user.Email = update.Email;
        }

        if (!string.IsNullOrWhiteSpace(update.PasswordHash))
        {
            user.PasswordHash = update.PasswordHash;
        }

        user.LastActivityAtUtc = DateTime.UtcNow;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task MarkAccountDeletedAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user is null)
        {
            return;
        }

        user.DeletedAtUtc = DateTime.UtcNow;

        var deletedStamp = DateTime.UtcNow.ToString("yyyyMMddHHmmss", CultureInfo.InvariantCulture);
        var idPrefix = user.Id.Length >= 8 ? user.Id[..8] : user.Id;
        user.Email = $"deleted_{deletedStamp}_{idPrefix}@deleted.goaltactics.local";
        user.ManagerName = $"Deleted {idPrefix}";

        var sessions = await dbContext.UserSessions
            .Where(x => x.UserId == userId && x.RevokedAtUtc == null)
            .ToListAsync(cancellationToken);
        var now = DateTime.UtcNow;
        foreach (var session in sessions)
        {
            session.RevokedAtUtc = now;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<bool> TryClaimDailyRewardAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user is null) return false;

        var todayUtc = DateTime.UtcNow.Date;
        if (user.DailyRewardClaimedUtc is not null && user.DailyRewardClaimedUtc >= todayUtc)
        {
            return false; // Already claimed today
        }

        user.DailyRewardClaimedUtc = DateTime.UtcNow;
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }
}
