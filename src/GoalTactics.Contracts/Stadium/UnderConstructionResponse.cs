using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Stadium;

public sealed class UnderConstructionResponse : ResponseObject
{
    public BuildingData? Building { get; init; }
}
