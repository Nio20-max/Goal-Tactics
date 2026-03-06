using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class PlayerTextChangeRequest : IdRequest
{
    public string? Value { get; init; }
}
