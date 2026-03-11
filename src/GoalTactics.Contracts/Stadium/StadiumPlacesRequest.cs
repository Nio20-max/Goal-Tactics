using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Stadium;

public sealed class StadiumPlacesRequest : RequestObject
{
    public List<StadiumPlacesOrder>? Places { get; init; }
}

public sealed class StadiumPlacesOrder
{
    public Guid Id { get; init; }
    public int Count { get; init; }
}
