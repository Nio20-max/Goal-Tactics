using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Stadium;

public sealed class StadiumResponse : ResponseObject
{
    public StadiumData? Stadium { get; init; }
}
