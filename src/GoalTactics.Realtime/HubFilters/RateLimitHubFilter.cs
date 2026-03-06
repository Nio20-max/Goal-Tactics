using System.Collections.Concurrent;
using Microsoft.AspNetCore.SignalR;

namespace GoalTactics.Realtime.HubFilters;

public sealed class RateLimitHubFilter : IHubFilter
{
    private readonly ConcurrentDictionary<string, DateTime> lastCall = new(StringComparer.Ordinal);

    public async ValueTask<object?> InvokeMethodAsync(
        HubInvocationContext invocationContext,
        Func<HubInvocationContext, ValueTask<object?>> next)
    {
        var key = $"{invocationContext.Context.ConnectionId}:{invocationContext.HubMethodName}";
        var now = DateTime.UtcNow;
        if (lastCall.TryGetValue(key, out var previous) && (now - previous).TotalMilliseconds < 100)
        {
            throw new HubException("Rate limited");
        }

        lastCall[key] = now;
        return await next(invocationContext);
    }
}
