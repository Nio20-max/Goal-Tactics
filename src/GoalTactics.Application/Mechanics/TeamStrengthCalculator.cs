namespace GoalTactics.Application.Mechanics;

public sealed class TeamStrengthCalculator
{
    /// <summary>
    /// Calculates effective team strength from the sum of starting-eleven individual
    /// strengths, an optional tactic bonus and the average squad fitness.
    /// Fitness scales the result between 80% (fitness 0) and 100% (fitness 100).
    /// </summary>
    public int Calculate(int baseStrength, int tacticBonus, int fitnessAverage)
    {
        var fitnessFactor = 0.80 + (Math.Clamp(fitnessAverage, 0, 100) / 500.0);
        var effective = (int)Math.Round((baseStrength + tacticBonus) * fitnessFactor, MidpointRounding.AwayFromZero);
        return Math.Max(1, effective);
    }
}
