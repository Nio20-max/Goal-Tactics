using GoalTactics.Contracts.Scouting;
using GoalTactics.Contracts.Squad;

namespace GoalTactics.Application.Scouting;

public interface IScoutingService
{
    Task<ScoutingPlayersResponse> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default);

    Task InstructScoutAsync(string userId, ScoutInstructionRequest request, CancellationToken cancellationToken = default);

    Task RecruitAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task SpeedupAsync(string userId, Guid assignmentId, CancellationToken cancellationToken = default);
}

public sealed class ScoutingService : IScoutingService
{
    public Task<ScoutingPlayersResponse> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new ScoutingPlayersResponse
        {
            Success = true,
            ScoutingCost = 500,
            PremiumScoutingCost = 5,
            SpeedupCost = 3,
            Players =
            [
                new SquadPlayerData
                {
                    Id = Guid.NewGuid(),
                    Name = "Young Prospect",
                    Position = 9, // ST
                    Talent = 80,
                    Strength = 58
                }
            ]
        });
    }

    public Task InstructScoutAsync(string userId, ScoutInstructionRequest request, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }

    public Task RecruitAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }

    public Task SpeedupAsync(string userId, Guid assignmentId, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }
}
