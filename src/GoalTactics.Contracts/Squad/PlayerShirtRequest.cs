using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class PlayerShirtRequest : IdRequest
{
    public int ShirtNumber { get; init; }
}
