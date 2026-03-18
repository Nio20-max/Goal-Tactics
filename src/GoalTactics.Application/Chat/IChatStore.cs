namespace GoalTactics.Application.Chat;

public interface IChatStore
{
    Task<IReadOnlyList<ChatMessageRecord>> GetRecentMessagesAsync(
        string userId,
        string channel,
        string? targetUserId,
        int maxCount,
        CancellationToken cancellationToken = default);

    Task AddMessageAsync(
        string userId,
        string message,
        string channel,
        string? targetUserId,
        CancellationToken cancellationToken = default);

    Task<string?> GetGroupKeyAsync(string userId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<ChatContactRecord>> GetContactsAsync(string userId, CancellationToken cancellationToken = default);

    Task<string?> GetUserDisplayNameAsync(string userId, CancellationToken cancellationToken = default);

    Task<bool> IsBotContactAsync(string userId, string targetUserId, CancellationToken cancellationToken = default);

    Task TouchPresenceAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed record ChatMessageRecord(
    string Id,
    string UserId,
    string? TargetUserId,
    string UserName,
    string Message,
    string Channel,
    string? GroupKey,
    DateTime CreatedAtUtc);

public sealed record ChatContactRecord(
    string UserId,
    string Name,
    string? TeamName,
    bool IsBot,
    bool IsFriend);
