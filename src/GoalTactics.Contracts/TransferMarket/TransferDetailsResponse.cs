using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class TransferDetailsResponse : ResponseObject
{
    public int BidCost { get; init; }
    public TransferPlayerData? Player { get; init; }
    public TransferPlayerData? AuctionPlayer { get; init; }
    public Guid MyTeamId { get; init; }
}
