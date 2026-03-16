using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotSkillCardPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        if (bot.SkillCards <= 0 || bot.Players.Count == 0)
        {
            yield break;
        }

        // Use skill cards before league matches to boost a weak player
        if (!perception.HasUpcomingLeagueMatch)
        {
            yield break;
        }

        var score = 0.60m + (bot.SkillCards / 20m);

        yield return PlannerUtilities.CreateIntent(
            "skillcard.use",
            score,
            $"Use skill card on weakest player (cards={bot.SkillCards})",
            nowUtc);
    }
}
