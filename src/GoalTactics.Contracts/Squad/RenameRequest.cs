using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class RenameRequest : IdRequest
{
    public string? Name { get; init; }
}