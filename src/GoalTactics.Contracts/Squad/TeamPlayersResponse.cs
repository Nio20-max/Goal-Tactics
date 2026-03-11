using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class TeamPlayersResponse : ResponseObject
{
    public IReadOnlyList<SquadPlayerData> Players { get; init; } = [];
}