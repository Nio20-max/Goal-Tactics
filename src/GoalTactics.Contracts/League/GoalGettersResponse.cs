using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.League;

public sealed class GoalGettersResponse : ResponseObject
{
    public IReadOnlyList<GoalGetterPlayerData> Players { get; init; } = [];
}
