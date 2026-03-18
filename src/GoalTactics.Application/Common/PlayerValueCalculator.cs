using System.Linq;

namespace GoalTactics.Application.Common;

public static class PlayerValueCalculator
{
    public static decimal CalculateStrength(decimal[] skills, string position, int fitness, int age, int talent, int[]? bonusSkillIndices = null)
    {
        if (skills is null || skills.Length < 14)
        {
            return 1m;
        }

        var mainIdx = LegacyAppCompatibility.MainSkillIndex(position);
        var bonusIdx = bonusSkillIndices ?? LegacyAppCompatibility.BuildBonusSkills(position);

        var main = ClampSkill(skills[mainIdx]);
        var bonusVals = bonusIdx.Where(i => i >= 0 && i < skills.Length && i != mainIdx).Select(i => ClampSkill(skills[i])).ToArray();
        var bonusAvg = bonusVals.Length == 0 ? 0m : bonusVals.Average();
        var overallAvg = skills.Select(ClampSkill).Average();

        // Fitness acts as a mild multiplicative factor, preserving intuitive behavior.
        var fitFactor = 0.80m + (Math.Clamp(fitness, 0, 100) / 500m);

        // Small age/talent influence keeps legacy flavor while still being mainly skill-driven.
        var ageFactor = age switch
        {
            <= 20 => 0.98m,
            <= 24 => 1.02m,
            <= 30 => 1.00m,
            <= 34 => 0.97m,
            _ => 0.94m
        };
        var talentFactor = 0.95m + (Math.Clamp(talent, 1, 10) * 0.01m);

        var baseStrength = (0.55m * main) + (0.25m * bonusAvg) + (0.20m * overallAvg);
        var strength = baseStrength * fitFactor * ageFactor * talentFactor;
        return Math.Clamp(Math.Round(strength, 2, MidpointRounding.AwayFromZero), 1m, 700m);
    }

    public static decimal CalculateMarketValue(decimal[] skills, string position, int fitness, int age, int talent, int[]? bonusSkillIndices = null)
    {
        var strength = CalculateStrength(skills, position, fitness, age, talent, bonusSkillIndices);
        var talentFactor = 0.85m + (Math.Clamp(talent, 1, 10) * 0.04m);
        var ageFactor = age switch
        {
            <= 20 => 1.20m,
            <= 24 => 1.10m,
            <= 30 => 1.00m,
            <= 34 => 0.85m,
            _ => 0.70m
        };

        var value = strength * strength * 10m * talentFactor * ageFactor;
        return Math.Max(25_000m, Math.Round(value, 2, MidpointRounding.AwayFromZero));
    }

    public static decimal ClampSkill(decimal skill)
    {
        return Math.Clamp(skill, 1m, 700m);
    }
}
