using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class TransferSearchResponse : ResponseObject
{
    public IReadOnlyList<TransferPlayerData> Players { get; init; } = [];
}
