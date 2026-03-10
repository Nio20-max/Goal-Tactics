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
            Lineups = []
        });
    }

    public Task<MatchLineupResponse> GetMatchLineupAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var systemId = Guid.NewGuid();
        var tacticId = Guid.NewGuid();

        return Task.FromResult(new MatchLineupResponse
        {
            Success = true,
            IsLocked = false,
            Systems =
            [
                new MatchSystemData
                {
                    Id = systemId,
                    Name = "4-4-2",
                    Fields =
                    [
                        new MatchSystemFieldData { Id = Guid.NewGuid(), PositionId = Guid.NewGuid() }
                    ]
                }
            ],
            Tactics =
            [
                new TacticData { ID = tacticId, Name = "Balanced", Value = 0 }
            ],
            FormationData = new MatchFormationData
            {
                MatchSystemID = systemId,
                MatchTacticID = tacticId,
                Players = []
            },
            Players =
            [
                new MatchLineupPlayerData
                {
                    Id = Guid.NewGuid(),
                    Name = "Captain",
                    Position = 3
                }
            ]
        });
    }

    public Task SaveLineupAsync(string userId, SaveLineupRequest request, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }
}
