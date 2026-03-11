using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class SquadResponse : ResponseObject
{
    public IReadOnlyList<SquadPlayerData> Players { get; init; } = [];
    public IReadOnlyList<SquadPlayerData> PlayersOnTransfermarket { get; init; } = [];
    public string? HomeShirt { get; init; }
    public string? AwayShirt { get; init; }
    public int CostRename { get; init; }
    public int CostShirt { get; init; }
    public int CostOrigin { get; init; }
    public int CostUpgrade { get; init; }
    public int TransfermarketMinHours { get; init; }
}
