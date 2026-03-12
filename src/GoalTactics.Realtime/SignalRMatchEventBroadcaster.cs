using GoalTactics.Application.Live;
using GoalTactics.Application.Mechanics;
using GoalTactics.Realtime.Hubs;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Realtime;

public sealed class SignalRMatchEventBroadcaster(
    IHubContext<ChatHub> chatHub,
    ILogger<SignalRMatchEventBroadcaster> logger) : IMatchEventBroadcaster
{
    public async Task BroadcastMatchResultAsync(
        Guid matchId,
        string homeName,
        string awayName,
        int homeScore,
        int awayScore,
        IReadOnlyList<MatchEvent> events,
        CancellationToken cancellationToken = default)
    {
        var payload = new
        {
            matchId,
            homeName,
            awayName,
            homeScore,
            awayScore,
            goals = events
                .Where(e => e.Type == MatchEventType.Goal)
                .Select(e => new { e.Minute, e.IsHome, e.PlayerName })
                .ToArray(),
            cards = events
                .Where(e => e.Type is MatchEventType.YellowCard or MatchEventType.RedCard)
                .Select(e => new { e.Minute, e.IsHome, type = e.Type.ToString(), e.PlayerName })
                .ToArray()
        };

        await chatHub.Clients.Group("public").SendAsync("MatchResult", payload, cancellationToken);
        logger.LogDebug("Broadcast match result {MatchId}: {Home} {HomeScore}:{AwayScore} {Away}",
            matchId, homeName, homeScore, awayScore, awayName);
    }
}
