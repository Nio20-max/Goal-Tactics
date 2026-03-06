namespace GoalTactics.Contracts.Training;

public sealed class TeamTrainingData
{
    public int MainSkillIndex { get; init; }

    public int SubSkillIndex { get; init; }

    public string? EfficiencyText { get; init; }

    public int EfficiencyValue { get; init; }
}
