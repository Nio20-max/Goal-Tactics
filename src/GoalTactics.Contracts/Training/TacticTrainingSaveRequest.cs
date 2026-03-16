using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Training;

public sealed class TacticTrainingSaveRequest : IdRequest
{
    /// <summary>
    /// Legacy clients send this.
    /// </summary>
    public string? TacticId { get; init; }
}
