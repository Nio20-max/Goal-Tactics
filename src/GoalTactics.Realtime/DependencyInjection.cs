using GoalTactics.Application.Live;
using Microsoft.Extensions.DependencyInjection;

namespace GoalTactics.Realtime;

public static class DependencyInjection
{
    public static IServiceCollection AddGoalTacticsRealtime(this IServiceCollection services)
    {
        services.AddSignalR();
        services.AddSingleton<HubState.UserConnectionRegistry>();
        services.AddSingleton<IMatchEventBroadcaster, SignalRMatchEventBroadcaster>();
        return services;
    }
}
