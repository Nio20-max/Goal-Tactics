namespace GoalTactics.Contracts.Lineup;

/// <summary>NewLineupStatusData : BaseMatchData in decompiled app.</summary>
public sealed class LineupSummaryData
{
    public Guid Id { get; init; }
    public string? Date { get; init; }
    public string? HomeLogo { get; init; }
    public string? AwayLogo { get; init; }
    public string? HomeName { get; init; }
    public string? AwayName { get; init; }
    public int MyTeam { get; init; }
    public int LineupStatus { get; init; } // 0=OK, 1=Incomplete, 2=NoLineup
    public bool IsLeagueMatch { get; init; }
}
