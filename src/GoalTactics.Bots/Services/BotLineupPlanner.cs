using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotLineupPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        if (!perception.HasUpcomingLeagueMatch && !perception.HasUpcomingFriendly)
        {
            yield break;
        }

        var score = 0.55m + (bot.Strength / 200m);
        yield return PlannerUtilities.CreateIntent(
            "lineup.save",
            score,
            "Prepare lineup before lock with role assignment",
            nowUtc,
            new Dictionary<string, string>(StringComparer.Ordinal)
            {
                ["matchType"] = perception.HasUpcomingLeagueMatch ? "league" : "friendly"
            });
    }
}
