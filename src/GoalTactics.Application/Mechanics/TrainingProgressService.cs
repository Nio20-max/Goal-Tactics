namespace GoalTactics.Application.Mechanics;

public sealed class TrainingProgressService
{
    public int CalculateSkillDelta(int efficiencyValue, bool boring)
    {
        var baseDelta = efficiencyValue / 20;
        return boring ? Math.Max(0, baseDelta - 1) : Math.Max(1, baseDelta);
    }
}
