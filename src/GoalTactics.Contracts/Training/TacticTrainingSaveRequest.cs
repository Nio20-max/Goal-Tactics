using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Training;

public sealed class TacticTrainingSaveRequest : RequestObject
{
    public string? TacticId { get; init; }
}
