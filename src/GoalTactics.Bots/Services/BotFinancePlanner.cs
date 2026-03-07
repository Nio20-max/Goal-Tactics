using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotFinancePlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        var score = bot.Money < 20_000m ? 0.9m : 0.45m;
        yield return PlannerUtilities.CreateIntent("finance.review", score, "Review reserves, obligations, and spending plan", nowUtc);

        var activityDrivenMoment = perception.HasUpcomingLeagueMatch || perception.HasUpcomingFriendly || perception.HasAuctionExpiringSoon;
        var lowStarsFallback = bot.Stars < 700m;
        var activeSessionTopUp = activityDrivenMoment && bot.Stars < 2_000m;

        if (lowStarsFallback || activeSessionTopUp)
        {
            var reason = lowStarsFallback
                ? "Low star reserve, watch rewarded ad"
                : "Active session with upcoming events, top up stars via rewarded ad";

            yield return PlannerUtilities.CreateIntent("shop.watch-ad", score + 0.04m, reason, nowUtc);
        }
    }
}
