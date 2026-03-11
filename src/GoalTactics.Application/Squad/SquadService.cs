using GoalTactics.Application.Common;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Team;
using GoalTactics.Contracts.Squad;

namespace GoalTactics.Application.Squad;

public interface ISquadService
{
    Task<SquadResponse> GetSquadAsync(string userId, CancellationToken cancellationToken = default);

    Task<PlayerStatisticsResponse> GetPlayerStatisticsAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task<TeamPlayersResponse> GetTeamPlayersAsync(string userId, Guid teamId, CancellationToken cancellationToken = default);

    Task<TrainingProgressResponse> GetTrainingProgressAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task ChangePlayerNameAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default);

    Task ChangePlayerOriginAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default);

    Task ChangePlayerShirtAsync(string userId, Guid playerId, int shirtNumber, CancellationToken cancellationToken = default);

    Task SellPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task FirePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task<PlayerContractResponse> GetPlayerContractCostAsync(string userId, Guid playerId, decimal salary, CancellationToken cancellationToken = default);

    Task<PlayerContractResponse> ExtendContractAsync(string userId, Guid playerId, decimal salary, bool premiumRenewal, CancellationToken cancellationToken = default);

    Task UpgradePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task UseSkillCardAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task<SkillCardsResponse> GetSkillCardsAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class SquadService(ITeamStore teamStore, ContractCostService contractCostService) : ISquadService
{
    public async Task<SquadResponse> GetSquadAsync(string userId, CancellationToken cancellationToken = default)
    {
        var players = await teamStore.GetSquadPlayersAsync(userId, cancellationToken);
        return new SquadResponse
        {
            Success = true,
            HomeShirt = "trikot0",
            AwayShirt = "trikot0",
            CostRename = 100,
            CostShirt = 50,
            CostOrigin = 50,
            CostUpgrade = 200,
            TransfermarketMinHours = 1,
            Players = players.Select(MapSquadPlayer).ToArray()
        };
    }

    public async Task<TeamPlayersResponse> GetTeamPlayersAsync(string userId, Guid teamId, CancellationToken cancellationToken = default)
    {
        _ = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var players = await teamStore.GetSquadPlayersForTeamAsync(teamId, cancellationToken);

        return new TeamPlayersResponse
        {
            Success = true,
            Players = players.Select(MapSquadPlayer).ToArray()
        };
    }

    public async Task<TrainingProgressResponse> GetTrainingProgressAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var player = await teamStore.GetSquadPlayerAsync(userId, playerId, cancellationToken);
        if (player is null)
        {
            return new TrainingProgressResponse { Success = false, Message = "Player not found" };
        }

        var skills = LegacyAppCompatibility.BuildSkills(player.Strength, player.Position, player.Talent, player.Age);
        var today = DateTime.UtcNow.Date;

        return new TrainingProgressResponse
        {
            Success = true,
            Progress = skills
                .Select((skill, index) => (IReadOnlyList<TrainingProgressData>)Enumerable.Range(0, 5)
                    .Select(dayOffset => new TrainingProgressData
                    {
                        Date = today.AddDays(dayOffset - 4).ToString("O"),
                        Value = Math.Round(Math.Max(0m, skill - ((4 - dayOffset) * GetTrendStep(player, index))), 2)
                    })
                    .ToArray())
                .ToArray()
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

    public async Task<PlayerContractResponse> GetPlayerContractCostAsync(string userId, Guid playerId, decimal salary, CancellationToken cancellationToken = default)
    {
        var player = await teamStore.GetSquadPlayerAsync(userId, playerId, cancellationToken);
        if (player is null)
        {
            return new PlayerContractResponse { Success = false, Message = "Player not found" };
        }

        return BuildContractResponse(player, salary);
    }

    public async Task<PlayerContractResponse> ExtendContractAsync(string userId, Guid playerId, decimal salary, bool premiumRenewal, CancellationToken cancellationToken = default)
    {
        var player = await teamStore.GetSquadPlayerAsync(userId, playerId, cancellationToken);
        if (player is null)
        {
            return new PlayerContractResponse { Success = false, Message = "Player not found" };
        }

        var response = BuildContractResponse(player, salary);
        return new PlayerContractResponse
        {
            Success = response.Success,
            Message = response.Message,
            Resolution = premiumRenewal ? string.Empty : response.Resolution,
            Contracts = response.Contracts
        };
    }

    public Task UpgradePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task UseSkillCardAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task<SkillCardsResponse> GetSkillCardsAsync(string userId, CancellationToken cancellationToken = default)
        => Task.FromResult(new SkillCardsResponse
        {
            Success = true,
            SkillCards =
            [
                new SkillCardData { Skill = 0, Rarity = 1, Count = 2, Bonus = 1.25m },
                new SkillCardData { Skill = 12, Rarity = 1, Count = 3, Bonus = 1.25m },
                new SkillCardData { Skill = 11, Rarity = 1, Count = 2, Bonus = 1.25m },
                new SkillCardData { Skill = 1, Rarity = 1, Count = 4, Bonus = 1.25m },
                new SkillCardData { Skill = 0, Rarity = 2, Count = 2, Bonus = 2.5m },
                new SkillCardData { Skill = 5, Rarity = 1, Count = 2, Bonus = 1.25m },
                new SkillCardData { Skill = 3, Rarity = 0, Count = 2, Bonus = 0.5m },
                new SkillCardData { Skill = 4, Rarity = 1, Count = 2, Bonus = 1.25m },
                new SkillCardData { Skill = 9, Rarity = 2, Count = 2, Bonus = 2.5m },
                new SkillCardData { Skill = 2, Rarity = 0, Count = 3, Bonus = 0.5m },
                new SkillCardData { Skill = 12, Rarity = 0, Count = 3, Bonus = 0.5m },
                new SkillCardData { Skill = 11, Rarity = 2, Count = 1, Bonus = 2.5m },
                new SkillCardData { Skill = 8, Rarity = 1, Count = 2, Bonus = 1.25m },
                new SkillCardData { Skill = 5, Rarity = 0, Count = 2, Bonus = 0.5m },
                new SkillCardData { Skill = 0, Rarity = 0, Count = 1, Bonus = 0.5m },
                new SkillCardData { Skill = 7, Rarity = 0, Count = 1, Bonus = 0.5m },
                new SkillCardData { Skill = 11, Rarity = 0, Count = 2, Bonus = 0.5m },
                new SkillCardData { Skill = 6, Rarity = 1, Count = 1, Bonus = 1.25m },
                new SkillCardData { Skill = 13, Rarity = 1, Count = 1, Bonus = 1.25m },
                new SkillCardData { Skill = 7, Rarity = 1, Count = 1, Bonus = 1.25m },
                new SkillCardData { Skill = 1, Rarity = 0, Count = 2, Bonus = 0.5m },
                new SkillCardData { Skill = 8, Rarity = 0, Count = 1, Bonus = 0.5m },
                new SkillCardData { Skill = 10, Rarity = 1, Count = 1, Bonus = 1.25m },
                new SkillCardData { Skill = 3, Rarity = 2, Count = 1, Bonus = 2.5m },
                new SkillCardData { Skill = 5, Rarity = 2, Count = 1, Bonus = 2.5m },
                new SkillCardData { Skill = 2, Rarity = 1, Count = 2, Bonus = 1.25m },
                new SkillCardData { Skill = 6, Rarity = 0, Count = 1, Bonus = 0.5m },
                new SkillCardData { Skill = 4, Rarity = 0, Count = 1, Bonus = 0.5m },
                new SkillCardData { Skill = 12, Rarity = 2, Count = 1, Bonus = 2.5m }
            ]
        });

    private PlayerContractResponse BuildContractResponse(SquadPlayerRecord player, decimal requestedSalary)
    {
        var salary = requestedSalary > 0 ? requestedSalary : Math.Max(1_000m, player.Strength * player.Strength / 4m);
        var budgetCost = contractCostService.CalculateExtensionCost((int)Math.Round(salary, MidpointRounding.AwayFromZero), 12);

        return new PlayerContractResponse
        {
            Success = true,
            Resolution = string.Empty,
            Contracts =
            [
                new PlayerContractItem
                {
                    PlayerID = player.Id,
                    PlayerName = player.Name,
                    StartDate = DateTime.UtcNow.Date.ToString("O"),
                    EndDate = DateTime.UtcNow.Date.AddDays(365).ToString("O"),
                    Salary = salary,
                    MarketValue = Math.Max(25_000m, player.Strength * player.Strength * 10m),
                    PremiumCost = Math.Max(1, budgetCost / 50),
                    BudgetCost = budgetCost
                }
            ]
        };
    }

    private static decimal GetTrendStep(SquadPlayerRecord player, int skillIndex)
    {
        var baseStep = Math.Max(0.15m, player.Talent / 12m);
        return Math.Round(baseStep + (skillIndex % 3) * 0.08m, 2);
    }

    private static SquadPlayerData MapSquadPlayer(SquadPlayerRecord x)
    {
        return new SquadPlayerData
        {
            Id = x.Id,
            Name = x.Name,
            Country = LegacyAppCompatibility.NormalizeCountryCode(x.Origin),
            Head = LegacyAppCompatibility.BuildHeadId(x.Id),
            Strength = (double)x.Strength,
            Talent = x.Talent,
            Age = x.Age,
            Position = LegacyAppCompatibility.MapPositionCode(x.Position),
            EndDate = x.ContractEndUtc?.ToString("O"),
            Experience = (int)LegacyAppCompatibility.BuildExperience(x.Strength, x.Age, x.Matches),
            Fitness = (double)x.Fitness,
            Body = LegacyAppCompatibility.BuildBodyId(x.Id),
            Gloves = LegacyAppCompatibility.BuildGlovesId(x.Id, x.Position == "GK"),
            Shoes = LegacyAppCompatibility.BuildShoesId(x.Id),
            Salary = (long)Math.Max(1_000m, x.Strength * x.Strength / 4m),
            MarketValue = (long)Math.Max(25_000m, x.Strength * x.Strength * 10m),
            Origin = x.Origin,
            Skills = Array.ConvertAll(LegacyAppCompatibility.BuildSkills(x.Strength, x.Position, x.Talent, x.Age), v => (double)v),
            MainSkill = LegacyAppCompatibility.MainSkillIndex(x.Position),
            BonusSkills = LegacyAppCompatibility.BuildBonusSkills(x.Position),
            YellowCards = x.YellowCards,
            HasRedCard = x.RedCards > 0,
            Injured = false,
            IsForSale = false,
            SellPrice = (long)Math.Max(10_000m, x.Strength * x.Strength),
            TransfermarketFee = (long)Math.Max(1_000m, x.Strength * 14m),
            TransfermarketMaxOffer = (long)Math.Max(10_000m, x.Strength * x.Strength * 11m / 10m),
            TransfermarketMinOffer = (long)Math.Max(1_000m, x.Strength * 14m),
            TransfermarketMaxHours = 48,
            IsUpgraded = false,
            MaxUpgradeStrength = (double)(x.Strength + 25m),
            Shirt = x.ShirtNumber <= 0 ? -1 : x.ShirtNumber,
            CanExtendContract = true,
            HasIndividualTraining = !string.IsNullOrWhiteSpace(x.IndividualTrainingSkill)
        };
    }
}
