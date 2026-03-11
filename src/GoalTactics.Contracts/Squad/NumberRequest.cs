using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class NumberRequest : IdRequest
{
    public int Number { get; init; }
}