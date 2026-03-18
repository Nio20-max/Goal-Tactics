using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Humanization;
using GoalTactics.Bots.Client.Neural;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Friendship and social behavior: manage relationships, chat cooperation,
/// co-bidding, and bot group dynamics. Includes human accounts.
/// </summary>
public sealed class SocialBehavior
{
    private readonly BotDatabase _db;
    private readonly BotConfig _config;
    private readonly BotHumanizationService _human;
    private readonly BotNeuralDecisionEngine _neural;
    private readonly Random _rng = new();

    private static readonly string[] FriendlyMessages =
    [
        "Good game!", "Nice team!", "Want to trade?",
        "Let's play a friendly!", "Good luck this season!",
        "Your squad looks strong!", "Great match!"
    ];

    private static readonly string[] CompetitiveMessages =
    [
        "We are pushing for the top spots.",
        "Big moves tonight, watch the market.",
        "Our squad is ready for stronger opponents.",
        "Targeting upgrades before next matchday."
    ];

    public SocialBehavior(BotDatabase db, BotConfig config, BotHumanizationService human, BotNeuralDecisionEngine neural)
    {
        _db = db;
        _config = config;
        _human = human;
        _neural = neural;
    }

    private sealed class FriendSnapshot
    {
        public string Id { get; init; } = "";
        public string TeamName { get; init; } = "";
        public string UserName { get; init; } = "";
        public bool IsRequestIncoming { get; init; }
        public bool IsFriend { get; init; }
        public bool LikesMe { get; init; }
        public bool MyLike { get; init; }
        public string ChallengeStatus { get; init; } = "";
    }

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan = null)
    {
        // Social activity probability depends on SocialScore
        int socialScore = bot.SocialScore;
        if (nightPlan is not null)
        {
            socialScore = Math.Clamp((socialScore + nightPlan.CoordinationLevel) / 2, 1, 100);
        }

        if (_rng.Next(1, 101) > socialScore) return;

        await SeedFluidFriendNetworkAsync(api, bot, nightPlan);
        await ManageFriendshipsAsync(api, bot, nightPlan);
        await ManageGroupsAsync(bot, nightPlan);
        await HandleChatCooperationAsync(api, bot, nightPlan);
    }

    private async Task SeedFluidFriendNetworkAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan)
    {
        var allBots = _db.GetAllBots()
            .Where(b => !string.Equals(b.BotId, bot.BotId, StringComparison.Ordinal))
            .ToList();
        if (allBots.Count == 0)
        {
            return;
        }

        var fanout = nightPlan?.CoordinationLevel switch
        {
            >= 85 => 6,
            >= 65 => 4,
            _ => 3
        };

        var candidates = allBots
            .OrderBy(b => Math.Abs(HashCode.Combine(bot.BotId, b.BotId, DateTime.UtcNow.DayOfYear)))
            .Take(fanout)
            .ToList();

        foreach (var candidate in candidates)
        {
            var level = _db.GetRelationshipLevel(bot.BotId, candidate.BotId);
            var bump = level < 20 ? 6 : 2;
            _db.UpsertRelationship(bot.BotId, candidate.BotId, Math.Clamp(level + bump, -100, 100));

            var reverse = _db.GetRelationshipLevel(candidate.BotId, bot.BotId);
            _db.UpsertRelationship(candidate.BotId, bot.BotId, Math.Clamp(reverse + 1, -100, 100));

            // Local relationship seeding uses bot DB identifiers which are not guaranteed to
            // be resolvable API user IDs. Keep this purely internal to avoid invalid Like calls.
        }
    }

    /// <summary>
    /// Send/accept friend requests and play friendlies to raise friendship levels.
    /// </summary>
    private async Task ManageFriendshipsAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan)
    {
        var friends = new List<FriendSnapshot>();
        var searchTerms = BuildFriendSearchTerms(bot);

        foreach (var term in searchTerms)
        {
            var friendsResponse = await api.ExecuteForBotAsync("GetFriends", new TextRequest { Text = term });
            if (!friendsResponse.Success)
            {
                continue;
            }

            friends.AddRange(BotApiTranslationReader.GetObjectList(friendsResponse, "friends")
                .Select(ToFriend)
                .Where(f => !string.IsNullOrEmpty(f.Id)));
        }

        friends = friends
            .GroupBy(f => f.Id)
            .Select(g => g.First())
            .ToList();

        foreach (var friend in friends)
        {
            // Accept pending incoming friend requests
            if (friend.IsRequestIncoming)
            {
                await api.ExecuteForBotAsync("Accept", new IdRequest { Id = friend.Id });
                _db.UpsertRelationship(bot.BotId, friend.Id, 25);
                continue;
            }

            int level = _db.GetRelationshipLevel(bot.BotId, friend.Id);

            if (friend.LikesMe && !friend.MyLike && Guid.TryParse(friend.Id, out _))
            {
                await api.ExecuteForBotAsync("Like", new IdRequest { Id = friend.Id });
                level = Math.Clamp(level + 4, -100, 100);
                _db.UpsertRelationship(bot.BotId, friend.Id, level);
            }

            // Send friendlies to raise friendship (costs nothing, builds relationship)
            var challengeChance = nightPlan?.CoordinationLevel >= 70 ? 0.45 : 0.30;
            if (level >= 10 && _rng.NextDouble() < challengeChance)
            {
                await api.ExecuteForBotAsync("SendChallenge", new IdRequest { Id = friend.Id });
                _db.UpsertRelationship(bot.BotId, friend.Id, Math.Min(100, level + 3));
            }
        }

        // Occasionally send likes to non-friends discovered by the API.
        // Do not use local bot IDs here, because /api/Like expects GUID user IDs.
        if (_rng.NextDouble() < 0.35)
        {
            var candidates = friends
                .Where(f => !f.IsFriend)
                .Select(f => f.Id)
                .Where(id => Guid.TryParse(id, out _))
            .Distinct()
            .Take(4)
                .ToList();

            foreach (var candidateId in candidates)
            {
                await api.ExecuteForBotAsync("Like", new IdRequest { Id = candidateId });
            }
        }
    }

    private IEnumerable<string> BuildFriendSearchTerms(BotRecord bot)
    {
        var terms = new HashSet<string>(StringComparer.OrdinalIgnoreCase)
        {
            "",
            bot.TeamName[..Math.Min(bot.TeamName.Length, 4)],
            bot.ManagerName[..Math.Min(bot.ManagerName.Length, 4)]
        };

        if (bot.GroupId.HasValue)
        {
            terms.Add($"Group {bot.GroupId.Value}");
        }

        foreach (var peer in _db.GetAllBots().Where(b => b.BotId != bot.BotId).Take(3))
        {
            terms.Add(peer.TeamName[..Math.Min(peer.TeamName.Length, 4)]);
        }

        return terms.Where(t => t is not null);
    }

    /// <summary>
    /// Chat cooperation kicks in at friendship level ≥ 70:
    /// bots coordinate on transfer market and send supportive messages.
    /// </summary>
    private async Task HandleChatCooperationAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan)
    {
        var relationships = _db.GetRelationships(bot.BotId).Where(r => r.Level >= 20).ToList();
        if (relationships.Count == 0)
        {
            return;
        }

        var chatResponse = await api.ExecuteForBotAsync("GetChatHistory");
        var recentGlobal = chatResponse.Success
            ? BotApiTranslationReader.GetObjectList(chatResponse, "messages")
                .TakeLast(6)
                .Select(m => BotApiTranslationReader.GetString(m, "message"))
                .Where(m => !string.IsNullOrWhiteSpace(m))
                .ToList()
            : new List<string>();

        var contactNames = relationships
            .OrderByDescending(r => r.Level)
            .Take(5)
            .Select(r => _db.GetBot(r.OtherId)?.TeamName ?? r.OtherId)
            .ToList();

        var plan = nightPlan ?? BotNightPlan.CreateFallback(bot);
        var llmMessage = await _neural.BuildSocialMessageAsync(bot, plan, contactNames, recentGlobal);
        var contextTag = relationships.Count >= 4 ? "promotion" : "default";
        var styled = _human.BuildStyledMessage(bot, llmMessage, contextTag);

        await api.ExecuteForBotAsync("PostChatMessage", new PostChatMessageRequest { Message = styled });
        _db.AddActionLog(bot.BotId, "social", "Posted neural social message", true, bot.Risk);

        if (bot.GroupId.HasValue)
        {
            _db.AddGroupChatMessage(bot.GroupId.Value, bot.BotId, styled, "group-social");
        }
    }

    /// <summary>
    /// Group management: bots that exceed a mutual friendliness threshold
    /// are assigned a shared GroupId. Max 5 groups.
    /// </summary>
    private Task ManageGroupsAsync(BotRecord bot, BotNightPlan? nightPlan)
    {
        var relationships = _db.GetRelationships(bot.BotId);
        var highFriends = relationships.Where(r => r.Level >= 35).Select(r => r.OtherId).Distinct().ToList();

        if (highFriends.Count < 2) return Task.CompletedTask;

        // If bot is not in a group, try to form or join one
        if (bot.GroupId is null)
        {
            // Check if any high-friendship bots are in a group
            foreach (string friendId in highFriends)
            {
                var friend = _db.GetBot(friendId);
                if (friend?.GroupId is not null)
                {
                    _db.UpdateBotGroup(bot.BotId, friend.GroupId);
                    return Task.CompletedTask;
                }
            }

            // No existing group found — create one if under limit
            if (_db.GetGroupCount() < _config.MaxGroups)
            {
                int newGroupId = _db.GetGroupCount() + 1;
                _db.InsertGroup(newGroupId, $"Group {newGroupId}");
                _db.UpdateBotGroup(bot.BotId, newGroupId);

                // Add the closest friends too
                foreach (string friendId in highFriends.Take(3))
                {
                    _db.UpdateBotGroup(friendId, newGroupId);
                }
            }

            return Task.CompletedTask;
        }

        // Fluid groups: occasionally pull in high-trust ungrouped friends.
        if (bot.GroupId.HasValue && _rng.NextDouble() < (nightPlan?.CoordinationLevel >= 70 ? 0.35 : 0.20))
        {
            foreach (var friendId in highFriends)
            {
                var friend = _db.GetBot(friendId);
                if (friend is null || friend.GroupId.HasValue)
                {
                    continue;
                }

                _db.UpdateBotGroup(friend.BotId, bot.GroupId.Value);
                break;
            }
        }

        // If a bot gets socially isolated in a group, allow leaving and rejoining elsewhere.
        if (bot.GroupId.HasValue)
        {
            var peers = _db.GetBotsInGroup(bot.GroupId.Value)
                .Where(b => b.BotId != bot.BotId)
                .Select(b => b.BotId)
                .ToList();
            var friendlyPeers = peers.Count(peerId => _db.GetRelationshipLevel(bot.BotId, peerId) >= 20);

            if (peers.Count > 0 && friendlyPeers == 0 && _rng.NextDouble() < 0.15)
            {
                _db.UpdateBotGroup(bot.BotId, null);
            }
        }

        return Task.CompletedTask;
    }

    /// <summary>
    /// Check if the highest bidder is an enemy (level ≤ –30) for spite-bidding.
    /// </summary>
    public bool ShouldSpiteBid(string botId, string targetUserId)
    {
        int level = _db.GetRelationshipLevel(botId, targetUserId);
        if (level <= -30)
        {
            // Spite-bid probability increases with enmity
            double probability = Math.Abs(level) / 100.0;
            return _rng.NextDouble() < probability;
        }
        return false;
    }

    private static FriendSnapshot ToFriend(Dictionary<string, object?> data)
        => new()
        {
            Id = BotApiTranslationReader.GetString(data, "id"),
            TeamName = BotApiTranslationReader.GetString(data, "teamName"),
            UserName = BotApiTranslationReader.GetString(data, "userName"),
            IsRequestIncoming = BotApiTranslationReader.GetBool(data, "incoming"),
            IsFriend = BotApiTranslationReader.GetBool(data, "isFriend"),
            LikesMe = BotApiTranslationReader.GetBool(data, "likesMe"),
            MyLike = BotApiTranslationReader.GetBool(data, "myLike"),
            ChallengeStatus = BotApiTranslationReader.GetString(data, "challengeStatus")
        };
}
