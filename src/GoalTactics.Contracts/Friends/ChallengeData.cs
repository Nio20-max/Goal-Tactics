namespace GoalTactics.Contracts.Friends;

/// <summary>ChallengeData in Android app.</summary>
public sealed class ChallengeData
{
    public Guid Id { get; init; }
    public Guid MatchId { get; init; }
    public string? Date { get; init; }
    public string? MatchDate { get; init; }

    public Guid OpponentTeamId { get; init; }
    public string? OpponentName { get; init; }

    public bool Accepted { get; init; }
    public bool IsAccepted { get; init; }
    public bool IsDeclined { get; init; }

    public int MyTeam { get; init; }

    public int HomeScore { get; init; }
    public int AwayScore { get; init; }

    public string? HomeName { get; init; }
    public string? AwayName { get; init; }
    public string? HomeLogo { get; init; }
    public string? AwayLogo { get; init; }

    public string? HomeCountry { get; init; }
    public string? AwayCountry { get; init; }

    public int HomeStrength { get; init; }
    public int AwayStrength { get; init; }

    public bool HasLineup { get; init; }
    public bool IsFriendly { get; init; }
}
