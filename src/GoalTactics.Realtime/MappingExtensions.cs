using GoalTactics.Realtime.HubFilters;
using GoalTactics.Realtime.Hubs;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Routing;
using Microsoft.Extensions.DependencyInjection;

namespace GoalTactics.Realtime;

public static class MappingExtensions
{
    public static IServiceCollection AddGoalTacticsRealtimeFilters(this IServiceCollection services)
    {
        services.AddSingleton<AuthHubFilter>();
        services.AddSingleton<RateLimitHubFilter>();
        return services;
    }

    public static IEndpointRouteBuilder MapGoalTacticsRealtime(this IEndpointRouteBuilder endpoints)
    {
        endpoints.MapHub<ChatHub>("/chat");
        endpoints.MapHub<AuctionHub>("/auc");
        return endpoints;
    }
}
