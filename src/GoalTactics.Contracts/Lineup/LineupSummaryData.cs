namespace GoalTactics.Contracts.Lineup;

public sealed class LineupSummaryData
{
    public Guid MatchId { get; init; }

    public string? Opponent { get; init; }

    public bool IsLocked { get; init; }
}
