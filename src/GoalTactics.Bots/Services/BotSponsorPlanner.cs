using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotSponsorPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        var score = bot.Money < 50_000m ? 0.86m : 0.52m;
        yield return PlannerUtilities.CreateIntent("sponsor.review", score, "Evaluate sponsor offers vs reserves", nowUtc);

        if (bot.Stars < 1_000m)
        {
            yield return PlannerUtilities.CreateIntent("sponsor.accept", score + 0.06m, "Prioritize sponsor stars payout", nowUtc);
        }
    }
}
