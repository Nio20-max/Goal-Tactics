using Microsoft.Extensions.DependencyInjection;

namespace GoalTactics.Realtime;

public static class DependencyInjection
{
    public static IServiceCollection AddGoalTacticsRealtime(this IServiceCollection services)
    {
        services.AddSignalR();
        services.AddSingleton<HubState.UserConnectionRegistry>();
        return services;
    }
}
