using GoalTactics.Contracts.Realtime;
using Microsoft.AspNetCore.SignalR;

namespace GoalTactics.Realtime.Hubs;

public sealed class AuctionHub : Hub
{
    public Task Subscribe(Guid auctionId)
    {
        return Groups.AddToGroupAsync(Context.ConnectionId, GroupName(auctionId));
    }

    public Task Unsubscribe(Guid auctionId)
    {
        return Groups.RemoveFromGroupAsync(Context.ConnectionId, GroupName(auctionId));
    }

    public Task BroadcastBid(JsonRealtimeBid bid)
    {
        return Clients.Group(GroupName(bid.AuctionId)).SendAsync("Bidded", bid);
    }

    private static string GroupName(Guid auctionId) => $"auc:{auctionId:N}";
}
