using GoalTactics.Application.Friends;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Friends;

public sealed class FriendsDbStore(GoalTacticsDbContext dbContext) : IFriendsStore
{
    private const int PendingStatus = 0;
    private const int AcceptedStatus = 1;
    private const int DeclinedStatus = 2;

    public async Task<IReadOnlyList<FriendRecord>> GetFriendsAsync(string userId, string? queryText, CancellationToken cancellationToken = default)
    {
        var relations = await dbContext.FriendRelations
            .AsNoTracking()
            .Where(x => x.RequesterUserId == userId || x.AddresseeUserId == userId)
            .ToListAsync(cancellationToken);

        var users = await dbContext.Users.AsNoTracking().ToDictionaryAsync(x => x.Id, cancellationToken);
        var teams = await dbContext.Teams.AsNoTracking().ToListAsync(cancellationToken);
        var teamByUserId = teams
            .GroupBy(x => x.UserId)
            .ToDictionary(x => x.Key, x => x.First().Id);

        var normalizedQuery = queryText?.Trim();

        // Build records from existing friend relations
        var relatedUserIds = new HashSet<string>();
        var records = relations.Select(x =>
        {
            var foreignUserId = x.RequesterUserId == userId ? x.AddresseeUserId : x.RequesterUserId;
            relatedUserIds.Add(foreignUserId);
            var name = users.TryGetValue(foreignUserId, out var foreignUser)
                ? (string.IsNullOrWhiteSpace(foreignUser.ManagerName) ? foreignUser.Email : foreignUser.ManagerName)
                : "Unknown";

            var foreignTeamId = teamByUserId.TryGetValue(foreignUserId, out var foundTeamId) ? foundTeamId : string.Empty;
            var foreignTeam = teams.FirstOrDefault(t => t.Id == foreignTeamId);

            var incoming = x.Status == PendingStatus && x.AddresseeUserId == userId;
            var outgoing = x.Status == PendingStatus && x.RequesterUserId == userId;

            return new FriendRecord(
                RelationId: x.Id,
                ForeignUserId: foreignUserId,
                ForeignTeamId: foreignTeamId,
                Name: name,
                IsFriend: x.Status == AcceptedStatus,
                IsRequestIncoming: incoming,
                IsRequestOutgoing: outgoing,
                IsLiked: x.IsLikedByRequester,
                TeamName: foreignTeam?.Name,
                Country: foreignTeam?.Country?.ToLowerInvariant(),
                TeamLogo: "wappen01",
                Strength: foreignTeam?.Strength ?? 0,
                Language: "de");
        }).ToList();

        // When searching, also include non-friend users matching the query
        if (!string.IsNullOrWhiteSpace(normalizedQuery))
        {
            records = records.Where(x => x.Name.Contains(normalizedQuery, StringComparison.OrdinalIgnoreCase)).ToList();

            foreach (var (uid, user) in users)
            {
                if (uid == userId || relatedUserIds.Contains(uid))
                    continue;

                var name = string.IsNullOrWhiteSpace(user.ManagerName) ? user.Email : user.ManagerName;
                if (!name.Contains(normalizedQuery, StringComparison.OrdinalIgnoreCase))
                    continue;

                var foreignTeamId = teamByUserId.TryGetValue(uid, out var foundTeamId) ? foundTeamId : string.Empty;
                var foreignTeam = teams.FirstOrDefault(t => t.Id == foreignTeamId);

                records.Add(new FriendRecord(
                    RelationId: string.Empty,
                    ForeignUserId: uid,
                    ForeignTeamId: foreignTeamId,
                    Name: name,
                    IsFriend: false,
                    IsRequestIncoming: false,
                    IsRequestOutgoing: false,
                    IsLiked: false,
                    TeamName: foreignTeam?.Name,
                    Country: foreignTeam?.Country?.ToLowerInvariant(),
                    TeamLogo: "wappen01",
                    Strength: foreignTeam?.Strength ?? 0,
                    Language: "de"));
            }
        }

        return records
            .OrderByDescending(x => x.IsFriend)
            .ThenBy(x => x.Name)
            .ToArray();
    }

    public async Task<string?> FindFriendNameAsync(string? queryText, CancellationToken cancellationToken = default)
    {
        if (string.IsNullOrWhiteSpace(queryText))
        {
            return null;
        }

        var normalized = queryText.Trim();
        var user = await dbContext.Users.AsNoTracking()
            .FirstOrDefaultAsync(x => x.ManagerName.Contains(normalized) || x.Email.Contains(normalized), cancellationToken);

        if (user is null)
        {
            return null;
        }

        return string.IsNullOrWhiteSpace(user.ManagerName) ? user.Email : user.ManagerName;
    }

    public async Task LikeAsync(string userId, Guid targetId, CancellationToken cancellationToken = default)
    {
        var targetUserId = await ResolveTargetUserIdAsync(userId, targetId, cancellationToken);
        if (string.IsNullOrWhiteSpace(targetUserId) || targetUserId == userId)
        {
            return;
        }

        var pairKey = BuildPairKey(userId, targetUserId);
        var relation = await dbContext.FriendRelations.FirstOrDefaultAsync(x => x.PairKey == pairKey, cancellationToken);

        if (relation is null)
        {
            dbContext.FriendRelations.Add(new FriendRelationEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                PairKey = pairKey,
                RequesterUserId = userId,
                AddresseeUserId = targetUserId,
                Status = PendingStatus,
                IsLikedByRequester = true,
                CreatedAtUtc = DateTime.UtcNow,
                UpdatedAtUtc = DateTime.UtcNow
            });

            await dbContext.SaveChangesAsync(cancellationToken);
            return;
        }

        if (relation.Status == PendingStatus && relation.AddresseeUserId == userId)
        {
            relation.Status = AcceptedStatus;
        }
        else
        {
            relation.Status = PendingStatus;
            relation.RequesterUserId = userId;
            relation.AddresseeUserId = targetUserId;
            relation.IsLikedByRequester = true;
        }

        relation.UpdatedAtUtc = DateTime.UtcNow;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task UnlikeAsync(string userId, Guid targetId, CancellationToken cancellationToken = default)
    {
        var targetIdValue = targetId.ToString("N");
        var relation = await dbContext.FriendRelations.FirstOrDefaultAsync(
            x => x.Id == targetIdValue && (x.RequesterUserId == userId || x.AddresseeUserId == userId),
            cancellationToken);

        if (relation is null)
        {
            var targetUserId = await ResolveTargetUserIdAsync(userId, targetId, cancellationToken);
            if (string.IsNullOrWhiteSpace(targetUserId))
            {
                return;
            }

            var pairKey = BuildPairKey(userId, targetUserId);
            relation = await dbContext.FriendRelations.FirstOrDefaultAsync(x => x.PairKey == pairKey, cancellationToken);
        }

        if (relation is null)
        {
            return;
        }

        dbContext.FriendRelations.Remove(relation);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task AcceptAsync(string userId, Guid relationId, CancellationToken cancellationToken = default)
    {
        var relation = await dbContext.FriendRelations.FirstOrDefaultAsync(x => x.Id == relationId.ToString("N"), cancellationToken);
        if (relation is null || relation.AddresseeUserId != userId)
        {
            // Fallback: treat relationId as a team ID and resolve the pair
            var targetUserId = await ResolveTargetUserIdAsync(userId, relationId, cancellationToken);
            if (!string.IsNullOrWhiteSpace(targetUserId))
            {
                var pairKey = BuildPairKey(userId, targetUserId);
                relation = await dbContext.FriendRelations.FirstOrDefaultAsync(x => x.PairKey == pairKey, cancellationToken);
            }

            if (relation is null || relation.AddresseeUserId != userId)
            {
                return;
            }
        }

        relation.Status = AcceptedStatus;
        relation.UpdatedAtUtc = DateTime.UtcNow;

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task DeclineAsync(string userId, Guid relationId, CancellationToken cancellationToken = default)
    {
        var relation = await dbContext.FriendRelations.FirstOrDefaultAsync(x => x.Id == relationId.ToString("N"), cancellationToken);
        if (relation is null || relation.AddresseeUserId != userId)
        {
            return;
        }

        dbContext.FriendRelations.Remove(relation);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<ChallengeOverviewRecord> GetChallengesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var challengeRows = await dbContext.FriendlyChallenges
            .AsNoTracking()
            .Where(x => (x.HomeUserId == userId || x.AwayUserId == userId) && x.Status != DeclinedStatus)
            .OrderByDescending(x => x.CreatedAtUtc)
            .ToListAsync(cancellationToken);

        var users = await dbContext.Users.AsNoTracking().ToDictionaryAsync(x => x.Id, cancellationToken);

        var challenges = challengeRows.Select(x =>
        {
            var foreignUserId = x.HomeUserId == userId ? x.AwayUserId : x.HomeUserId;
            var foreignTeamId = x.HomeUserId == userId ? x.AwayTeamId : x.HomeTeamId;
            var name = users.TryGetValue(foreignUserId, out var foreignUser)
                ? (string.IsNullOrWhiteSpace(foreignUser.ManagerName) ? foreignUser.Email : foreignUser.ManagerName)
                : "Unknown";

            return new ChallengeRecord(
                Id: x.Id,
                ForeignTeamId: foreignTeamId,
                OpponentName: name,
                Accepted: x.Status == AcceptedStatus,
                MatchDateUtc: x.MatchDateUtc);
        }).ToArray();

        var friends = await GetFriendsAsync(userId, queryText: null, cancellationToken);
        var acceptedFriends = friends.Where(x => x.IsFriend).ToArray();

        var now = DateTime.UtcNow;
        var nearest = challenges.OrderBy(x => x.MatchDateUtc).FirstOrDefault();

        return new ChallengeOverviewRecord(
            Challenges: challenges,
            Friends: acceptedFriends,
            MatchDateUtc: nearest?.MatchDateUtc ?? now,
            EndDateUtc: nearest?.MatchDateUtc.AddHours(4) ?? now.AddHours(4));
    }

    public async Task<ChallengeOverviewRecord> SendChallengeAsync(string userId, Guid targetId, CancellationToken cancellationToken = default)
    {
        var targetUserId = await ResolveTargetUserIdAsync(userId, targetId, cancellationToken);
        if (string.IsNullOrWhiteSpace(targetUserId) || targetUserId == userId)
        {
            return await GetChallengesAsync(userId, cancellationToken);
        }

        var homeTeam = await GetOrCreateTeamAsync(userId, cancellationToken);
        var awayTeam = await GetOrCreateTeamAsync(targetUserId, cancellationToken);

        var matchDate = DateTime.UtcNow.AddHours(12);
        dbContext.FriendlyChallenges.Add(new FriendlyChallengeEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            HomeUserId = userId,
            AwayUserId = targetUserId,
            HomeTeamId = homeTeam.Id,
            AwayTeamId = awayTeam.Id,
            Status = PendingStatus,
            MatchDateUtc = matchDate,
            EndDateUtc = matchDate.AddHours(4),
            CreatedAtUtc = DateTime.UtcNow
        });

        await dbContext.SaveChangesAsync(cancellationToken);

        return await GetChallengesAsync(userId, cancellationToken);
    }

    public async Task<ChallengeOverviewRecord> ReplyChallengeAsync(string userId, Guid challengeId, bool accept, CancellationToken cancellationToken = default)
    {
        var challenge = await dbContext.FriendlyChallenges.FirstOrDefaultAsync(x => x.Id == challengeId.ToString("N"), cancellationToken);
        if (challenge is null || (challenge.HomeUserId != userId && challenge.AwayUserId != userId))
        {
            return await GetChallengesAsync(userId, cancellationToken);
        }

        challenge.Status = accept ? AcceptedStatus : DeclinedStatus;
        challenge.EndDateUtc = accept ? challenge.MatchDateUtc.AddHours(4) : DateTime.UtcNow;

        await dbContext.SaveChangesAsync(cancellationToken);

        return await GetChallengesAsync(userId, cancellationToken);
    }

    private async Task<string?> ResolveTargetUserIdAsync(string actorUserId, Guid targetId, CancellationToken cancellationToken)
    {
        var id = targetId.ToString("N");

        var relation = await dbContext.FriendRelations.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        if (relation is not null)
        {
            if (relation.RequesterUserId == actorUserId)
            {
                return relation.AddresseeUserId;
            }

            if (relation.AddresseeUserId == actorUserId)
            {
                return relation.RequesterUserId;
            }
        }

        var user = await dbContext.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        if (user is not null)
        {
            return user.Id;
        }

        var team = await dbContext.Teams.AsNoTracking().FirstOrDefaultAsync(x => x.Id == id, cancellationToken);
        return team?.UserId;
    }

    private async Task<TeamEntity> GetOrCreateTeamAsync(string userId, CancellationToken cancellationToken)
    {
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (team is not null)
        {
            return team;
        }

        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken)
            ?? throw new InvalidOperationException("User not found for friendly challenge");

        team = new TeamEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            UserId = userId,
            Name = string.IsNullOrWhiteSpace(user.ManagerName) ? "My Team" : user.ManagerName,
            Country = "DE",
            CountryName = "Germany",
            LeagueName = "Amateur",
            MarketValue = 100000,
            Mood = 50,
            TeamMood = "Neutral",
            Wins = 0,
            Losses = 0,
            Fans = 100,
            Members = 100,
            Strength = 50,
            MatchTrend = "Stable"
        };

        dbContext.Teams.Add(team);
        await dbContext.SaveChangesAsync(cancellationToken);
        return team;
    }

    private static string BuildPairKey(string a, string b)
    {
        return string.CompareOrdinal(a, b) <= 0 ? $"{a}:{b}" : $"{b}:{a}";
    }
}
