using GoalTactics.Application.Chat;
using GoalTactics.Contracts.Realtime;
using GoalTactics.Realtime.HubState;
using Microsoft.AspNetCore.SignalR;

namespace GoalTactics.Realtime.Hubs;

public sealed class ChatHub(UserConnectionRegistry registry, IChatStore chatStore) : Hub
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
        var userId = Context.UserIdentifier ?? Context.User?.Identity?.Name;
        if (!string.IsNullOrWhiteSpace(userId) && !string.IsNullOrWhiteSpace(message.Text))
        {
            await chatStore.AddMessageAsync(userId, message.Text, "global", null);
        }

        await Clients.Group("public").SendAsync("Post", teamId, message);
    }
}
