namespace GoalTactics.Application.Chat;

public interface IChatStore
{
    Task<IReadOnlyList<ChatMessageRecord>> GetRecentMessagesAsync(int maxCount, CancellationToken cancellationToken = default);

    Task AddMessageAsync(string userId, string message, CancellationToken cancellationToken = default);

    Task TouchPresenceAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed record ChatMessageRecord(string Id, string UserId, string UserName, string Message, DateTime CreatedAtUtc);
