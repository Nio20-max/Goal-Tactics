using GoalTactics.Application.Common;
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
            TacticTraining = BuildTacticTraining(state),
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

    public async Task SaveTacticTrainingAsync(string userId, TacticTrainingSaveRequest request, CancellationToken cancellationToken = default)
    {
        var tacticId = !string.IsNullOrWhiteSpace(request.TacticId)
            ? request.TacticId.Trim()
            : (request.Id != Guid.Empty ? request.Id.ToString() : null);

        if (!string.IsNullOrWhiteSpace(tacticId))
        {
            await teamStore.SaveTacticTrainingAsync(userId, tacticId, cancellationToken);
        }
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

        await teamStore.IncrementCampRefreshAsync(userId, cancellationToken);
    }

    public async Task SaveIndividualTrainingAsync(string userId, IndividualTrainingRequest request, CancellationToken cancellationToken = default)
    {
        var skill = request.ResolvedSkillType;
        if (string.IsNullOrWhiteSpace(skill))
        {
            throw new InvalidOperationException("No skill specified.");
        }

        // Deduct stars for starting individual training
        if (!await teamStore.TrySpendStarsAsync(userId, 1_000m, cancellationToken))
        {
            throw new InvalidOperationException("Insufficient stars.");
        }

        var success = await teamStore.SaveIndividualTrainingAsync(userId, request.ResolvedPlayerId, skill, cancellationToken);
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

    private static TacticTrainingData BuildTacticTraining(TeamTrainingStateRecord state)
    {
        var tacticDefs = new[]
        {
            (Id: Guid.Parse("91a5e724-7b88-4777-8c73-008ad20a5dea"), Name: "Normal"),
            (Id: Guid.Parse("99baeb1f-c7cf-4f75-9d5b-12d508a174a9"), Name: "Pressing"),
            (Id: Guid.Parse("fc645db1-90bd-4924-b642-6efeabad1fdb"), Name: "One-Touch"),
            (Id: Guid.Parse("9cf6d48e-8268-432d-80b2-7ad2f986f8c7"), Name: "Durch die Mitte"),
            (Id: Guid.Parse("b83f08e9-500f-4fab-bb16-885e4d5532d2"), Name: "Konter"),
            (Id: Guid.Parse("2f47a8d8-ca9a-4a89-a908-da69d3c6e41b"), Name: "Über die Flügel"),
            (Id: Guid.Parse("02f01198-2101-4ba0-88d4-f02442240e1c"), Name: "Kick and Rush")
        };

        // Compute tactic values: all start at 0%, selected tactic accumulates progress over time.
        var selectedId = Guid.TryParse(state.SelectedTacticId, out var parsed) ? parsed : Guid.Empty;

        // Tactic progress is stored per tactic so switching tactics doesn't reset the progress.
        var progressMap = state.TacticTrainingProgress ?? new Dictionary<string, int>();

        int GetTacticValue(Guid tacticId)
        {
            var storedDays = progressMap.TryGetValue(tacticId.ToString(), out var existingDays) ? existingDays : 0;
            var currentDays = 0;
            if (tacticId == selectedId && state.SelectedTacticStartUtc.HasValue)
            {
                currentDays = Math.Max(1, (int)(DateTime.UtcNow - state.SelectedTacticStartUtc.Value).TotalDays + 1);
            }

            var totalDays = storedDays + currentDays;
            return Math.Min(100, totalDays * 2);
        }

        var tactics = tacticDefs.Select(t => (t.Id, t.Name, Value: GetTacticValue(t.Id))).ToArray();

        return new TacticTrainingData
        {
            Success = true,
            SelectedTacticId = selectedId == Guid.Empty ? tacticDefs[0].Id : selectedId,
            TacticBonusList = tactics.Select((tactic, idx) => new TacticBonus
            {
                Tactic = new TacticBonusTactic
                {
                    Id = tactic.Id,
                    Name = tactic.Name,
                    Value = tactic.Value
                },
                CounterTactics = new[]
                {
                    new CounterTactic { TacticId = tacticDefs[(idx + 1) % tacticDefs.Length].Id, Bonus = tactic.Value * 0.1m, MaxBonus = 10 },
                    new CounterTactic { TacticId = tacticDefs[(idx + 2) % tacticDefs.Length].Id, Bonus = tactic.Value * 0.05m, MaxBonus = 5 },
                    new CounterTactic { TacticId = tacticDefs[(idx + 3) % tacticDefs.Length].Id, Bonus = tactic.Value * 0.02m, MaxBonus = 2 }
                }
            }).ToArray()
        };
    }

    private static TrainingCampData BuildTrainingCamp(TeamTrainingStateRecord state)
    {
        var activeIdentifier = string.IsNullOrWhiteSpace(state.CampType) ? null : state.CampType;
        var activeBookDate = state.CampActiveUntilUtc?.ToString("O") ?? string.Empty;

        // Camp cost depends on league tier
        var campCostEuro = state.LeagueTier switch
        {
            1 => 10_000_000,
            2 => 5_000_000,
            3 => 2_000_000,
            _ => 500_000
        };

        // Camp selection changes daily and on each refresh
        var daySeed = (int)(DateTime.UtcNow.Date.Ticks / TimeSpan.TicksPerDay);
        var rng = new Random(HashCode.Combine(daySeed, state.CampRefreshCount));
        var allCamps = new[]
        {
            (Effect: 0, Variant: 0, Name: "Defensivtraining", Image: "camp_0_0_mid"),
            (Effect: 0, Variant: 1, Name: "Torwarttraining", Image: "camp_0_1_mid"),
            (Effect: 0, Variant: 2, Name: "Schusstraining", Image: "camp_0_2_mid"),
            (Effect: 0, Variant: 3, Name: "Spielaufbau-Workshop", Image: "camp_0_3_mid"),
            (Effect: 1, Variant: 0, Name: "Passspiel-Seminar", Image: "camp_1_0_mid"),
            (Effect: 1, Variant: 1, Name: "Ballkontrolle-Kurs", Image: "camp_1_1_mid"),
            (Effect: 1, Variant: 2, Name: "Zweikampftraining", Image: "camp_1_2_mid"),
            (Effect: 1, Variant: 3, Name: "Schnelligkeitslager", Image: "camp_1_3_mid"),
            (Effect: 1, Variant: 4, Name: "Eckball-Seminar", Image: "camp_1_4_mid"),
            (Effect: 1, Variant: 5, Name: "Flankentraining", Image: "camp_1_5_mid"),
            (Effect: 1, Variant: 6, Name: "Freistoß-Workshop", Image: "camp_1_6_mid"),
            (Effect: 1, Variant: 7, Name: "Elfmetertraining", Image: "camp_1_7_mid"),
            (Effect: 1, Variant: 8, Name: "Passspiel", Image: "camp_1_8_mid"),
            (Effect: 1, Variant: 9, Name: "Dribbling", Image: "camp_1_9_mid"),
            (Effect: 2, Variant: 0, Name: "Erfahrung", Image: "camp_2_0_mid")
        };

        // Pick 3 random camps (but always include the currently booked one, if any)
        var shuffled = allCamps.OrderBy(_ => rng.Next()).Take(3).ToList();
        if (!string.IsNullOrWhiteSpace(activeIdentifier) && !shuffled.Any(c => c.Image == activeIdentifier))
        {
            var activeCamp = allCamps.FirstOrDefault(c => c.Image == activeIdentifier);
            if (activeCamp != default)
            {
                // Ensure the booked camp always appears in the list.
                shuffled[^1] = activeCamp;
            }
        }

        var bookedCampIndex = -1;
        var campItems = shuffled.Select((c, i) =>
        {
            var bookDate = activeIdentifier == c.Image ? activeBookDate : string.Empty;
            if (bookDate.Length > 0)
            {
                bookedCampIndex = i;
            }

            return new TrainingCampItem
            {
                Identifier = c.Image,
                Image = c.Image,
                Name = c.Name,
                Effect = c.Effect,
                Variant = c.Variant,
                Power = 1.5m,
                Percent = false,
                PriceEuro = campCostEuro,
                PriceStars = 1000,
                BookDate = bookDate
            };
        }).ToArray();

        return new TrainingCampData
        {
            Success = true,
            BookedCampIndex = bookedCampIndex,
            UpdateCampsCost = 1000,
            IsUpdateEnabled = !state.CampActiveUntilUtc.HasValue || state.CampActiveUntilUtc.Value.Date < DateTime.UtcNow.Date,
            CampItems = campItems
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
            Name = string.IsNullOrWhiteSpace(player.Name) ? "" : player.Name,
            Country = LegacyAppCompatibility.NormalizeCountryCode(player.Origin),
            Head = player.Head,
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
            Fitness = (int)player.Fitness,
            Shirt = player.ShirtNumber,
            YellowCards = player.YellowCards,
            HasRedCard = player.RedCards > 0,
            TransfermarketMaxHours = 48,
            TransfermarketMinOffer = Math.Max(1000m, player.Strength * 25m),
            TransfermarketFee = Math.Max(1000m, player.Strength * 25m),
            TransfermarketMaxOffer = Math.Max(10_000m, player.Strength * 250m),
            HasIndividualTraining = hasIndividualTraining,
            MainSkill = 0,
            BonusSkills = [1, 2],
            MarketValue = Math.Max(25_000m, player.Strength * 300m),
            Salary = Math.Max(1_000m, player.Strength * 12m),
            Origin = player.Origin,
            CanExtendContract = true,
            MaxUpgradeStrength = (int)(player.Strength + 25m)
        };
    }
}
