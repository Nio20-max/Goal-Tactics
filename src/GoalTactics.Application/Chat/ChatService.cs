using GoalTactics.Contracts.Chat;

namespace GoalTactics.Application.Chat;

public interface IChatService
{
    Task<ChatHistoryResponse> GetHistoryAsync(string userId, CancellationToken cancellationToken = default);

    Task PostAsync(string userId, string? message, CancellationToken cancellationToken = default);

    Task NotifyTypingAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class ChatService(IChatStore chatStore) : IChatService
{
    public async Task<ChatHistoryResponse> GetHistoryAsync(string userId, CancellationToken cancellationToken = default)
    {
        var records = await chatStore.GetRecentMessagesAsync(100, cancellationToken);
        var ordered = records.OrderBy(x => x.CreatedAtUtc).ToArray();

        return new ChatHistoryResponse
        {
            Success = true,
            Messages = ordered.Select(x => new ChatMessageData
            {
                Id = Guid.TryParse(x.Id, out var messageId) ? messageId : Guid.Empty,
                UserId = Guid.TryParse(x.UserId, out var parsedUserId) ? parsedUserId : Guid.Empty,
                UserName = x.UserName,
                Message = x.Message,
                CreatedAt = x.CreatedAtUtc.ToString("O")
            }).ToArray()
        };
    }

    public async Task PostAsync(string userId, string? message, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(message))
        {
            return;
        }

        var normalized = message.Trim();
        await chatStore.AddMessageAsync(userId, normalized, cancellationToken);
    }

    public Task NotifyTypingAsync(string userId, CancellationToken cancellationToken = default)
    {
        return chatStore.TouchPresenceAsync(userId, cancellationToken);
    }
}
