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
    private readonly Random _rng = new();

    private const long MinStarsReserve = 1000;

    public TransferMarketBehavior(BotDatabase db)
    {
        _db = db;
    }

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        // Get current resources to know budget
        var resources = await api.GetMyResourcesAsync();
        if (resources is null) return;

        long availableMoney = resources.Money;
        long availableStars = resources.Premium;

        // Search for players that match team needs
        var searchRequest = BuildSearchRequest(bot);
        var market = await api.SearchTransfermarketAsync(searchRequest);
        if (market?.Auctions is null || market.Auctions.Count == 0) return;

        foreach (var auction in market.Auctions)
        {
            if (auction.SecondsLeft <= 0) continue;

            // Check friendship: should we skip this auction?
            if (ShouldSkipDueToFriendship(bot.BotId, auction.HighestBidderId))
                continue;

            long maxBid = CalculateMaxBid(bot, availableMoney, availableStars);
            if (auction.CurrentBid >= maxBid) continue;

            // Bid timing: probability rises as countdown shrinks
            if (!ShouldBidNow(bot.Risk, auction.SecondsLeft))
                continue;

            long bidAmount = CalculateBidAmount(auction.CurrentBid, maxBid);

            var result = await api.BidPlayerAsync(new BidRequest
            {
                Id = auction.Id,
                Bid = bidAmount
            });

            if (result?.Success == true)
            {
                availableMoney -= bidAmount;
                // Adjust relationship: overbidding lowers friendship
                AdjustRelationshipForOverbid(bot.BotId, auction.HighestBidderId);
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
    private long CalculateMaxBid(BotRecord bot, long money, long stars)
    {
        double riskFactor = bot.Risk / 99.0;

        // Stars budget: keep at least MinStarsReserve
        long spendableStars = Math.Max(0, stars - MinStarsReserve);

        // Money budget: willing to spend proportionally to risk
        long moneyBudget = (long)(money * (0.3 + riskFactor * 0.5));
        long starsBudget = (long)(spendableStars * (0.2 + riskFactor * 0.3));

        return moneyBudget + starsBudget;
    }

    /// <summary>
    /// Determines if the bot should bid now based on seconds remaining and risk.
    /// Higher risk → bids later (snipe style). Probability rises as time runs out.
    /// </summary>
    private bool ShouldBidNow(int risk, int secondsLeft)
    {
        // At 5 seconds: high probability; at 20 seconds: low probability
        // Risk factor: higher risk means the bot waits longer
        double urgency = Math.Max(0, 1.0 - (secondsLeft - 3) / 20.0);
        double riskDelay = risk / 99.0 * 0.5; // high risk delays by up to 50 %
        double probability = urgency * (1.0 - riskDelay);
        probability = Math.Clamp(probability, 0.02, 0.95);

        return _rng.NextDouble() < probability;
    }

    /// <summary>
    /// Calculate the actual bid: minimum increment above current bid, with some risk-based overshoot.
    /// </summary>
    private long CalculateBidAmount(long currentBid, long maxBid)
    {
        long minIncrement = Math.Max(100, currentBid / 20);
        long bid = currentBid + minIncrement + _rng.Next(0, (int)Math.Min(minIncrement, int.MaxValue));
        return Math.Min(bid, maxBid);
    }

    /// <summary>
    /// Check if the highest bidder is a friend (level ≥ 70 → never overbid, ≥ 30 → reduced chance).
    /// </summary>
    private bool ShouldSkipDueToFriendship(long botId, long highestBidderId)
    {
        if (highestBidderId <= 0) return false;

        int level = _db.GetRelationshipLevel(botId, highestBidderId);

        if (level >= 70) return true; // Never overbid a close friend
        if (level >= 30 && _rng.NextDouble() < 0.6) return true; // 60 % chance to skip

        return false;
    }

    /// <summary>
    /// Overbidding someone lowers the friendship level.
    /// </summary>
    private void AdjustRelationshipForOverbid(long botId, long overbidUserId)
    {
        if (overbidUserId <= 0) return;

        int current = _db.GetRelationshipLevel(botId, overbidUserId);
        int adjusted = Math.Max(-100, current - 3);
        _db.UpsertRelationship(botId, overbidUserId, adjusted);
    }
}
