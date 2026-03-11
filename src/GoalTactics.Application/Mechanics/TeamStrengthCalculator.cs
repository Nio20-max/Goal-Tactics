namespace GoalTactics.Application.Mechanics;

public sealed class TeamStrengthCalculator
{
    public int Calculate(int baseStrength, int tacticBonus, int fitnessAverage)
    {
        return Math.Max(1, baseStrength + tacticBonus);
    }
}
