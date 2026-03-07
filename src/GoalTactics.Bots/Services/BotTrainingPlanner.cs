using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotTrainingPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        if (!perception.HasTrainingTickDue)
        {
            yield break;
        }

        var score = bot.Stars > 1_000 ? 0.8m : 0.6m;
        yield return PlannerUtilities.CreateIntent("training.update", score, "Maintain team and individual training plans", nowUtc);
    }
}
