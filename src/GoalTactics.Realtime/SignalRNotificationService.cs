using GoalTactics.Application.Common;
using GoalTactics.Realtime.HubState;
using GoalTactics.Realtime.Hubs;
using Microsoft.AspNetCore.SignalR;

namespace GoalTactics.Realtime;

public sealed class SignalRNotificationService : INotificationService
{
    private readonly IHubContext<ChatHub> hubContext;
    private readonly UserConnectionRegistry connectionRegistry;

    public SignalRNotificationService(IHubContext<ChatHub> hubContext, UserConnectionRegistry connectionRegistry)
    {
        this.hubContext = hubContext;
        this.connectionRegistry = connectionRegistry;
    }

    public Task SendUserNotificationAsync(string userId, string subject, string message, CancellationToken cancellationToken = default)
    {
        var connections = connectionRegistry.GetConnections(userId);
        if (connections.Count == 0)
        {
            // no active realtime connection available
            return Task.CompletedTask;
        }

        return hubContext.Clients.Clients(connections)
            .SendAsync("OutbidNotification", new { Subject = subject, Message = message, UserId = userId }, cancellationToken);
    }
}
