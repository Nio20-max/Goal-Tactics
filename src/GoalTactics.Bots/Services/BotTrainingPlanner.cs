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

        var profile = PlannerUtilities.ResolveProfile(bot);

        // Base score driven by TrainingDiscipline trait (0.4–0.95 across personas)
        var score = 0.45m + (profile.TrainingDiscipline * 0.45m);

        // Boost if upcoming match — training feels urgent
        if (perception.HasUpcomingLeagueMatch)
        {
            score += 0.08m;
        }

        // Higher training-center level makes training more attractive
        if (bot.TrainingCenterLevel >= 4)
        {
            score += 0.05m;
        }

        // Low-strength teams should train more aggressively
        if (bot.Strength < 55)
        {
            score += 0.07m;
        }

        yield return PlannerUtilities.CreateIntent(
            "training.update",
            score,
            $"Train squad (discipline={profile.TrainingDiscipline:F2}, center-lv={bot.TrainingCenterLevel})",
            nowUtc);
    }
}
