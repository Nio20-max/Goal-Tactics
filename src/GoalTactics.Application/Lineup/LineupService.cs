using GoalTactics.Contracts.Lineup;

namespace GoalTactics.Application.Lineup;

public interface ILineupService
{
    Task<LineupsResponse> GetLineupsAsync(string userId, CancellationToken cancellationToken = default);

    Task<MatchLineupResponse> GetMatchLineupAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);

    Task SaveLineupAsync(string userId, SaveLineupRequest request, CancellationToken cancellationToken = default);
}

public sealed class LineupService : ILineupService
{
    public Task<LineupsResponse> GetLineupsAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new LineupsResponse
        {
            Success = true,
            Lineups =
            [
                new LineupSummaryData
                {
                    MatchId = Guid.NewGuid(),
                    Opponent = "Rivals FC",
                    IsLocked = false
                }
            ]
        });
    }

    public Task<MatchLineupResponse> GetMatchLineupAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new MatchLineupResponse
        {
            Success = true,
            IsLocked = false,
            Systems = ["4-4-2", "4-3-3"],
            Tactics = ["Balanced", "Pressing"],
            Players =
            [
                new MatchLineupPlayerData
                {
                    PlayerId = Guid.NewGuid(),
                    Name = "Captain",
                    Position = "MID",
                    IsStarting = true
                }
            ]
        });
    }

    public Task SaveLineupAsync(string userId, SaveLineupRequest request, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }
}
