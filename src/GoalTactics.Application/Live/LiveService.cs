using GoalTactics.Contracts.Live;
using GoalTactics.Contracts.Team;

namespace GoalTactics.Application.Live;

public interface ILiveService
{
    Task<LiveMatchResponse> GetLiveMatchAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);

    Task<LiveMatchResponse> GetMatchReportAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);
}

public sealed class LiveService : ILiveService
{
    public Task<LiveMatchResponse> GetLiveMatchAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new LiveMatchResponse
        {
            Success = true,
            Report = "Match has not started",
            Match = new MatchData
            {
                Id = matchId == Guid.Empty ? Guid.NewGuid() : matchId,
                HomeName = "My Team",
                AwayName = "Opponent",
                HomeScore = 0,
                AwayScore = 0,
                Date = DateTime.UtcNow.ToString("O")
            }
        });
    }

    public Task<LiveMatchResponse> GetMatchReportAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new LiveMatchResponse
        {
            Success = true,
            Report = "Generated report placeholder",
            Match = new MatchData
            {
                Id = matchId == Guid.Empty ? Guid.NewGuid() : matchId,
                HomeName = "My Team",
                AwayName = "Opponent",
                HomeScore = 1,
                AwayScore = 0,
                Date = DateTime.UtcNow.ToString("O")
            }
        });
    }
}
