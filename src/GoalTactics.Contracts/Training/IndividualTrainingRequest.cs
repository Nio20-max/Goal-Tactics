using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Training;

public sealed class IndividualTrainingRequest : IdRequest
{
    public string? SkillType { get; init; }
}
