using System.Text.Json.Serialization;

namespace GoalTactics.Contracts.Friends;

/// <summary>ChallengeData in Android app.</summary>
public sealed class ChallengeData
{
    [JsonPropertyName("id")]
    public Guid Id { get; init; }

    [JsonPropertyName("matchId")]
    public Guid MatchId { get; init; }

    [JsonPropertyName("date")]
    public string? Date { get; init; }

    [JsonPropertyName("matchDate")]
    public string? MatchDate { get; init; }

    [JsonPropertyName("opponentTeamId")]
    public Guid OpponentTeamId { get; init; }

    [JsonPropertyName("opponentName")]
    public string? OpponentName { get; init; }

    [JsonPropertyName("accepted")]
    public bool Accepted { get; init; }

    [JsonPropertyName("isAccepted")]
    public bool IsAccepted { get; init; }

    [JsonPropertyName("isDeclined")]
    public bool IsDeclined { get; init; }

    [JsonPropertyName("myTeam")]
    public int MyTeam { get; init; }

    [JsonPropertyName("homeScore")]
    public int HomeScore { get; init; }

    [JsonPropertyName("awayScore")]
    public int AwayScore { get; init; }

    [JsonPropertyName("homeName")]
    public string? HomeName { get; init; }

    [JsonPropertyName("awayName")]
    public string? AwayName { get; init; }

    [JsonPropertyName("homeLogo")]
    public string? HomeLogo { get; init; }

    [JsonPropertyName("awayLogo")]
    public string? AwayLogo { get; init; }

    [JsonPropertyName("homeCountry")]
    public string? HomeCountry { get; init; }

    [JsonPropertyName("awayCountry")]
    public string? AwayCountry { get; init; }

    [JsonPropertyName("homeStrength")]
    public int HomeStrength { get; init; }

    [JsonPropertyName("awayStrength")]
    public int AwayStrength { get; init; }

    [JsonPropertyName("hasLineup")]
    public bool HasLineup { get; init; }

    [JsonPropertyName("isFriendly")]
    public bool IsFriendly { get; init; }
}
