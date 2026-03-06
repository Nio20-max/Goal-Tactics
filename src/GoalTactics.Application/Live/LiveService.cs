using GoalTactics.Contracts.Live;

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
            Match = new LiveMatchData
            {
                MatchId = matchId == Guid.Empty ? Guid.NewGuid() : matchId,
                HomeTeam = "My Team",
                AwayTeam = "Opponent",
                HomeScore = 0,
                AwayScore = 0,
                Report = "Match has not started"
            }
        });
    }

    public Task<LiveMatchResponse> GetMatchReportAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new LiveMatchResponse
        {
            Success = true,
            Match = new LiveMatchData
            {
                MatchId = matchId == Guid.Empty ? Guid.NewGuid() : matchId,
                HomeTeam = "My Team",
                AwayTeam = "Opponent",
                HomeScore = 1,
                AwayScore = 0,
                Report = "Generated report placeholder"
            }
        });
    }
}
