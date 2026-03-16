using GoalTactics.Application.Common;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Team;
using GoalTactics.Application.TransferMarket;
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

    Task UseSkillCardAsync(string userId, Guid playerId, Team.SkillCardRecord? selectedCard = null, CancellationToken cancellationToken = default);

    Task HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task<SkillCardsResponse> GetSkillCardsAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class SquadService(ITeamStore teamStore, ContractCostService contractCostService, IAuctionStore auctionStore) : ISquadService
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

        var skills = player.Skills;
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

    public async Task SellPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var player = await teamStore.GetSquadPlayerAsync(userId, playerId, cancellationToken);
        if (player is null)
        {
            throw new InvalidOperationException("Player not found.");
        }

        // Legacy squad sell action does not provide bid/duration in the request,
        // so use compatibility defaults derived from the player.
        var minimumBid = (long)Math.Round(Math.Max(1_000m, player.Strength * 14m), MidpointRounding.AwayFromZero);
        await auctionStore.ListPlayerAsync(
            team.TeamId,
            playerId.ToString("N"),
            minimumBid,
            TimeSpan.FromHours(4),
            cancellationToken);
    }

    public async Task FirePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.RemovePlayerAsync(userId, playerId, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Player not found.");
        }
    }

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

        // Grant skill cards based on the salary amount on the contract.
        // The card count is derived from the salary (1 card per 1,000 salary).
        var cardCount = Math.Max(1, (int)Math.Round(response.Contracts.First().Salary / 1000m));
        await teamStore.AddSkillCardsAsync(userId, new[]
        {
            new SkillCardRecord(0, 0, cardCount, 0.5m)
        }, cancellationToken);

        return new PlayerContractResponse
        {
            Success = response.Success,
            Message = response.Message,
            Resolution = premiumRenewal ? string.Empty : response.Resolution,
            Contracts = response.Contracts
        };
    }

    public async Task UpgradePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.UpgradePlayerStrengthAsync(userId, playerId, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Upgrade failed. Insufficient GT Stars or player not found.");
        }
    }

    public async Task UseSkillCardAsync(string userId, Guid playerId, SkillCardRecord? selectedCard = null, CancellationToken cancellationToken = default)
    {
        var player = await teamStore.GetSquadPlayerAsync(userId, playerId, cancellationToken)
            ?? throw new InvalidOperationException("Player not found in squad.");

        var skillCards = await teamStore.GetSkillCardsAsync(userId, cancellationToken);

        // If the client selected a card, try to use it; otherwise, pick the best available card.
        var cardToUse = selectedCard is null
            ? skillCards.OrderByDescending(c => c.Bonus).ThenByDescending(c => c.Rarity).FirstOrDefault()
            : skillCards.FirstOrDefault(c => c.Skill == selectedCard.Skill && c.Rarity == selectedCard.Rarity && c.Bonus == selectedCard.Bonus);

        if (cardToUse is null)
        {
            throw new InvalidOperationException("No skill cards available.");
        }

        // Apply the card bonus to the player's target skill and recalculate strength.
        var applied = await teamStore.ApplySkillCardToPlayerAsync(userId, playerId, cardToUse, cancellationToken);
        if (!applied)
        {
            throw new InvalidOperationException("Skill card could not be applied.");
        }

        // Consume the card (decrement count or remove)
        await teamStore.UseSkillCardAsync(userId, cardToUse, cancellationToken);
    }

    public async Task HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.HealPlayerAsync(userId, playerId, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Heal failed. No medipacks available or player not found.");
        }
    }

    public async Task<SkillCardsResponse> GetSkillCardsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var cards = await teamStore.GetSkillCardsAsync(userId, cancellationToken);
        return new GoalTactics.Contracts.Squad.SkillCardsResponse
        {
            Success = true,
            SkillCards = cards.Select(x => new GoalTactics.Contracts.Squad.SkillCardData { Skill = x.Skill, Rarity = x.Rarity, Count = x.Count, Bonus = x.Bonus }).ToArray()
        };
    }

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
                    MarketValue = player.MarketValue,
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
            Head = x.Head,
            Strength = x.Strength,
            Talent = x.Talent,
            Age = x.Age,
            Position = LegacyAppCompatibility.MapPositionCode(x.Position),
            EndDate = x.ContractEndUtc?.ToString("O"),
            Experience = LegacyAppCompatibility.BuildExperience(x.Strength, x.Age, x.Matches),
            Fitness = (int)x.Fitness,
            Body = x.Body,
            Gloves = x.Gloves,
            Shoes = x.Shoes,
            Salary = Math.Max(1_000m, x.Strength * x.Strength / 4m),
            MarketValue = x.MarketValue,
            Origin = x.Origin,
            Skills = x.Skills,
            MainSkill = LegacyAppCompatibility.MainSkillIndex(x.Position),
            BonusSkills = LegacyAppCompatibility.BuildBonusSkills(x.Position),
            YellowCards = x.YellowCards,
            HasRedCard = x.RedCards > 0,
            Injured = 0,
            IsForSale = false,
            // Legacy clients expected a fixed sell price, but it should reflect market value.
            SellPrice = x.MarketValue,
            TransfermarketFee = Math.Max(1_000m, x.Strength * 14m),
            // Allow max offer to scale with market value (instead of being hard-capped at 10000)
            // Keep a lower bound for very low-value players.
            TransfermarketMaxOffer = Math.Max(10_000m, x.MarketValue * 1.1m),
            TransfermarketMinOffer = Math.Max(1_000m, x.Strength * 14m),
            TransfermarketMaxHours = 48,
            IsUpgraded = false,
            MaxUpgradeStrength = (int)(x.Strength + 25m),
            Shirt = x.ShirtNumber <= 0 ? -1 : x.ShirtNumber,
            CanExtendContract = true,
            HasIndividualTraining = !string.IsNullOrWhiteSpace(x.IndividualTrainingSkill)
        };
    }
}
