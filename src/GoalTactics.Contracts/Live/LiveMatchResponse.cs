using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Team;

namespace GoalTactics.Contracts.Live;

/// <summary>MatchDetailsResponse in decompiled app.</summary>
public sealed class LiveMatchResponse : ResponseObject
{
    public string? Report { get; init; }
    public MatchData? Match { get; init; }
}
