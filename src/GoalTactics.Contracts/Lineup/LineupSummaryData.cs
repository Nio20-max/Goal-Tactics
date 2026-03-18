namespace GoalTactics.Contracts.Lineup;

/// <summary>NewLineupStatusData : BaseMatchData in decompiled app.</summary>
public sealed class LineupSummaryData
{
    // New-client fields
    public Guid MatchId { get; init; }
    public string? Opponent { get; init; }
    public bool IsLocked { get; init; }

    // BaseMatchData fields expected by Xamarin client
    public Guid Id { get; init; }
    public string? Date { get; init; }
    public string? HomeLogo { get; init; }
    public string? AwayLogo { get; init; }
    public string? HomeName { get; init; }
    public string? AwayName { get; init; }
    public int MyTeam { get; init; }
    public string? HomeCountry { get; init; }
    public string? AwayCountry { get; init; }
    public int HomeScore { get; init; }
    public int AwayScore { get; init; }
    public Guid OpponentTeamId { get; init; }
    public int HomeStrength { get; init; }
    public int AwayStrength { get; init; }
    public bool HasLineup { get; init; }
    public bool IsFriendly { get; init; }

    // New field to match the legacy Xamarin client expectation
    // (the client treats non-league matches as friendly).
    public bool IsLeagueMatch { get; init; }

    public string? HomeTrikot { get; init; }
    public string? AwayTrikot { get; init; }
}
