using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotTransferPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        var profile = PlannerUtilities.ResolveProfile(bot);

        // Minimum money reserve scales with risk tolerance: cautious bots keep more cash
        var minReserve = 20_000m + ((1m - profile.RiskTolerance) * 40_000m);
        if (bot.Money < minReserve)
        {
            yield break;
        }

        // Search score driven by TransferAppetite (0.2–0.95 across personas)
        var searchScore = 0.40m + (profile.TransferAppetite * 0.45m);

        // Weaker teams search more aggressively — they need upgrades
        if (bot.Strength < 55)
        {
            searchScore += 0.10m;
        }

        // Contract risk (expiring players) increases transfer urgency
        if (perception.ContractRisk > 2)
        {
            searchScore += 0.08m;
        }

        yield return PlannerUtilities.CreateIntent(
            "transfer.search",
            searchScore,
            $"Search transfers (appetite={profile.TransferAppetite:F2}, reserve={minReserve})",
            nowUtc);

        // Bidding: requires expiring auction and enough confidence
        if (perception.HasAuctionExpiringSoon)
        {
            var bidScore = searchScore + (profile.RiskTolerance * 0.12m);

            // Late-bid bonus for risk-takers
            if (profile.RiskTolerance >= 0.6m)
            {
                bidScore += 0.05m;
            }

            yield return PlannerUtilities.CreateIntent(
                "transfer.bid",
                bidScore,
                $"Late bid on expiring auction (risk={profile.RiskTolerance:F2})",
                nowUtc,
                new Dictionary<string, string>(StringComparer.Ordinal) { ["lateBid"] = "true" });
        }
    }
}
