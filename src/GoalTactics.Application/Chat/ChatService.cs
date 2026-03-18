using GoalTactics.Contracts.Chat;

namespace GoalTactics.Application.Chat;

public interface IChatService
{
    Task<ChatHistoryResponse> GetHistoryAsync(string userId, string? channel, string? targetUserId, CancellationToken cancellationToken = default);

    Task<ChatContactsResponse> GetContactsAsync(string userId, CancellationToken cancellationToken = default);

    Task PostAsync(string userId, string? message, string? channel, string? targetUserId, CancellationToken cancellationToken = default);

    Task NotifyTypingAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class ChatService(IChatStore chatStore) : IChatService
{
    private static readonly string[] GenericBotReplies =
    [
        "Alles klar, ich halte die Augen am Transfermarkt offen.",
        "Gute Idee. Ich beobachte die Entwicklung bis zum nächsten Spieltag.",
        "Verstanden. Gib mir kurz Zeit, ich passe meine Planung an.",
        "Klingt gut. Wir koordinieren das in der Gruppe."
    ];

    public async Task<ChatHistoryResponse> GetHistoryAsync(string userId, string? channel, string? targetUserId, CancellationToken cancellationToken = default)
    {
        var normalizedChannel = NormalizeChannel(channel);
        var normalizedTarget = NormalizeTarget(targetUserId);
        var records = await chatStore.GetRecentMessagesAsync(userId, normalizedChannel, normalizedTarget, 100, cancellationToken);
        var ordered = records.OrderBy(x => x.CreatedAtUtc).ToArray();
        var groupKey = normalizedChannel == "group"
            ? await chatStore.GetGroupKeyAsync(userId, cancellationToken)
            : null;

        return new ChatHistoryResponse
        {
            Success = true,
            Channel = normalizedChannel,
            TargetUserId = Guid.TryParse(normalizedTarget, out var parsedTarget) ? parsedTarget : null,
            GroupKey = groupKey,
            Messages = ordered.Select(x => new ChatMessageData
            {
                Id = Guid.TryParse(x.Id, out var messageId) ? messageId : Guid.Empty,
                UserId = Guid.TryParse(x.UserId, out var parsedUserId) ? parsedUserId : Guid.Empty,
                TargetUserId = Guid.TryParse(x.TargetUserId, out var parsedTargetUserId) ? parsedTargetUserId : null,
                Name = x.UserName,
                Message = x.Message,
                Date = x.CreatedAtUtc.ToString("O"),
                Channel = x.Channel,
                GroupKey = x.GroupKey,
                IsMine = string.Equals(x.UserId, userId, StringComparison.Ordinal)
            }).ToArray()
        };
    }

    public async Task<ChatContactsResponse> GetContactsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var contacts = await chatStore.GetContactsAsync(userId, cancellationToken);
        var groupKey = await chatStore.GetGroupKeyAsync(userId, cancellationToken);

        return new ChatContactsResponse
        {
            Success = true,
            GroupKey = groupKey,
            Contacts = contacts.Select(x => new ChatContactData
            {
                UserId = Guid.TryParse(x.UserId, out var id) ? id : Guid.Empty,
                Name = x.Name,
                TeamName = x.TeamName,
                IsBot = x.IsBot,
                IsFriend = x.IsFriend
            }).ToArray()
        };
    }

    public async Task PostAsync(string userId, string? message, string? channel, string? targetUserId, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(message))
        {
            return;
        }

        var normalized = message.Trim();
        var normalizedChannel = NormalizeChannel(channel);
        var normalizedTarget = NormalizeTarget(targetUserId);

        await chatStore.AddMessageAsync(userId, normalized, normalizedChannel, normalizedTarget, cancellationToken);

        if (normalizedChannel == "private"
            && !string.IsNullOrWhiteSpace(normalizedTarget)
            && await chatStore.IsBotContactAsync(userId, normalizedTarget, cancellationToken))
        {
            var reply = BuildDirectBotReply(normalized);
            await chatStore.AddMessageAsync(normalizedTarget, reply, "private", userId, cancellationToken);
        }
    }

    public Task NotifyTypingAsync(string userId, CancellationToken cancellationToken = default)
    {
        return chatStore.TouchPresenceAsync(userId, cancellationToken);
    }

    private static string NormalizeChannel(string? channel)
    {
        var normalized = channel?.Trim().ToLowerInvariant();
        return normalized switch
        {
            "group" => "group",
            "private" => "private",
            _ => "global"
        };
    }

    private static string? NormalizeTarget(string? targetUserId)
    {
        if (string.IsNullOrWhiteSpace(targetUserId))
        {
            return null;
        }

        return Guid.TryParse(targetUserId, out var parsed)
            ? parsed.ToString("N")
            : null;
    }

    private string BuildDirectBotReply(string message)
    {
        var text = message.Trim().ToLowerInvariant();

        if (text.Contains("friendly") || text.Contains("freundschaft") || text.Contains("friendly match") || text.Contains("challenge"))
        {
            return "Ja, ein Freundschaftsspiel ist moeglich. Ich sende dir gleich eine Herausforderung.";
        }

        if ((text.Contains("help") || text.Contains("hilfe")) && (text.Contains("bid") || text.Contains("auktion") || text.Contains("player") || text.Contains("spieler")))
        {
            return "Ich helfe beim Bieten. Schick mir den Spieler oder die Auktion, dann sichere ich den Druck auf dem Markt.";
        }

        return GenericBotReplies[Math.Abs(HashCode.Combine(message, DateTime.UtcNow.Minute)) % GenericBotReplies.Length];
    }
}
