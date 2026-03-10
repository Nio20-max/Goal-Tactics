namespace GoalTactics.Contracts.Friends;

/// <summary>ChallengeData : MatchData : BaseMatchData in decompiled app.</summary>
public sealed class ChallengeData
{
    // BaseMatchData fields
    public Guid Id { get; init; }
    public string? Date { get; init; }
    public string? HomeLogo { get; init; }
    public string? AwayLogo { get; init; }
    public string? HomeName { get; init; }
    public string? AwayName { get; init; }
    public int MyTeam { get; init; }
    // MatchData fields
    public string? HomeCountry { get; init; }
    public string? AwayCountry { get; init; }
    public int HomeScore { get; init; }
    public int AwayScore { get; init; }
    public Guid OpponentTeamId { get; init; }
    public int HomeStrength { get; init; }
    public int AwayStrength { get; init; }
    public bool HasLineup { get; init; }
    public string? HomeTrikot { get; init; }
    public string? AwayTrikot { get; init; }
    public bool IsFriendly { get; init; }
    // ChallengeData specific
    public bool IsAccepted { get; init; }
    public bool IsDeclined { get; init; }
    public Guid MatchId { get; init; }
    public string? MatchDate { get; init; }
}
