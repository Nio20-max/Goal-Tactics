using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotChatPlanner
{
    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        var baseScore = bot.Persona == "SocialBot" ? 0.88m : 0.35m;
        if (perception.HasUpcomingLeagueMatch || perception.HasAuctionExpiringSoon)
        {
            yield return PlannerUtilities.CreateIntent("chat.post", baseScore, "Contextual chat participation", nowUtc);
        }
    }
}
