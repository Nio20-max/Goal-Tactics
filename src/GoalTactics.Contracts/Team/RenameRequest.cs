using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class RenameRequest : IdRequest
{
    public string? Name { get; init; }
}
