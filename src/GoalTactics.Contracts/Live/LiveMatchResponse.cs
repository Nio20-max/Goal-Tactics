using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Live;

/// <summary>MatchDetailsResponse in Android app.</summary>
public sealed class LiveMatchResponse : ResponseObject
{
    public LiveMatchData? Match { get; init; }
}

public sealed class LiveMatchData
{
    public Guid MatchId { get; init; }
    public string? HomeTeam { get; init; }
    public string? AwayTeam { get; init; }
    public int HomeScore { get; init; }
    public int AwayScore { get; init; }
    public string? Report { get; init; }
}
