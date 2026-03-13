using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.TransferMarket;

public sealed class TransferDetailsResponse : ResponseObject
{
    public int BidCost { get; init; }
    public TransferExtendedPlayerData Player { get; init; } = new();
    public TransferAuctionPlayerData AuctionPlayer { get; init; } = new();
    public Guid MyTeamId { get; init; }
}
