using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class TransferDetailsResponse : ResponseObject
{
    public TransferPlayerData? Player { get; init; }
}
