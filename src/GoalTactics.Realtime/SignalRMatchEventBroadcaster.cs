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
        var report = MatchReportGenerator.GenerateFullReport(homeName, awayName, homeScore, awayScore, events);

        var payload = new
        {
            matchId,
            homeName,
            awayName,
            homeScore,
            awayScore,
            report,
            events = events
                .Select(e => new
                {
                    e.Minute,
                    type = e.Type.ToString(),
                    e.IsHome,
                    e.PlayerName,
                    description = MatchReportGenerator.DescribeEvent(e, homeName, awayName)
                })
                .ToArray()
        };

        await chatHub.Clients.Group("public").SendAsync("MatchResult", payload, cancellationToken);
        logger.LogDebug("Broadcast match result {MatchId}: {Home} {HomeScore}:{AwayScore} {Away}",
            matchId, homeName, homeScore, awayScore, awayName);
    }
}
