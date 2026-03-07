using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotTeamSetupService
{
    public void InitializeClub(BotClubProfile bot)
    {
        bot.Position = 1;
        if (bot.Strength < 40)
        {
            bot.Strength = 40;
        }
    }
}
