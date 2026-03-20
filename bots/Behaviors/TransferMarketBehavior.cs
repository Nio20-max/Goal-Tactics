using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Humanization;
using GoalTactics.Bots.Client.Neural;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Transfer market behavior: search, evaluate, and bid on players.
/// Bidding timing and budget are driven by the bot's Risk score and friendship levels.
/// </summary>
public sealed class TransferMarketBehavior
{
    private const int BidStarsCost = 200;
    private readonly BotDatabase _db;
    private readonly SocialBehavior _social;
    private readonly BotNeuralDecisionEngine _neural;
    private readonly BotHumanizationService _human;
    private readonly BotConfig _config;
    private readonly Random _rng = new();

    private sealed class TransferPlayerSnapshot
    {
        public string Name { get; init; } = "";
        public int Age { get; init; }
        public int Talent { get; init; }
        public decimal Strength { get; init; }
        public string AuctionId { get; init; } = "";
        public long Bid { get; init; }
        public bool IsFrozen { get; init; }
        public string BidTeamName { get; init; } = "";
    }

    public TransferMarketBehavior(BotDatabase db, SocialBehavior social, BotNeuralDecisionEngine neural, BotHumanizationService human, BotConfig config)
    {
        _db = db;
        _social = social;
        _neural = neural;
        _human = human;
        _config = config;
    }

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan = null)
    {
        if (nightPlan is not null && !nightPlan.ShouldBid)
        {
            return;
        }

        // Get current resources to know budget
        var resources = await api.ExecuteForBotAsync("GetMyResources");
        if (!resources.Success) return;

        decimal availableMoney = BotApiTranslationReader.GetDecimal(resources.Output, "money");
        decimal availableStars = BotApiTranslationReader.GetDecimal(resources.Output, "gtStars");
        var envelope = _human.BuildTransferEnvelope(bot, availableMoney, availableStars);

        // Search for players that match team needs
        var searchRequest = BuildSearchRequest(bot);
        var market = await api.ExecuteForBotAsync("SearchTransfermarket", searchRequest);
        if (!market.Success) return;

        var players = BotApiTranslationReader.GetObjectList(market, "players")
            .Select(ToTransferPlayer)
            .Where(p => !string.IsNullOrEmpty(p.AuctionId))
            .ToList();
        if (players.Count == 0) return;

        _human.RefreshTransferShortlist(bot, BotApiTranslationReader.GetObjectList(market, "players"), nightPlan?.TransferTargetProfile ?? "balanced");

        await PublishGroupIntentAsync(api, bot, players, nightPlan);

        foreach (var player in players)
        {
            if (player.IsFrozen) continue;

            if (_human.ShouldPauseAuctionAfterRegret(bot, player.AuctionId))
            {
                continue;
            }

            // Check friendship: should we skip this auction?
            if (!string.IsNullOrEmpty(player.BidTeamName) &&
                ShouldSkipDueToFriendship(bot.BotId, player.BidTeamName))
            {
                _human.MarkAuctionLost(bot, player.AuctionId);
                continue;
            }

            if (!_human.IsGroupCircleTurn(bot, player.AuctionId, player.BidTeamName))
            {
                continue;
            }

            if (!_human.CanTakeRiskyAction(bot))
            {
                _db.AddActionLog(bot.BotId, "transfer", "Guardrail: max risky actions reached", false, bot.Risk);
                continue;
            }

            if (availableStars < BidStarsCost)
            {
                _db.AddActionLog(bot.BotId, "transfer", "Skipped bidding: insufficient GT Stars", false, bot.Risk);
                break;
            }

            int maxBid = CalculateMaxBid(bot, envelope.MoneyBudget, envelope.StarsBudget, nightPlan);
            if (player.Bid >= maxBid) continue;

            int bidAmount = CalculateBidAmount(player.Bid, maxBid);

            if (_human.ShouldFakeoutBid(bot) && _rng.NextDouble() < 0.5)
            {
                bidAmount = (int)Math.Min(maxBid, bidAmount + Math.Max(120, (int)(player.Bid * 0.01)));
            }

            var result = await api.ExecuteForBotAsync("BidPlayer", new BidRequest
            {
                Id = player.AuctionId,
                Bid = bidAmount
            });

            if (result.Success)
            {
                availableMoney -= bidAmount;
                availableStars = Math.Max(0, availableStars - BidStarsCost);
                _human.MarkAuctionBid(bot, player.AuctionId);
                _human.CountRiskyAction(bot);
                _db.AddActionLog(bot.BotId, "transfer", $"Bid accepted on {player.Name}, envelope={envelope.Phase}", true, bot.Risk);
            }
            else
            {
                _db.AddActionLog(bot.BotId, "transfer", $"Bid rejected on {player.Name}", false, bot.Risk);
            }
        }
    }

    /// <summary>
    /// Build a transfer market search based on youth focus:
    /// high youth focus → search for young, high-talent players.
    /// </summary>
    private SearchTransfermarketRequest BuildSearchRequest(BotRecord bot)
    {
        var request = new SearchTransfermarketRequest();

        if (bot.YouthFocus > 60)
        {
            // Focus on high-talent young players
            request.Talent = new RangeFilter { Min = 70, Max = 100 };
        }
        else if (bot.YouthFocus > 30)
        {
            request.Talent = new RangeFilter { Min = 50, Max = 100 };
        }
        // Low youth focus: no talent filter, accept any player

        return request;
    }

    /// <summary>
    /// Maximum bid depends on risk, available resources, and a minimum stars reserve.
    /// </summary>
    private int CalculateMaxBid(BotRecord bot, decimal moneyBudget, decimal starsBudget, BotNightPlan? nightPlan)
    {
        double riskFactor = bot.Risk / 99.0;
        if (nightPlan is not null)
        {
            riskFactor = Math.Clamp((riskFactor + (nightPlan.BidAggression / 100.0)) / 2.0, 0.05, 1.0);
        }

        int moneyPart = (int)(moneyBudget * (decimal)(0.3 + riskFactor * 0.5));
        int starsPart = (int)(starsBudget * (decimal)(0.2 + riskFactor * 0.3));
        int envelopeCap = moneyPart + starsPart;

        // Hard guardrail: avoid overspending relative to available money budget.
        int safeCap = (int)Math.Max(0, moneyBudget * (decimal)Math.Clamp(_config.MaxBidPercentOfMoney, 0.05, 0.95));
        return Math.Min(envelopeCap, safeCap + starsPart);
    }

    /// <summary>
    /// Calculate the actual bid: minimum increment above current bid, with some risk-based overshoot.
    /// </summary>
    private int CalculateBidAmount(long currentBid, int maxBid)
    {
        long minIncrement = Math.Max(100, currentBid / 20);
        long jitter = (long)(_rng.NextDouble() * Math.Min(minIncrement, 100_000));
        long bid = currentBid + minIncrement + jitter;
        return (int)Math.Min(bid, maxBid);
    }

    /// <summary>
    /// Check if the highest bidder is a friend. We use the team name
    /// to look up if any of our known bots match (since we only have team names from the market).
    /// For now, skip if there's an existing high-friendship bot with that team name.
    /// </summary>
    private bool ShouldSkipDueToFriendship(string botId, string bidTeamName)
    {
        // Find if any bot with that team name is a friend
        var allBots = _db.GetAllBots();
        var matchingBot = allBots.FirstOrDefault(b =>
            b.TeamName.Equals(bidTeamName, StringComparison.OrdinalIgnoreCase));

        if (matchingBot is null) return false;

        int level = _db.GetRelationshipLevel(botId, matchingBot.BotId);
        if (level >= 70) return true; // Never overbid a close friend
        if (level >= 30 && _rng.NextDouble() < 0.6) return true; // 60 % chance to skip

        return false;
    }

    private async Task PublishGroupIntentAsync(
        GoalTacticsApiClient api,
        BotRecord bot,
        List<TransferPlayerSnapshot> players,
        BotNightPlan? nightPlan)
    {
        if (!bot.GroupId.HasValue)
        {
            return;
        }

        if (!_human.ShouldInitiateGroupMessage(bot))
        {
            return;
        }

        var targets = players
            .OrderByDescending(p => p.Talent)
            .ThenBy(p => p.Age)
            .ThenByDescending(p => p.Strength)
            .Take(3)
            .Select(p => p.Name)
            .Where(n => !string.IsNullOrWhiteSpace(n))
            .ToList();

        if (targets.Count == 0)
        {
            return;
        }

        var recent = _db.GetRecentGroupChatMessages(bot.GroupId.Value, 20);
        var plan = nightPlan ?? BotNightPlan.CreateFallback(bot);
        var message = await _neural.BuildGroupTransferMessageAsync(bot, plan, targets, recent);
        if (_rng.NextDouble() < 0.25)
        {
            message = $"I disagree with one target, but still backing this plan. {message}";
        }
        if (string.IsNullOrWhiteSpace(message))
        {
            return;
        }

        _db.AddGroupChatMessage(bot.GroupId.Value, bot.BotId, message);

        await api.ExecuteForBotAsync("PostChatMessage", new PostChatMessageRequest
        {
            Message = message,
            Channel = "group"
        });
    }

    private static TransferPlayerSnapshot ToTransferPlayer(Dictionary<string, object?> data)
        => new()
        {
            Name = BotApiTranslationReader.GetString(data, "name"),
            Age = BotApiTranslationReader.GetInt(data, "age"),
            Talent = BotApiTranslationReader.GetInt(data, "talent"),
            Strength = BotApiTranslationReader.GetDecimal(data, "strength"),
            AuctionId = BotApiTranslationReader.GetString(data, "auctionId"),
            Bid = BotApiTranslationReader.GetLong(data, "bid"),
            IsFrozen = BotApiTranslationReader.GetBool(data, "isFrozen"),
            BidTeamName = BotApiTranslationReader.GetString(data, "bidTeamName")
        };
}
