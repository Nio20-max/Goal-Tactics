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

    public SocialBehavior(BotDatabase db, BotConfig config, BotHumanizationService human)
    {
        _db = db;
        _config = config;
        _human = human;
    }

    private sealed class FriendSnapshot
    {
        public string Id { get; init; } = "";
        public bool IsRequestIncoming { get; init; }
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

        await ManageFriendshipsAsync(api, bot);
        await HandleChatCooperationAsync(api, bot, nightPlan);
        await ManageGroupsAsync(bot);
    }

    /// <summary>
    /// Send/accept friend requests and play friendlies to raise friendship levels.
    /// </summary>
    private async Task ManageFriendshipsAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        var friendsResponse = await api.ExecuteForBotAsync("GetFriends", new TextRequest { Text = "" });
        if (!friendsResponse.Success) return;

        var friends = BotApiTranslationReader.GetObjectList(friendsResponse, "friends")
            .Select(ToFriend)
            .Where(f => !string.IsNullOrEmpty(f.Id))
            .ToList();

        foreach (var friend in friends)
        {
            // Accept pending incoming friend requests
            if (friend.IsRequestIncoming)
            {
                await api.ExecuteForBotAsync("Accept", new IdRequest { Id = friend.Id });
                _db.UpsertRelationship(bot.BotId, friend.Id, 1);
                continue;
            }

            int level = _db.GetRelationshipLevel(bot.BotId, friend.Id);

            // Send friendlies to raise friendship (costs nothing, builds relationship)
            if (level > 0 && level < 70 && _rng.NextDouble() < 0.3)
            {
                await api.ExecuteForBotAsync("SendChallenge", new IdRequest { Id = friend.Id });
                _db.UpsertRelationship(bot.BotId, friend.Id, Math.Min(100, level + 2));
            }
        }

        // Occasionally send friend requests to new people
        if (_rng.NextDouble() < 0.1)
        {
            var allBots = _db.GetAllBots();
            var candidates = allBots
                .Where(b => b.BotId != bot.BotId)
                .Where(b => _db.GetRelationshipLevel(bot.BotId, b.BotId) == 0)
                .Take(3)
                .ToList();

            foreach (var candidate in candidates)
            {
                await api.ExecuteForBotAsync("Like", new IdRequest { Id = candidate.BotId });
            }
        }
    }

    /// <summary>
    /// Chat cooperation kicks in at friendship level ≥ 70:
    /// bots coordinate on transfer market and send supportive messages.
    /// </summary>
    private async Task HandleChatCooperationAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan)
    {
        var relationships = _db.GetRelationships(bot.BotId);
        var closeFriends = relationships.Where(r => r.Level >= 70).ToList();

        if (closeFriends.Count == 0) return;

        // Send a chat message to the global chat
        string[] pool = nightPlan?.ChatTone == "competitive" ? CompetitiveMessages : FriendlyMessages;
        string message = pool[_rng.Next(pool.Length)];

        string contextTag = closeFriends.Count >= 4 ? "promotion" : "default";
        message = _human.BuildStyledMessage(bot, message, contextTag);

        await api.ExecuteForBotAsync("PostChatMessage", new PostChatMessageRequest { Message = message });
        _db.AddActionLog(bot.BotId, "social", "Posted styled context-aware message", true, bot.Risk);
    }

    /// <summary>
    /// Group management: bots that exceed a mutual friendliness threshold
    /// are assigned a shared GroupId. Max 5 groups.
    /// </summary>
    private Task ManageGroupsAsync(BotRecord bot)
    {
        var relationships = _db.GetRelationships(bot.BotId);
        var highFriends = relationships.Where(r => r.Level >= 50).Select(r => r.OtherId).ToList();

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
            IsRequestIncoming = BotApiTranslationReader.GetBool(data, "incoming")
        };
}
