namespace GoalTactics.Application.Mechanics;

public sealed class TeamStrengthCalculator
{
    public int Calculate(int baseStrength, int tacticBonus, int fitnessAverage)
    {
        var fitnessFactor = Math.Clamp(fitnessAverage, 0, 100) / 100.0;
        var value = (baseStrength + tacticBonus) * fitnessFactor;
        return Math.Max(1, (int)Math.Round(value));
    }
}
