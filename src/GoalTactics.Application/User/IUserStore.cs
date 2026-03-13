namespace GoalTactics.Application.User;

public interface IUserStore
{
    Task<UserProfileRecord?> GetUserProfileAsync(string userId, CancellationToken cancellationToken = default);

    Task<UserPreferencesRecord> GetOrCreatePreferencesAsync(string userId, CancellationToken cancellationToken = default);

    Task SavePreferencesAsync(string userId, UserPreferencesRecord preferences, CancellationToken cancellationToken = default);

    Task SaveMatchPushSubscriptionAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);

    Task UpdateUserAsync(string userId, UserProfileUpdateRecord update, CancellationToken cancellationToken = default);

    Task MarkAccountDeletedAsync(string userId, CancellationToken cancellationToken = default);

    /// <summary>Try to claim the daily reward. Returns true if the reward was claimed, false if already claimed today.</summary>
    Task<bool> TryClaimDailyRewardAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed record UserProfileRecord(
    string UserId,
    string ManagerName,
    string Email,
    DateTime CreatedAtUtc,
    DateTime? LastActivityAtUtc,
    DateTime? DeletedAtUtc);

public sealed record UserProfileUpdateRecord(string? Name, string? Email, string? PasswordHash);

public sealed record UserPreferencesRecord(
    bool AuctionOverbid,
    bool MatchResults,
    bool LineupIncomplete,
    bool FriendInvite,
    bool IneffectiveTraining,
    bool FriendlyMatch,
    bool System,
    bool AuctionEnd);
