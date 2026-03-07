using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotTransferPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        if (bot.Persona == "ConservativeBot" && bot.Money < 40_000m)
        {
            yield break;
        }

        var baseScore = bot.Persona == "AggressiveTraderBot" ? 0.92m : 0.58m;
        yield return PlannerUtilities.CreateIntent("transfer.search", baseScore, "Review transfer market gaps and opportunities", nowUtc);

        if (perception.HasAuctionExpiringSoon)
        {
            yield return PlannerUtilities.CreateIntent(
                "transfer.bid",
                baseScore + 0.05m,
                "Auction about to expire, evaluate late bid",
                nowUtc,
                new Dictionary<string, string>(StringComparer.Ordinal) { ["lateBid"] = "true" });
        }
    }
}
