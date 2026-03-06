using GoalTactics.Contracts.Squad;

namespace GoalTactics.Application.Squad;

public interface ISquadService
{
    Task<SquadResponse> GetSquadAsync(string userId, CancellationToken cancellationToken = default);

    Task<PlayerStatisticsResponse> GetPlayerStatisticsAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task ChangePlayerNameAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default);

    Task ChangePlayerOriginAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default);

    Task ChangePlayerShirtAsync(string userId, Guid playerId, int shirtNumber, CancellationToken cancellationToken = default);

    Task SellPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task FirePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task ExtendContractAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task UpgradePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task UseSkillCardAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);
}

public sealed class SquadService : ISquadService
{
    public Task<SquadResponse> GetSquadAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new SquadResponse
        {
            Success = true,
            Players =
            [
                new SquadPlayerData
                {
                    Id = Guid.NewGuid(),
                    Name = "Player One",
                    Position = "MID",
                    Strength = 62,
                    Fitness = 95
                }
            ]
        });
    }

    public Task<PlayerStatisticsResponse> GetPlayerStatisticsAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new PlayerStatisticsResponse
        {
            Success = true,
            Statistics = new PlayerStatisticsData
            {
                PlayerId = playerId,
                Matches = 12,
                Goals = 5,
                YellowCards = 1,
                RedCards = 0
            }
        });
    }

    public Task ChangePlayerNameAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task ChangePlayerOriginAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task ChangePlayerShirtAsync(string userId, Guid playerId, int shirtNumber, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task SellPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task FirePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task ExtendContractAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task UpgradePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task UseSkillCardAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;
}
