using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotScoutingPlanner
{
    private const decimal StandardScoutCost = 10_000m;
    private const decimal PremiumScoutStars = 2_000m;

    public IEnumerable<BotIntent> Plan(BotClubProfile bot, BotPerceptionSnapshot perception, DateTime nowUtc)
    {
        if (bot.Money < StandardScoutCost)
        {
            yield break;
        }

        var profile = PlannerUtilities.ResolveProfile(bot);

        // Standard scouting: base score from TrainingDiscipline (youth investment correlates)
        var standardScore = 0.40m + (profile.TrainingDiscipline * 0.35m);

        // Squad health risk raises scouting urgency — need replacements
        if (perception.SquadHealthRisk > 3)
        {
            standardScore += 0.10m;
        }

        // Wealthier bots scout more freely
        if (bot.Money > 80_000m)
        {
            standardScore += 0.05m;
        }

        yield return PlannerUtilities.CreateIntent(
            "scouting.standard",
            standardScore,
            $"Standard scouting (discipline={profile.TrainingDiscipline:F2}, healthRisk={perception.SquadHealthRisk})",
            nowUtc);

        // Premium scouting: requires stars and risk tolerance
        if (bot.Stars >= PremiumScoutStars && profile.RiskTolerance >= 0.4m)
        {
            var premiumScore = standardScore + (profile.RiskTolerance * 0.15m);
            yield return PlannerUtilities.CreateIntent(
                "scouting.premium",
                premiumScore,
                $"Premium scouting (risk={profile.RiskTolerance:F2}, stars={bot.Stars})",
                nowUtc);
        }
    }
}
