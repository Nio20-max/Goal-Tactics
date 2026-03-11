using GoalTactics.Contracts.Training;
using GoalTactics.Application.Team;

namespace GoalTactics.Application.Training;

public interface ITrainingService
{
    Task<TeamTrainingResponse> GetTeamTrainingAsync(string userId, CancellationToken cancellationToken = default);

    Task SaveTeamTrainingAsync(string userId, TeamTrainingSaveRequest request, CancellationToken cancellationToken = default);

    Task SaveTacticTrainingAsync(string userId, TacticTrainingSaveRequest request, CancellationToken cancellationToken = default);

    Task BookCampAsync(string userId, TrainingCampRequest request, CancellationToken cancellationToken = default);

    Task CancelCampAsync(string userId, CancellationToken cancellationToken = default);

    Task UpdateCampsAsync(string userId, CancellationToken cancellationToken = default);

    Task SaveIndividualTrainingAsync(string userId, IndividualTrainingRequest request, CancellationToken cancellationToken = default);

    Task CancelIndividualTrainingAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task RenewIndividualTrainingAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task RenewAllIndividualTrainingAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class TrainingService(ITeamStore teamStore) : ITrainingService
{
    public async Task<TeamTrainingResponse> GetTeamTrainingAsync(string userId, CancellationToken cancellationToken = default)
    {
        var state = await teamStore.GetTrainingStateAsync(userId, cancellationToken);
        var players = await teamStore.GetSquadPlayersAsync(userId, cancellationToken);

        return new TeamTrainingResponse
        {
            Success = true,
            TeamTraining = new TeamTrainingData
            {
                MainSkillIndex = state.MainSkillIndex,
                SubSkillIndex = state.SubSkillIndex,
                BoringDate = DateTime.UtcNow.Date.AddDays(1).AddHours(7).ToString("O"),
                EfficiencyText = state.EfficiencyText,
                EfficiencyValue = state.EfficiencyValue,
                NoTraining = false,
                HasAlert = false
            },
            TacticTraining = BuildTacticTraining(),
            TrainingCamp = BuildTrainingCamp(state),
            IndividualTraining = new IndividualTrainingData
            {
                Success = true,
                TrainPrice = state.TrainPrice,
                RenewPrice = state.TrainPrice,
                RenewAllPrice = players.Count(player => !string.IsNullOrWhiteSpace(player.IndividualTrainingSkill)) * state.TrainPrice,
                Players = players.Select(BuildTrainingPlayer).ToArray()
            }
        };
    }

    public Task SaveTeamTrainingAsync(string userId, TeamTrainingSaveRequest request, CancellationToken cancellationToken = default)
    {
        return teamStore.SaveTeamTrainingAsync(userId, request.MainSkillIndex, request.SubSkillIndex, cancellationToken);
    }

    public Task SaveTacticTrainingAsync(string userId, TacticTrainingSaveRequest request, CancellationToken cancellationToken = default)
    {
        // Tactic training is not persisted separately yet.
        return Task.CompletedTask;
    }

    public async Task BookCampAsync(string userId, TrainingCampRequest request, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.BookCampAsync(userId, request.CampType ?? "generic", cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Insufficient resources to book camp.");
        }
    }

    public Task CancelCampAsync(string userId, CancellationToken cancellationToken = default)
    {
        return teamStore.CancelCampAsync(userId, cancellationToken);
    }

    public async Task UpdateCampsAsync(string userId, CancellationToken cancellationToken = default)
    {
        if (!await teamStore.TrySpendStarsAsync(userId, 1_000m, cancellationToken))
        {
            throw new InvalidOperationException("Insufficient stars to refresh camps.");
        }
    }

    public async Task SaveIndividualTrainingAsync(string userId, IndividualTrainingRequest request, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.SaveIndividualTrainingAsync(userId, request.Id, request.SkillType, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Player not found.");
        }
    }

    public async Task CancelIndividualTrainingAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.SaveIndividualTrainingAsync(userId, playerId, null, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Player not found.");
        }
    }

    public async Task RenewIndividualTrainingAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var renewed = await teamStore.RenewIndividualTrainingAsync(userId, playerId, cancellationToken);
        if (renewed == 0)
        {
            throw new InvalidOperationException("Insufficient stars or no active individual training.");
        }
    }

    public async Task RenewAllIndividualTrainingAsync(string userId, CancellationToken cancellationToken = default)
    {
        var renewed = await teamStore.RenewIndividualTrainingAsync(userId, null, cancellationToken);
        if (renewed == 0)
        {
            throw new InvalidOperationException("Insufficient stars or no active individual training.");
        }
    }

    private static TacticTrainingData BuildTacticTraining()
    {
        var tactics = new[]
        {
            new { Id = Guid.Parse("91a5e724-7b88-4777-8c73-008ad20a5dea"), Name = "Normal", Value = 83, Counters = new[] { (Guid.Parse("99baeb1f-c7cf-4f75-9d5b-12d508a174a9"), 8.30m, 10), (Guid.Parse("fc645db1-90bd-4924-b642-6efeabad1fdb"), 4.15m, 5), (Guid.Parse("9cf6d48e-8268-432d-80b2-7ad2f986f8c7"), 1.66m, 2) } },
            new { Id = Guid.Parse("99baeb1f-c7cf-4f75-9d5b-12d508a174a9"), Name = "Pressing", Value = 20, Counters = new[] { (Guid.Parse("fc645db1-90bd-4924-b642-6efeabad1fdb"), 2.00m, 10), (Guid.Parse("9cf6d48e-8268-432d-80b2-7ad2f986f8c7"), 1.00m, 5), (Guid.Parse("b83f08e9-500f-4fab-bb16-885e4d5532d2"), 0.40m, 2) } },
            new { Id = Guid.Parse("fc645db1-90bd-4924-b642-6efeabad1fdb"), Name = "One-Touch", Value = 12, Counters = new[] { (Guid.Parse("9cf6d48e-8268-432d-80b2-7ad2f986f8c7"), 1.20m, 10), (Guid.Parse("b83f08e9-500f-4fab-bb16-885e4d5532d2"), 0.60m, 5), (Guid.Parse("2f47a8d8-ca9a-4a89-a908-da69d3c6e41b"), 0.24m, 2) } },
            new { Id = Guid.Parse("9cf6d48e-8268-432d-80b2-7ad2f986f8c7"), Name = "Durch die Mitte", Value = 40, Counters = new[] { (Guid.Parse("b83f08e9-500f-4fab-bb16-885e4d5532d2"), 4.00m, 10), (Guid.Parse("2f47a8d8-ca9a-4a89-a908-da69d3c6e41b"), 2.00m, 5), (Guid.Parse("02f01198-2101-4ba0-88d4-f02442240e1c"), 0.80m, 2) } },
            new { Id = Guid.Parse("b83f08e9-500f-4fab-bb16-885e4d5532d2"), Name = "Konter", Value = 10, Counters = new[] { (Guid.Parse("2f47a8d8-ca9a-4a89-a908-da69d3c6e41b"), 1.00m, 10), (Guid.Parse("02f01198-2101-4ba0-88d4-f02442240e1c"), 0.50m, 5), (Guid.Parse("91a5e724-7b88-4777-8c73-008ad20a5dea"), 0.20m, 2) } },
            new { Id = Guid.Parse("2f47a8d8-ca9a-4a89-a908-da69d3c6e41b"), Name = "Über die Flügel", Value = 30, Counters = new[] { (Guid.Parse("02f01198-2101-4ba0-88d4-f02442240e1c"), 3.00m, 10), (Guid.Parse("91a5e724-7b88-4777-8c73-008ad20a5dea"), 1.50m, 5), (Guid.Parse("99baeb1f-c7cf-4f75-9d5b-12d508a174a9"), 0.60m, 2) } },
            new { Id = Guid.Parse("02f01198-2101-4ba0-88d4-f02442240e1c"), Name = "Kick and Rush", Value = 100, Counters = new[] { (Guid.Parse("91a5e724-7b88-4777-8c73-008ad20a5dea"), 10.00m, 10), (Guid.Parse("99baeb1f-c7cf-4f75-9d5b-12d508a174a9"), 5.00m, 5), (Guid.Parse("fc645db1-90bd-4924-b642-6efeabad1fdb"), 2.00m, 2) } }
        };

        return new TacticTrainingData
        {
            Success = true,
            SelectedTacticId = tactics[0].Id,
            TacticBonusList = tactics.Select(tactic => new TacticBonus
            {
                Tactic = new TacticBonusTactic
                {
                    Id = tactic.Id,
                    Name = tactic.Name,
                    Value = tactic.Value
                },
                CounterTactics = tactic.Counters.Select(counter => new CounterTactic
                {
                    TacticId = counter.Item1,
                    Bonus = counter.Item2,
                    MaxBonus = counter.Item3
                }).ToArray()
            }).ToArray()
        };
    }

    private static TrainingCampData BuildTrainingCamp(TeamTrainingStateRecord state)
    {
        var activeIdentifier = string.IsNullOrWhiteSpace(state.CampType) ? null : state.CampType;
        var activeBookDate = state.CampActiveUntilUtc?.ToString("O") ?? string.Empty;

        return new TrainingCampData
        {
            Success = true,
            UpdateCampsCost = 1000,
            IsUpdateEnabled = !state.CampActiveUntilUtc.HasValue || state.CampActiveUntilUtc.Value.Date < DateTime.UtcNow.Date,
            CampItems =
            [
                new TrainingCampItem { Identifier = "Camp_2_0_high", Image = "Camp_2_0_high", Name = "Hohentrainingslager", Effect = 2, Variant = 0, Power = 1.5m, Percent = false, PriceEuro = 9_640_000, PriceStars = 1000, BookDate = activeIdentifier == "Camp_2_0_high" ? activeBookDate : string.Empty },
                new TrainingCampItem { Identifier = "Camp_1_4_high", Image = "Camp_1_4_high", Name = "Aerobicunterricht", Effect = 1, Variant = 4, Power = 1.5m, Percent = false, PriceEuro = 9_640_000, PriceStars = 1000, BookDate = activeIdentifier == "Camp_1_4_high" ? activeBookDate : string.Empty },
                new TrainingCampItem { Identifier = "Camp_0_3_high", Image = "Camp_0_3_high", Name = "Taktikanalyse", Effect = 0, Variant = 3, Power = 1.5m, Percent = false, PriceEuro = 9_640_000, PriceStars = 1000, BookDate = activeIdentifier == "Camp_0_3_high" ? activeBookDate : string.Empty }
            ]
        };
    }

    private static TrainingPlayerData BuildTrainingPlayer(SquadPlayerRecord player)
    {
        var position = player.Position switch
        {
            "GK" => 1,
            "DEF" => 2,
            "MID" => 4,
            "FWD" => 6,
            _ => 0
        };

        var skills = Enumerable.Range(0, 14)
            .Select(index => index == 0 ? Math.Round(player.Strength * 0.9m, 6) : Math.Round(Math.Max(10m, player.Strength / (index + 2m)), 6))
            .ToArray();

        var hasIndividualTraining = !string.IsNullOrWhiteSpace(player.IndividualTrainingSkill) && player.IndividualTrainingUntilUtc.HasValue;
        var skillChange = hasIndividualTraining ? Math.Round(player.Talent * 0.075m, 6) : 0m;

        return new TrainingPlayerData
        {
            Id = player.Id,
            Name = player.Name,
            Country = player.Origin.ToLowerInvariant(),
            Strength = player.Strength,
            Talent = player.Talent,
            Age = player.Age,
            Position = position,
            EndDate = player.IndividualTrainingUntilUtc?.ToString("O"),
            HasContract = true,
            SkillIndex = 0,
            SkillChange = skillChange,
            TotalChange = Math.Round(skillChange * 7m, 6),
            Skills = skills,
            Fitness = player.Fitness,
            Shirt = player.ShirtNumber,
            YellowCards = player.YellowCards,
            HasRedCard = player.RedCards > 0,
            TransfermarketMaxHours = 48,
            TransfermarketMinOffer = Math.Max(1000, player.Strength * 25),
            TransfermarketFee = Math.Max(1000, player.Strength * 25),
            TransfermarketMaxOffer = Math.Max(10_000, player.Strength * 250),
            HasIndividualTraining = hasIndividualTraining,
            MainSkill = 0,
            BonusSkills = [1, 2],
            MarketValue = Math.Max(25_000, player.Strength * 300),
            Salary = Math.Max(1_000, player.Strength * 12),
            Origin = player.Origin,
            CanExtendContract = true,
            MaxUpgradeStrength = Math.Round(player.Strength + 25m, 3)
        };
    }
}
