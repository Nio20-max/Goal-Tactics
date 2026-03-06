using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Lineup;

public sealed class LineupsResponse : ResponseObject
{
    public IReadOnlyList<LineupSummaryData> Lineups { get; init; } = [];
}
