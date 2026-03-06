using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Scouting;

public sealed class ScoutingPlayersResponse : ResponseObject
{
    public IReadOnlyList<ScoutedPlayerData> Players { get; init; } = [];
}
