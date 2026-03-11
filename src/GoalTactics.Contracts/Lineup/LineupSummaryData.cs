namespace GoalTactics.Contracts.Lineup;

/// <summary>NewLineupStatusData : BaseMatchData in decompiled app.</summary>
public sealed class LineupSummaryData
{
    public Guid MatchId { get; init; }
    public string? Opponent { get; init; }
    public bool IsLocked { get; init; }
}
