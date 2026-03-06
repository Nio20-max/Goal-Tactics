using GoalTactics.Application.Chat;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Chat;

public sealed class ChatDbStore(GoalTacticsDbContext dbContext) : IChatStore
{
    public async Task<IReadOnlyList<ChatMessageRecord>> GetRecentMessagesAsync(int maxCount, CancellationToken cancellationToken = default)
    {
        var rows = await dbContext.ChatMessages
            .AsNoTracking()
            .OrderByDescending(x => x.CreatedAtUtc)
            .Take(maxCount)
            .Select(x => new
            {
                x.Id,
                x.UserId,
                x.Message,
                x.CreatedAtUtc,
                UserName = x.User != null ? x.User.ManagerName : "Manager"
            })
            .ToListAsync(cancellationToken);

        return rows
            .Select(x => new ChatMessageRecord(x.Id, x.UserId, x.UserName, x.Message, x.CreatedAtUtc))
            .ToArray();
    }

    public async Task AddMessageAsync(string userId, string message, CancellationToken cancellationToken = default)
    {
        var entity = new ChatMessageEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            UserId = userId,
            Message = message,
            CreatedAtUtc = DateTime.UtcNow
        };

        dbContext.ChatMessages.Add(entity);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task TouchPresenceAsync(string userId, CancellationToken cancellationToken = default)
    {
        var now = DateTime.UtcNow;
        var presence = await dbContext.ChatPresence.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (presence is null)
        {
            presence = new ChatPresenceEntity
            {
                UserId = userId,
                LastTypingAtUtc = now,
                LastSeenAtUtc = now
            };
            dbContext.ChatPresence.Add(presence);
        }
        else
        {
            presence.LastTypingAtUtc = now;
            presence.LastSeenAtUtc = now;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }
}
