using GoalTactics.Application.Abstractions;
using GoalTactics.Contracts.User;
using System.Collections.Concurrent;

namespace GoalTactics.Application.User;

public interface IUserService
{
    Task<decimal> ClaimDailyRewardAsync(string userId, CancellationToken cancellationToken = default);

    Task<HelpshiftUserResponse> GetHelpshiftUserInfoAsync(string userId, CancellationToken cancellationToken = default);

    Task<PreferencesResponse> GetPreferencesAsync(string userId, CancellationToken cancellationToken = default);

    Task SavePreferencesAsync(string userId, NotificationSettings settings, CancellationToken cancellationToken = default);

    Task<UpdateUserResponse> UpdateUserAsync(string userId, UpdateUserRequest request, CancellationToken cancellationToken = default);

    Task<EnableMatchPushResponse> EnableMatchPushAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);

    Task DeleteAccountAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class UserService(IUserStore userStore, IPasswordHasher passwordHasher) : IUserService
{
    private static readonly ConcurrentDictionary<string, ConcurrentDictionary<Guid, bool>> MatchPushByUser = new();

    public Task<decimal> ClaimDailyRewardAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(50m);
    }

    public async Task<HelpshiftUserResponse> GetHelpshiftUserInfoAsync(string userId, CancellationToken cancellationToken = default)
    {
        var profile = await userStore.GetUserProfileAsync(userId, cancellationToken);
        if (profile is null)
        {
            return new HelpshiftUserResponse { Success = false, Message = "User not found" };
        }

        var parsedUserId = Guid.TryParse(profile.UserId, out var guidUserId) ? guidUserId : Guid.Empty;

        return new HelpshiftUserResponse
        {
            Success = true,
            UserId = parsedUserId,
            ManagerName = profile.ManagerName,
            PurchasesAmount = 0,
            CreationDate = profile.CreatedAtUtc.ToString("O"),
            PurchasesLTV = 0,
            ClubName = profile.ManagerName,
            LeagueName = "Unknown",
            UserLevel = 1
        };
    }

    public async Task<PreferencesResponse> GetPreferencesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var preferences = await userStore.GetOrCreatePreferencesAsync(userId, cancellationToken);
        var profile = await userStore.GetUserProfileAsync(userId, cancellationToken);

        return new PreferencesResponse
        {
            Success = true,
            NotificationSettings = Map(preferences),
            UserData = profile is null
                ? null
                : new UserData
                {
                    Name = profile.ManagerName,
                    Email = profile.Email,
                    Created = profile.CreatedAtUtc.ToString("O"),
                    LastActivity = profile.LastActivityAtUtc?.ToString("O"),
                    Score = 0,
                    Rank = "Rookie"
                }
        };
    }

    public Task SavePreferencesAsync(string userId, NotificationSettings settings, CancellationToken cancellationToken = default)
    {
        var record = new UserPreferencesRecord(
            settings.AuctionOverbid,
            settings.MatchResults,
            settings.LineupIncomplete,
            settings.FriendInvite,
            settings.IneffectiveTraining,
            settings.FriendlyMatch,
            settings.System,
            settings.AuctionEnd);
        return userStore.SavePreferencesAsync(userId, record, cancellationToken);
    }

    public async Task<UpdateUserResponse> UpdateUserAsync(string userId, UpdateUserRequest request, CancellationToken cancellationToken = default)
    {
        var data = request.UserData;
        var passwordHash = string.IsNullOrWhiteSpace(data?.Password) ? null : passwordHasher.Hash(data.Password);

        await userStore.UpdateUserAsync(userId, new UserProfileUpdateRecord(data?.Name, data?.Email, passwordHash), cancellationToken);

        return new UpdateUserResponse
        {
            Success = true,
            EmailReward = 0,
            FacebookReward = 0,
            Message = "Updated"
        };
    }

    public Task<EnableMatchPushResponse> EnableMatchPushAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var entries = MatchPushByUser.GetOrAdd(userId, _ => new ConcurrentDictionary<Guid, bool>());
        entries[matchId] = true;

        return Task.FromResult(new EnableMatchPushResponse
        {
            Success = true,
            Message = "Match push enabled",
            MatchId = matchId,
            IsEnabled = true
        });
    }

    public Task DeleteAccountAsync(string userId, CancellationToken cancellationToken = default)
    {
        return userStore.MarkAccountDeletedAsync(userId, cancellationToken);
    }

    private static NotificationSettings Map(UserPreferencesRecord record)
    {
        return new NotificationSettings
        {
            AuctionOverbid = record.AuctionOverbid,
            MatchResults = record.MatchResults,
            LineupIncomplete = record.LineupIncomplete,
            FriendInvite = record.FriendInvite,
            IneffectiveTraining = record.IneffectiveTraining,
            FriendlyMatch = record.FriendlyMatch,
            System = record.System,
            AuctionEnd = record.AuctionEnd
        };
    }
}
