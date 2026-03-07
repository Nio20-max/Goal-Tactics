using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotFriendlyPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        if (!perception.HasUpcomingFriendly)
        {
            yield break;
        }

        var score = bot.Persona == "SocialBot" ? 0.78m : 0.42m;
        yield return PlannerUtilities.CreateIntent("friendly.invite", score, "Issue friendly invitations at realistic cadence", nowUtc);
    }
}
