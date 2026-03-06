using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Training;

public sealed class TeamTrainingResponse : ResponseObject
{
    public TeamTrainingData? TeamTraining { get; init; }
}
