using GoalTactics.Contracts.Chat;

namespace GoalTactics.Application.Chat;

public interface IChatService
{
    Task<ChatHistoryResponse> GetHistoryAsync(string userId, CancellationToken cancellationToken = default);

    Task PostAsync(string userId, string? message, CancellationToken cancellationToken = default);

    Task NotifyTypingAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class ChatService : IChatService
{
    public Task<ChatHistoryResponse> GetHistoryAsync(string userId, CancellationToken cancellationToken = default)
    {
        var now = DateTime.UtcNow;
        return Task.FromResult(new ChatHistoryResponse
        {
            Success = true,
            Messages =
            [
                new ChatMessageData
                {
                    Id = Guid.NewGuid(),
                    UserId = Guid.TryParse(userId, out var parsed) ? parsed : Guid.Empty,
                    UserName = "System",
                    Message = "Chat initialized",
                    CreatedAt = now.ToString("O")
                }
            ]
        });
    }

    public Task PostAsync(string userId, string? message, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }

    public Task NotifyTypingAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }
}
