namespace GoalTactics.Application.Mechanics;

public sealed class TransferAuctionService
{
    public bool IsBidValid(int bid, int minimumBid, int currentBid)
    {
        if (bid < minimumBid)
        {
            return false;
        }

        return bid > currentBid;
    }
}
