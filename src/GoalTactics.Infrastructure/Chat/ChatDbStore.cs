using GoalTactics.Application.Chat;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Chat;

public sealed class ChatDbStore(GoalTacticsDbContext dbContext) : IChatStore
{
    public async Task<IReadOnlyList<ChatMessageRecord>> GetRecentMessagesAsync(
        string userId,
        string channel,
        string? targetUserId,
        int maxCount,
        CancellationToken cancellationToken = default)
    {
        var normalizedChannel = NormalizeChannel(channel);
        var query = dbContext.ChatMessages.AsNoTracking();

        if (normalizedChannel == "private" && !string.IsNullOrWhiteSpace(targetUserId))
        {
            query = query.Where(x => x.Channel == "private"
                && ((x.UserId == userId && x.TargetUserId == targetUserId)
                    || (x.UserId == targetUserId && x.TargetUserId == userId)));
        }
        else if (normalizedChannel == "group")
        {
            var groupKey = await GetGroupKeyAsync(userId, cancellationToken);
            if (string.IsNullOrWhiteSpace(groupKey))
            {
                return [];
            }

            query = query.Where(x => x.Channel == "group" && x.GroupKey == groupKey);
        }
        else
        {
            query = query.Where(x => x.Channel == "global" || x.Channel == null || x.Channel == string.Empty);
        }

        var rows = await query
            .AsNoTracking()
            .OrderByDescending(x => x.CreatedAtUtc)
            .Take(maxCount)
            .Select(x => new
            {
                x.Id,
                x.UserId,
                x.TargetUserId,
                x.Channel,
                x.GroupKey,
                x.Message,
                x.CreatedAtUtc,
                UserName = x.User != null ? x.User.ManagerName : "Manager"
            })
            .ToListAsync(cancellationToken);

        return rows
            .Select(x => new ChatMessageRecord(
                x.Id,
                x.UserId,
                x.TargetUserId,
                x.UserName,
                x.Message,
                string.IsNullOrWhiteSpace(x.Channel) ? "global" : x.Channel,
                x.GroupKey,
                x.CreatedAtUtc))
            .ToArray();
    }

    public async Task AddMessageAsync(
        string userId,
        string message,
        string channel,
        string? targetUserId,
        CancellationToken cancellationToken = default)
    {
        var normalizedChannel = NormalizeChannel(channel);
        var groupKey = normalizedChannel == "group"
            ? await GetGroupKeyAsync(userId, cancellationToken)
            : null;

        var entity = new ChatMessageEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            UserId = userId,
            TargetUserId = normalizedChannel == "private" ? targetUserId : null,
            Channel = normalizedChannel,
            GroupKey = normalizedChannel == "group" ? groupKey : null,
            Message = message,
            CreatedAtUtc = DateTime.UtcNow
        };

        dbContext.ChatMessages.Add(entity);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<string?> GetGroupKeyAsync(string userId, CancellationToken cancellationToken = default)
    {
        var teamId = await dbContext.Teams
            .AsNoTracking()
            .Where(x => x.UserId == userId)
            .Select(x => x.Id)
            .FirstOrDefaultAsync(cancellationToken);

        if (string.IsNullOrWhiteSpace(teamId))
        {
            return null;
        }

        var ladderId = await dbContext.LadderEntries
            .AsNoTracking()
            .Where(x => x.TeamId == teamId)
            .Select(x => x.LadderId)
            .FirstOrDefaultAsync(cancellationToken);

        return ladderId;
    }

    public async Task<IReadOnlyList<ChatContactRecord>> GetContactsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var contacts = new Dictionary<string, ChatContactRecord>(StringComparer.Ordinal);

        var users = await dbContext.Users
            .AsNoTracking()
            .Select(x => new { x.Id, x.ManagerName, x.Email })
            .ToDictionaryAsync(x => x.Id, cancellationToken);

        var teams = await dbContext.Teams
            .AsNoTracking()
            .Select(x => new { x.UserId, x.Name, x.Id })
            .ToListAsync(cancellationToken);

        var relations = await dbContext.FriendRelations
            .AsNoTracking()
            .Where(x => x.Status == 1 && (x.RequesterUserId == userId || x.AddresseeUserId == userId))
            .ToListAsync(cancellationToken);

        foreach (var rel in relations)
        {
            var otherId = rel.RequesterUserId == userId ? rel.AddresseeUserId : rel.RequesterUserId;
            if (!users.TryGetValue(otherId, out var user))
            {
                continue;
            }

            var teamName = teams.FirstOrDefault(t => t.UserId == otherId)?.Name;
            contacts[otherId] = new ChatContactRecord(
                otherId,
                string.IsNullOrWhiteSpace(user.ManagerName) ? user.Email : user.ManagerName,
                teamName,
                IsBot: false,
                IsFriend: true);
        }

        var groupKey = await GetGroupKeyAsync(userId, cancellationToken);
        if (!string.IsNullOrWhiteSpace(groupKey))
        {
            var leagueBots = await (
                from le in dbContext.LadderEntries.AsNoTracking()
                join t in dbContext.Teams.AsNoTracking() on le.TeamId equals t.Id
                join u in dbContext.Users.AsNoTracking() on t.UserId equals u.Id
                where le.LadderId == groupKey && le.IsBot && u.Id != userId
                select new
                {
                    u.Id,
                    u.ManagerName,
                    u.Email,
                    TeamName = t.Name
                })
                .ToListAsync(cancellationToken);

            foreach (var bot in leagueBots)
            {
                contacts[bot.Id] = new ChatContactRecord(
                    bot.Id,
                    string.IsNullOrWhiteSpace(bot.ManagerName) ? bot.Email : bot.ManagerName,
                    bot.TeamName,
                    IsBot: true,
                    IsFriend: contacts.TryGetValue(bot.Id, out var existing) && existing.IsFriend);
            }
        }

        return contacts.Values
            .OrderByDescending(x => x.IsBot)
            .ThenBy(x => x.Name)
            .ToArray();
    }

    public async Task<string?> GetUserDisplayNameAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users
            .AsNoTracking()
            .Where(x => x.Id == userId)
            .Select(x => new { x.ManagerName, x.Email })
            .FirstOrDefaultAsync(cancellationToken);

        if (user is null)
        {
            return null;
        }

        return string.IsNullOrWhiteSpace(user.ManagerName) ? user.Email : user.ManagerName;
    }

    public async Task<bool> IsBotContactAsync(string userId, string targetUserId, CancellationToken cancellationToken = default)
    {
        var groupKey = await GetGroupKeyAsync(userId, cancellationToken);
        if (string.IsNullOrWhiteSpace(groupKey))
        {
            return false;
        }

        return await (
            from le in dbContext.LadderEntries.AsNoTracking()
            join t in dbContext.Teams.AsNoTracking() on le.TeamId equals t.Id
            where le.LadderId == groupKey && le.IsBot && t.UserId == targetUserId
            select t.UserId)
            .AnyAsync(cancellationToken);
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
}
