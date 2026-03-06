using GoalTactics.Contracts.Realtime;
using GoalTactics.Realtime.HubState;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.SignalR;

namespace GoalTactics.Realtime.Hubs;

[Authorize]
public sealed class ChatHub(UserConnectionRegistry registry) : Hub
{
    public override async Task OnConnectedAsync()
    {
        var userId = Context.UserIdentifier ?? Context.User?.Identity?.Name;
        if (!string.IsNullOrWhiteSpace(userId))
        {
            registry.Add(userId, Context.ConnectionId);
        }

        await Groups.AddToGroupAsync(Context.ConnectionId, "public");
        await base.OnConnectedAsync();
    }

    public override async Task OnDisconnectedAsync(Exception? exception)
    {
        var userId = Context.UserIdentifier ?? Context.User?.Identity?.Name;
        if (!string.IsNullOrWhiteSpace(userId))
        {
            registry.Remove(userId, Context.ConnectionId);
        }

        await base.OnDisconnectedAsync(exception);
    }

    public async Task Typing(Guid teamId, string text)
    {
        await Clients.Group("public").SendAsync("Typing", teamId, text);
    }

    public async Task Post(Guid teamId, ChatMessage message)
    {
        await Clients.Group("public").SendAsync("Post", teamId, message);
    }
}
