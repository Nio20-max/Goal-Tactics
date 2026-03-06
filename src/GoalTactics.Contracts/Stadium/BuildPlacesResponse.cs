using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Stadium;

public sealed class BuildPlacesResponse : ResponseObject
{
    public IReadOnlyList<BuildPlaceData> Places { get; init; } = [];
}
