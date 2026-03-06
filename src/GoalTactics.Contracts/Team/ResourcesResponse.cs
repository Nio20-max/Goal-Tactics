using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class ResourcesResponse : ResponseObject
{
    public decimal Money { get; init; }

    public decimal Medipacks { get; init; }

    public decimal GTStars { get; init; }
}
