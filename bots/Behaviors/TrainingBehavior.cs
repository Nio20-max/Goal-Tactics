using System.Collections.Generic;
using System.Linq;
using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Neural;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Training and scouting behavior driven by youth focus.
/// Higher youth focus → more star spending on individual training and scouting.
/// </summary>
public sealed class TrainingBehavior
{
    private readonly BotDatabase _db;
    private readonly Random _rng = new();

    public TrainingBehavior(BotDatabase db)
    {
        _db = db;
    }

    private sealed class PlayerSnapshot
    {
        public string Id { get; init; } = "";
        public decimal Strength { get; init; }
        public int Talent { get; init; }
        public int Age { get; init; }
        public int PositionIndex { get; init; }
        public string PositionLabel { get; init; } = "";
        public bool HasIndividualTraining { get; init; }
        public bool HasRedCard { get; init; }
        public int Injured { get; init; }
        public int MainSkill { get; init; }
        public decimal Experience { get; init; }
        public string Origin { get; init; } = "";
        public decimal[] Skills { get; init; } = [];
    }

    private sealed class ScoutedPlayerSnapshot
    {
        public string Id { get; init; } = "";
        public int Talent { get; init; }
        public int Strength { get; init; }
    }

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan = null)
    {
        await HandleTeamTrainingAsync(api, bot, nightPlan);
        await HandleIndividualTrainingAsync(api, bot, nightPlan);
        await HandleScoutingAsync(api, bot, nightPlan);
    }

    private async Task HandleTeamTrainingAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan)
    {
        var training = await api.ExecuteForBotAsync("GetTeamTraining");
        if (!training.Success) return;

        var trainingData = BotApiTranslationReader.GetObject(training, "teamTraining") ?? training.Output;
        int currentMain = BotApiTranslationReader.GetInt(trainingData, "mainSkillIndex", 0);
        int currentSub = BotApiTranslationReader.GetInt(trainingData, "subSkillIndex", 4);

        // Keep main in [0..3], sub in [4..13] with deterministic daily rotation.
        int daySeed = DateTime.UtcNow.DayOfYear + Math.Abs(HashCode.Combine(bot.BotId, bot.YouthFocus));
        int desiredMain = Math.Abs(daySeed) % 4;
        int desiredSub = 4 + (Math.Abs(daySeed / 3 + bot.YouthFocus) % 10);

        // Preserve occasional continuity so efficiency decay does not dominate long windows.
        bool keepCurrent = _rng.NextDouble() < 0.30;
        int mainSkillIndex = keepCurrent ? Math.Clamp(currentMain, 0, 3) : desiredMain;
        int subSkillIndex = keepCurrent ? Math.Clamp(currentSub, 4, 13) : desiredSub;

        if (subSkillIndex == mainSkillIndex)
        {
            subSkillIndex = 4 + ((subSkillIndex - 3) % 10);
        }

        await api.ExecuteForBotAsync("SaveTeamTraining", new SaveTrainingRequest
        {
            MainSkillIndex = mainSkillIndex,
            SubSkillIndex = subSkillIndex
        });

        await HandleTrainingCampAsync(api, bot, nightPlan, training);
    }

    private async Task HandleTrainingCampAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan, BotApiTranslation training)
    {
        // Book training camps (prefer experience, then position camps) and refresh available options when the bot has enough stars.
        var campData = BotApiTranslationReader.GetObject(training, "trainingCamp");
        if (campData is null) return;

        var resources = await api.ExecuteForBotAsync("GetMyResources");
        if (!resources.Success) return;

        var stars = BotApiTranslationReader.GetInt(resources.Output, "gtStars");
        var maxRefreshAttempts = Math.Min(3, stars / 1000);
        var refreshAttempts = 0;

        // Determine the desired camp types (experience first, then position-specific) based on current squad.
        var desiredCampOrder = await ComputeDesiredCampOrderAsync(api, bot);
        if (desiredCampOrder.Count == 0)
        {
            return;
        }

        while (true)
        {
            campData = BotApiTranslationReader.GetObject(training, "trainingCamp");
            if (campData is null) return;

            var currentCamp = BotApiTranslationReader.GetString(campData, "bookedCampIdentifier");
            var currentCampActive = false;
            var campItems = BotApiTranslationReader.GetObjectList(campData, "campItems");
            if (!string.IsNullOrWhiteSpace(currentCamp))
            {
                currentCampActive = campItems
                    .Where(item => BotApiTranslationReader.GetString(item, "identifier") == currentCamp)
                    .Select(item => BotApiTranslationReader.GetString(item, "bookDate"))
                    .Any(bookDate => !string.IsNullOrWhiteSpace(bookDate));
            }

            if (currentCampActive && desiredCampOrder.Contains(currentCamp))
            {
                // Already booked a desired camp.
                return;
            }

            var desiredCamp = campItems
                .Select(item => BotApiTranslationReader.GetString(item, "identifier"))
                .FirstOrDefault(id => !string.IsNullOrWhiteSpace(id) && desiredCampOrder.Contains(id));

            if (!string.IsNullOrWhiteSpace(desiredCamp))
            {
                await api.ExecuteForBotAsync("BookTrainingCamp", new BookTrainingCampRequest { CampType = desiredCamp });
                return;
            }

            // No suitable camps currently offered.
            var canUpdate = BotApiTranslationReader.GetBool(campData, "isUpdateEnabled");
            if (!canUpdate && !string.IsNullOrWhiteSpace(currentCamp) && stars >= 2000)
            {
                // Cancel an active camp to allow refreshing.
                await api.ExecuteForBotAsync("CancelCamp");
                canUpdate = true;
            }

            if (!canUpdate || refreshAttempts >= maxRefreshAttempts || stars < 1000)
            {
                return;
            }

            await api.ExecuteForBotAsync("UpdateCamps");
            refreshAttempts++;

            // Re-fetch state after updating camps
            training = await api.ExecuteForBotAsync("GetTeamTraining");
            if (!training.Success) return;

            resources = await api.ExecuteForBotAsync("GetMyResources");
            if (!resources.Success) return;
            stars = BotApiTranslationReader.GetInt(resources.Output, "gtStars");
        }
    }

    private async Task<List<string>> ComputeDesiredCampOrderAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        // Primary desire: experience camp.
        var desired = new List<string> { "camp_2_0_mid" };

        // Secondary desire: positional camps (goalkeeper, defence, midfield, attack) based on squad composition.
        var squadResponse = await api.ExecuteForBotAsync("GetSquad");
        if (!squadResponse.Success)
        {
            return desired;
        }

        var players = BotApiTranslationReader.GetObjectList(squadResponse, "players")
            .Select(ToPlayer)
            .Where(p => !string.IsNullOrEmpty(p.Id))
            .ToList();

        if (players.Count == 0)
        {
            return desired;
        }

        var posCounts = players
            .Select(p => PositionGroup(p.PositionIndex, p.PositionLabel))
            .GroupBy(p => p)
            .ToDictionary(g => g.Key, g => g.Count());

        // Determine most common position for the team.
        var primaryPosition = posCounts.OrderByDescending(kv => kv.Value).First().Key;
        var positionCamp = primaryPosition switch
        {
            "GK" => "camp_0_1_mid",
            "DEF" => "camp_0_0_mid",
            "MID" => "camp_0_3_mid",
            "FWD" => "camp_0_2_mid",
            _ => null
        };

        if (!string.IsNullOrWhiteSpace(positionCamp))
        {
            desired.Add(positionCamp);
        }

        return desired;
    }

    /// <summary>
    /// High youth focus bots invest in individual training for young players.
    /// Targets players with the weakest main skill to maximise strength gain.
    /// </summary>
    private async Task HandleIndividualTrainingAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan)
    {
        if (bot.YouthFocus < 20 && (nightPlan?.IndividualTrainingSlots ?? 0) <= 0)
        {
            return;
        }

        var squad = await api.ExecuteForBotAsync("GetSquad");
        if (!squad.Success) return;

        var players = BotApiTranslationReader.GetObjectList(squad, "players")
            .Select(ToPlayer)
            .Where(p => !string.IsNullOrEmpty(p.Id))
            .ToList();
        if (players.Count == 0) return;

        var scoutedPriorityIds = GetRecentScoutedPlayerIds(bot);

        // Prioritize fresh scouted youth, then youngest players with weak core skill.
        var youngPlayers = players
            .Where(p => p.Age <= 22 && !p.HasIndividualTraining && !p.HasRedCard && p.Injured == 0)
            .OrderByDescending(p => scoutedPriorityIds.Contains(p.Id))
            .ThenBy(p => p.Experience)
            .ThenBy(p => p.Skills is not null && p.MainSkill >= 0 && p.MainSkill < p.Skills.Length
                        ? p.Skills[p.MainSkill]
                        : p.Strength)
            .ThenByDescending(p => p.Talent)
            .ToList();

        // Number of players to train scales with youth focus
        int count = bot.YouthFocus switch
        {
            >= 85 => Math.Min(6, youngPlayers.Count),
            >= 65 => Math.Min(5, youngPlayers.Count),
            >= 45 => Math.Min(4, youngPlayers.Count),
            >= 25 => Math.Min(3, youngPlayers.Count),
            _ => Math.Min(2, youngPlayers.Count)
        };

        if (nightPlan is not null)
        {
            count = Math.Min(youngPlayers.Count, Math.Max(count, nightPlan.IndividualTrainingSlots));
        }

        var resources = await api.ExecuteForBotAsync("GetMyResources");
        if (!resources.Success)
        {
            return;
        }

        int stars = BotApiTranslationReader.GetInt(resources.Output, "gtStars");
        int affordableTrainings = Math.Max(0, stars / 1000);
        count = Math.Min(count, affordableTrainings);
        if (count <= 0)
        {
            return;
        }

        for (int i = 0; i < count; i++)
        {
            var targetId = youngPlayers[i].Id;

            // Re-check eligibility right before submission to avoid stale-state 422s.
            var latestSquad = await api.ExecuteForBotAsync("GetSquad");
            if (!latestSquad.Success)
            {
                continue;
            }

            var latestTarget = BotApiTranslationReader.GetObjectList(latestSquad, "players")
                .Select(ToPlayer)
                .FirstOrDefault(p => p.Id == targetId);

            if (latestTarget is null || latestTarget.HasIndividualTraining || latestTarget.HasRedCard || latestTarget.Injured > 0)
            {
                continue;
            }

            int skillIndex = ChooseIndividualSkillIndex(latestTarget, i);
            await api.ExecuteForBotAsync("SaveIndividualTraining", new IndividualTrainingRequest
            {
                Id = targetId,
                SkillIndex = skillIndex
            });
        }
    }

    /// <summary>
    /// High youth focus bots scout more actively and recruit promising youth.
    /// </summary>
    private async Task HandleScoutingAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan)
    {
        if (nightPlan is not null && !nightPlan.ScoutEnabled)
        {
            return;
        }

        // Probability of scouting scales with youth focus
        double scoutChance = bot.YouthFocus / 99.0;
        if (nightPlan is not null)
        {
            scoutChance = Math.Clamp((nightPlan.ScoutIntensity / 100.0 + scoutChance) / 2.0, 0.05, 0.98);
        }

        if (_rng.NextDouble() > scoutChance) return;

        var scouted = await api.ExecuteForBotAsync("GetScoutedPlayers");
        if (!scouted.Success) return;

        int pendingScoutCount = BotApiTranslationReader.GetInt(scouted.Output, "pendingScoutCount");
        int maxSimultaneousScouts = BotApiTranslationReader.GetInt(scouted.Output, "maxSimultaneousScouts", 3);
        if (pendingScoutCount < maxSimultaneousScouts)
        {
            await api.ExecuteForBotAsync("InstructScout", new InstructScoutRequest());

            // refresh after new instruction (may take multiple attempts to generate candidates)
            for (int attempt = 0; attempt < 3; attempt++)
            {
                scouted = await api.ExecuteForBotAsync("GetScoutedPlayers");
                if (!scouted.Success) return;

                var playersTry = BotApiTranslationReader.GetObjectList(scouted, "players");
                if (playersTry.Count > 0)
                {
                    break;
                }
            }
        }

        var players = BotApiTranslationReader.GetObjectList(scouted, "players")
            .Select(ToScoutedPlayer)
            .Where(p => !string.IsNullOrEmpty(p.Id))
            .ToList();
        if (players.Count == 0) return;

        // Determine current squad composition to set recruitment standards.
        var squad = await api.ExecuteForBotAsync("GetSquad");
        double avgAge = 0;
        double pctYoung = 0;

        if (squad.Success)
        {
            var squadPlayers = BotApiTranslationReader.GetObjectList(squad, "players")
                .Select(ToPlayer)
                .Where(p => p.Age > 0)
                .ToList();

            if (squadPlayers.Count > 0)
            {
                avgAge = squadPlayers.Average(p => p.Age);
                pctYoung = squadPlayers.Count(p => p.Age <= 23) / (double)squadPlayers.Count;
            }
        }

        // Determine threshold (1-10 talent scale) based on squad youth profile.
        // Younger teams keep higher standards; older squads relax.
        var baseTalent = 6.0;
        var adjustedTalent = baseTalent + (pctYoung - 0.5) * 4.0;
        adjustedTalent = Math.Clamp(adjustedTalent, 4.0, 9.0);

        // Determine how strict the talent threshold should be based on squad youth.
        // No age data is available for scouted players, so recruitment is talent-driven.
        var best = players
            .OrderByDescending(p => p.Talent)
            .ThenByDescending(p => p.Strength)
            .First();

        if (best.Talent < adjustedTalent)
        {
            return;
        }

        await api.ExecuteForBotAsync("RecruitScoutedPlayer", new IdRequest { Id = best.Id });
        RememberScoutedRecruit(bot, best.Id);
    }

    private HashSet<string> GetRecentScoutedPlayerIds(BotRecord bot)
    {
        var raw = _db.GetBotState(bot.BotId, "recent-scouted-recruits");
        if (string.IsNullOrWhiteSpace(raw))
        {
            return [];
        }

        var now = DateTime.UtcNow;
        var ids = new HashSet<string>(StringComparer.Ordinal);
        var cleaned = new List<string>();
        var entries = raw.Split(';', StringSplitOptions.RemoveEmptyEntries | StringSplitOptions.TrimEntries);
        foreach (var entry in entries)
        {
            var parts = entry.Split('|', 2, StringSplitOptions.TrimEntries);
            if (parts.Length != 2)
            {
                continue;
            }

            if (!DateTime.TryParse(parts[1], out var ts) || now - ts > TimeSpan.FromDays(14))
            {
                continue;
            }

            ids.Add(parts[0]);
            cleaned.Add($"{parts[0]}|{ts:o}");
        }

        _db.UpsertBotState(bot.BotId, "recent-scouted-recruits", string.Join(';', cleaned));
        return ids;
    }

    private void RememberScoutedRecruit(BotRecord bot, string playerId)
    {
        if (string.IsNullOrWhiteSpace(playerId))
        {
            return;
        }

        var ids = GetRecentScoutedPlayerIds(bot)
            .Select(id => $"{id}|{DateTime.UtcNow:o}")
            .ToList();

        ids.Add($"{playerId}|{DateTime.UtcNow:o}");
        _db.UpsertBotState(bot.BotId, "recent-scouted-recruits", string.Join(';', ids.Distinct(StringComparer.Ordinal)));
    }

    private int ChooseIndividualSkillIndex(PlayerSnapshot player, int iteration)
    {
        var candidates = PositionGroup(player.PositionIndex, player.PositionLabel) switch
        {
            "GK" => new[] { 1, 9, 4, 5, 12 },
            "DEF" => new[] { 0, 6, 8, 9, 4 },
            "MID" => new[] { 3, 4, 5, 9, 10, 6 },
            "FWD" => new[] { 2, 7, 8, 9, 13, 4 },
            _ => Enumerable.Range(0, 14).ToArray()
        };

        if (player.Skills.Length >= 14)
        {
            var ordered = candidates
                .OrderBy(idx => player.Skills[idx])
                .ThenBy(_ => _rng.Next(0, 4))
                .ToArray();

            int rotated = Math.Abs(HashCode.Combine(player.Id, DateTime.UtcNow.DayOfYear, iteration)) % Math.Max(1, Math.Min(3, ordered.Length));
            return ordered[rotated];
        }

        return candidates[Math.Abs(HashCode.Combine(player.Id, iteration)) % candidates.Length];
    }

    private static string PositionGroup(int positionIndex, string positionLabel)
    {
        if (positionIndex >= 0)
        {
            return positionIndex switch
            {
                0 => "GK",
                1 => "DEF",
                2 => "MID",
                3 => "FWD",
                _ => "UNK"
            };
        }

        var normalized = positionLabel.Trim().ToUpperInvariant();
        if (normalized is "GK" or "GOALKEEPER" or "TOR") return "GK";
        if (normalized is "DEF" or "DEFENDER" or "ABWEHR") return "DEF";
        if (normalized is "MID" or "MIDFIELDER" or "MITTELFELD") return "MID";
        if (normalized is "FWD" or "ST" or "ATT" or "STRIKER" or "ANGRIFF") return "FWD";
        return "UNK";
    }

    private static PlayerSnapshot ToPlayer(Dictionary<string, object?> data)
        => new()
        {
            Id = BotApiTranslationReader.GetString(data, "id"),
            Strength = BotApiTranslationReader.GetDecimal(data, "strength"),
            Talent = BotApiTranslationReader.GetInt(data, "talent"),
            Age = BotApiTranslationReader.GetInt(data, "age"),
            PositionIndex = BotApiTranslationReader.GetInt(data, "position", -1),
            PositionLabel = BotApiTranslationReader.GetString(data, "position"),
            HasIndividualTraining = BotApiTranslationReader.GetBool(data, "hasIndividualTraining"),
            HasRedCard = BotApiTranslationReader.GetBool(data, "hasRedCard"),
            Injured = BotApiTranslationReader.GetInt(data, "injured"),
            MainSkill = BotApiTranslationReader.GetInt(data, "mainSkill"),
            Experience = BotApiTranslationReader.GetDecimal(data, "experience"),
            Origin = BotApiTranslationReader.GetString(data, "origin"),
            Skills = BotApiTranslationReader.GetDecimalArray(data, "skills")
        };

    private static ScoutedPlayerSnapshot ToScoutedPlayer(Dictionary<string, object?> data)
        => new()
        {
            Id = BotApiTranslationReader.GetString(data, "id"),
            Talent = BotApiTranslationReader.GetInt(data, "talent"),
            Strength = BotApiTranslationReader.GetInt(data, "strength")
        };
}
