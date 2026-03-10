using GoalTactics.Contracts.Squad;
using GoalTactics.Application.Team;

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

    Task<SkillCardsResponse> GetSkillCardsAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class SquadService(ITeamStore teamStore) : ISquadService
{
    public async Task<SquadResponse> GetSquadAsync(string userId, CancellationToken cancellationToken = default)
    {
        var players = await teamStore.GetSquadPlayersAsync(userId, cancellationToken);
        return new SquadResponse
        {
            Success = true,
            Players = players.Select(x => new SquadPlayerData
            {
                Id = x.Id,
                Name = x.Name,
                Position = int.TryParse(x.Position, out var pos) ? pos : 0,
                Strength = x.Strength,
                Fitness = x.Fitness
            }).ToArray()
        };
    }

    public async Task<PlayerStatisticsResponse> GetPlayerStatisticsAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var player = await teamStore.GetSquadPlayerAsync(userId, playerId, cancellationToken);
        if (player is null)
        {
            return new PlayerStatisticsResponse { Success = false, Message = "Player not found" };
        }

        return new PlayerStatisticsResponse
        {
            Success = true,
            MatchesThisSeason = player.Matches,
            MatchesTotalThisTeam = player.Matches,
            MatchesTotal = player.Matches,
            GoalsScoredThisSeason = player.Goals,
            GoalsScoredTotalThisTeam = player.Goals,
            GoalsScoredTotal = player.Goals,
            YellowCardsThisSeason = player.YellowCards,
            YellowCardsTotalThisTeam = player.YellowCards,
            YellowCardsTotal = player.YellowCards,
            RedCardsThisSeason = player.RedCards,
            RedCardsTotalThisTeam = player.RedCards,
            RedCardsTotal = player.RedCards
        };
    }

    public async Task ChangePlayerNameAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.UpdatePlayerNameAsync(userId, playerId, value, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Player not found.");
        }
    }

    public async Task ChangePlayerOriginAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.UpdatePlayerOriginAsync(userId, playerId, value, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Player not found.");
        }
    }

    public async Task ChangePlayerShirtAsync(string userId, Guid playerId, int shirtNumber, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.UpdatePlayerShirtAsync(userId, playerId, shirtNumber, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Player not found.");
        }
    }

    public Task SellPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task FirePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task ExtendContractAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task UpgradePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task UseSkillCardAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task<SkillCardsResponse> GetSkillCardsAsync(string userId, CancellationToken cancellationToken = default)
        => Task.FromResult(new SkillCardsResponse { Success = true });
}
