using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Lineup;

public sealed class MatchLineupResponse : ResponseObject
{
    public IReadOnlyList<MatchLineupPlayerData> Players { get; init; } = [];

    public IReadOnlyList<string> Systems { get; init; } = [];

    public IReadOnlyList<string> Tactics { get; init; } = [];

    public bool IsLocked { get; init; }
}
