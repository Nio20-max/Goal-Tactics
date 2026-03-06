using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Lineup;

public sealed class LineupRequest : RequestObject
{
    public Guid MatchId { get; init; }
}
