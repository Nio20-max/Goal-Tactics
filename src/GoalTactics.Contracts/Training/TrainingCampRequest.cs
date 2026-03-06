using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Training;

public sealed class TrainingCampRequest : RequestObject
{
    public string? CampType { get; init; }
}
