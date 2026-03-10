using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class TransferSearchResponse : ResponseObject
{
    public IReadOnlyList<TransferPlayerData> Players { get; init; } = [];
    public IReadOnlyList<TransferPlayerData> Favorites { get; init; } = [];
    public IReadOnlyList<TransferPlayerData> Sellings { get; init; } = [];
    public Guid MyTeamId { get; init; }
}
