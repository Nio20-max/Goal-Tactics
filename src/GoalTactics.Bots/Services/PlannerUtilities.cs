using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

internal static class PlannerUtilities
{
    public static decimal PersonaMultiplier(BotClubProfile bot, string persona, decimal value)
    {
        return string.Equals(bot.Persona, persona, StringComparison.Ordinal) ? value : 1m;
    }

    public static BotIntent CreateIntent(string type, decimal score, string reason, DateTime atUtc, Dictionary<string, string>? metadata = null)
    {
        return new BotIntent
        {
            IntentType = type,
            Score = score,
            Reason = reason,
            TimestampUtc = atUtc,
            Metadata = metadata ?? new Dictionary<string, string>(StringComparer.Ordinal)
        };
    }
}
