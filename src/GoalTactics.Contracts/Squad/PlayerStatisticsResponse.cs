using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class PlayerStatisticsResponse : ResponseObject
{
    public PlayerStatisticsData? Statistics { get; init; }
}
