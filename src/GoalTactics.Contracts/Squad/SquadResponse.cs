using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class SquadResponse : ResponseObject
{
    public IReadOnlyList<SquadPlayerData> Players { get; init; } = [];
}
