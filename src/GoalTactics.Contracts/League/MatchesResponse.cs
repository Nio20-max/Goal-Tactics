using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.League;

public sealed class MatchesResponse : ResponseObject
{
    public IReadOnlyList<MatchData> Matches { get; init; } = [];
    public string? HomeTrikot { get; init; }
    public string? AwayTrikot { get; init; }
}
