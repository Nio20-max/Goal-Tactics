using Microsoft.AspNetCore.SignalR;

namespace GoalTactics.Realtime.HubFilters;

public sealed class AuthHubFilter : IHubFilter
{
    public async ValueTask<object?> InvokeMethodAsync(
        HubInvocationContext invocationContext,
        Func<HubInvocationContext, ValueTask<object?>> next)
    {
        if (invocationContext.Context.User?.Identity?.IsAuthenticated != true)
        {
            throw new HubException("Unauthorized");
        }

        return await next(invocationContext);
    }
}
