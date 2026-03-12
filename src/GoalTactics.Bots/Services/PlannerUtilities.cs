using GoalTactics.Bots.Models;
using GoalTactics.Bots.Profiles;

namespace GoalTactics.Bots.Services;

internal static class PlannerUtilities
{
    private static readonly Dictionary<string, IBotProfile> ProfileLookup = new(StringComparer.Ordinal)
    {
        ["NewManagerBot"] = new NewManagerBotProfile(),
        ["ConservativeBot"] = new ConservativeBotProfile(),
        ["AggressiveTraderBot"] = new AggressiveTraderBotProfile(),
        ["YouthFocusedBot"] = new YouthFocusedBotProfile(),
        ["LadderGrinderBot"] = new LadderGrinderBotProfile(),
        ["SocialBot"] = new SocialBotProfile(),
    };

    private static readonly IBotProfile DefaultProfile = new NewManagerBotProfile();

    public static IBotProfile ResolveProfile(BotClubProfile bot)
    {
        return ProfileLookup.TryGetValue(bot.Persona, out var p) ? p : DefaultProfile;
    }

    public static decimal PersonaMultiplier(BotClubProfile bot, string persona, decimal value)
    {
        return string.Equals(bot.Persona, persona, StringComparison.Ordinal) ? value : 1m;
    }

    public static BotIntent CreateIntent(string type, decimal score, string reason, DateTime atUtc, Dictionary<string, string>? metadata = null)
    {
        return new BotIntent
        {
            IntentType = type,
            Score = Math.Clamp(score, 0m, 1m),
            Reason = reason,
            TimestampUtc = atUtc,
            Metadata = metadata ?? new Dictionary<string, string>(StringComparer.Ordinal)
        };
    }
}
