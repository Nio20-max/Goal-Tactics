namespace GoalTactics.Application.Mechanics;

public sealed class TeamStrengthCalculator
{
    /// <summary>Number of individual skills per player (skill_0 through skill_13).</summary>
    public const int NumberOfSkills = 14;

    /// <summary>Minimum fitness scaling factor (at fitness 0).</summary>
    public const double MinFitnessFactor = 0.80;

    /// <summary>Maximum fitness value.</summary>
    public const int MaxFitness = 100;

    /// <summary>Divisor used to map fitness (0–100) into the 0.80–1.00 scaling range.</summary>
    public const double FitnessScaleDivisor = 500.0;

    /// <summary>
    /// Calculates effective team strength from the sum of starting-eleven individual
    /// strengths, an optional tactic bonus and the average squad fitness.
    /// Fitness scales the result between 80% (fitness 0) and 100% (fitness 100).
    /// </summary>
    public int Calculate(int baseStrength, int tacticBonus, int fitnessAverage)
    {
        var fitnessFactor = ComputeFitnessFactor(fitnessAverage);
        var effective = (int)Math.Round((baseStrength + tacticBonus) * fitnessFactor, MidpointRounding.AwayFromZero);
        return Math.Max(1, effective);
    }

    /// <summary>Maps a fitness value (0–100) to a scaling factor (0.80–1.00).</summary>
    public static double ComputeFitnessFactor(int fitnessAverage)
    {
        return MinFitnessFactor + (Math.Clamp(fitnessAverage, 0, MaxFitness) / FitnessScaleDivisor);
    }
}
