using GoalTactics.Application.Mechanics;

namespace GoalTactics.Application.Live;

public interface IMatchEventBroadcaster
{
    Task BroadcastMatchResultAsync(
        Guid matchId,
        string homeName,
        string awayName,
        int homeScore,
        int awayScore,
        IReadOnlyList<MatchEvent> events,
        CancellationToken cancellationToken = default);
}
