using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotScoutingPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        if (bot.Money < 10_000m)
        {
            yield break;
        }

        var score = bot.Persona == "YouthFocusedBot" ? 0.9m : 0.55m;
        yield return PlannerUtilities.CreateIntent("scouting.standard", score, "Run regular scouting cycle", nowUtc);

        if (bot.Stars >= 2_000m && (bot.Persona == "YouthFocusedBot" || bot.Persona == "AggressiveTraderBot"))
        {
            yield return PlannerUtilities.CreateIntent("scouting.premium", score + 0.07m, "Run premium scouting cycle", nowUtc);
        }
    }
}
