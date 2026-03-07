using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotLadderPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        var focusBoost = bot.Persona == "LadderGrinderBot" ? 0.35m : 0m;
        if (bot.LadderStamina >= 25)
        {
            yield return PlannerUtilities.CreateIntent("ladder.challenge", 0.4m + focusBoost, "Challenge based on stamina and value", nowUtc);
        }
        else if (bot.Stars >= 500m)
        {
            yield return PlannerUtilities.CreateIntent("ladder.restore", 0.3m + focusBoost, "Restore stamina for 500 stars", nowUtc);
        }
    }
}
