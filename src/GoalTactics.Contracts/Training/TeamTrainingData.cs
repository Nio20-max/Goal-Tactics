using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Training;

public sealed class TeamTrainingData : ResponseObject
{
    public int MainSkillIndex { get; init; }
    public int SubSkillIndex { get; init; }
    public string? BoringDate { get; init; }
    public string? EfficiencyText { get; init; }
    public int EfficiencyValue { get; init; }
    public bool NoTraining { get; init; }
    public bool HasAlert { get; init; }
}
