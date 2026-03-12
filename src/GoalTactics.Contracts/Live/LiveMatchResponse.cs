using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Live;

/// <summary>MatchDetailsResponse in Android app.</summary>
public sealed class LiveMatchResponse : ResponseObject
{
    public LiveMatchData? Match { get; init; }

    /// <summary>Xamarin reads Report at response level.</summary>
    public string? Report { get; init; }
}

public sealed class LiveMatchData
{
    // Android fields
    public Guid MatchId { get; init; }
    public string? HomeTeam { get; init; }
    public string? AwayTeam { get; init; }

    // Xamarin fields (match original captured format)
    public Guid Id { get; init; }
    public string? HomeName { get; init; }
    public string? AwayName { get; init; }
    public string? HomeLogo { get; init; }
    public string? AwayLogo { get; init; }
    public string? HomeCountry { get; init; }
    public string? AwayCountry { get; init; }
    public int HomeScore { get; init; }
    public int AwayScore { get; init; }
    public int HomeStrength { get; init; }
    public int AwayStrength { get; init; }
    public bool HasLineup { get; init; }
    public bool IsFriendly { get; init; }
    public string? HomeTrikot { get; init; }
    public string? AwayTrikot { get; init; }
    public Guid OpponentTeamId { get; init; }
    public string? Date { get; init; }
    public int MyTeam { get; init; }
    public string? Report { get; init; }
}
