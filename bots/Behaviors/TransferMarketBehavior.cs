using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Transfer market behavior: search, evaluate, and bid on players.
/// Bidding timing and budget are driven by the bot's Risk score and friendship levels.
/// </summary>
public sealed class TransferMarketBehavior
{
    private readonly BotDatabase _db;
    private readonly SocialBehavior _social;
    private readonly Random _rng = new();

    private const long MinStarsReserve = 1000;

    public TransferMarketBehavior(BotDatabase db, SocialBehavior social)
    {
        _db = db;
        _social = social;
    }

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        // Get current resources to know budget
        var resources = await api.GetMyResourcesAsync();
        if (resources is null) return;

        decimal availableMoney = resources.Money;
        decimal availableStars = resources.GTStars;

        // Search for players that match team needs
        var searchRequest = BuildSearchRequest(bot);
        var market = await api.SearchTransfermarketAsync(searchRequest);
        if (market?.Players is null || market.Players.Count == 0) return;

        foreach (var player in market.Players)
        {
            if (player.IsFrozen) continue;

            // Check friendship: should we skip this auction?
            if (!string.IsNullOrEmpty(player.BidTeamName) &&
                ShouldSkipDueToFriendship(bot.BotId, player.BidTeamName))
                continue;

            int maxBid = CalculateMaxBid(bot, availableMoney, availableStars);
            if (player.Bid >= maxBid) continue;

            int bidAmount = CalculateBidAmount(player.Bid, maxBid);

            var result = await api.BidPlayerAsync(new BidRequest
            {
                Id = player.AuctionId,
                Bid = bidAmount
            });

            if (result?.Success == true)
            {
                availableMoney -= bidAmount;
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
    private int CalculateMaxBid(BotRecord bot, decimal money, decimal stars)
    {
        double riskFactor = bot.Risk / 99.0;

        // Stars budget: keep at least MinStarsReserve
        decimal spendableStars = Math.Max(0, stars - MinStarsReserve);

        // Money budget: willing to spend proportionally to risk
        int moneyBudget = (int)(money * (decimal)(0.3 + riskFactor * 0.5));
        int starsBudget = (int)(spendableStars * (decimal)(0.2 + riskFactor * 0.3));

        return moneyBudget + starsBudget;
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
}
