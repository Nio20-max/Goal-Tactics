namespace GoalTactics.Contracts.TransferMarket;

public class TransferDetailsRequest : Common.RequestObject
{
    public Guid AuctionId { get; init; }
}
