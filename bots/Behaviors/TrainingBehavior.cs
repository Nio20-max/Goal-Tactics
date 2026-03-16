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
    private readonly Random _rng = new();

    private sealed class PlayerSnapshot
    {
        public string Id { get; init; } = "";
        public decimal Strength { get; init; }
        public int Talent { get; init; }
        public int Age { get; init; }
        public bool HasIndividualTraining { get; init; }
        public bool HasRedCard { get; init; }
        public int Injured { get; init; }
        public int MainSkill { get; init; }
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
        // All bots save team training; details depend on server-side options
        var training = await api.ExecuteForBotAsync("GetTeamTraining");
        if (!training.Success) return;

        int mainSkillIndex = BotApiTranslationReader.GetInt(training.Output, "mainSkillIndex", -1);
        int subSkillIndex = BotApiTranslationReader.GetInt(training.Output, "subSkillIndex", -1);
        if (mainSkillIndex < 0 || subSkillIndex < 0) return;

        await api.ExecuteForBotAsync("SaveTeamTraining", new SaveTrainingRequest
        {
            MainSkillIndex = mainSkillIndex,
            SubSkillIndex = subSkillIndex
        });
    }

    /// <summary>
    /// High youth focus bots invest in individual training for young players.
    /// Targets players with the weakest main skill to maximise strength gain.
    /// </summary>
    private async Task HandleIndividualTrainingAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan)
    {
        if (bot.YouthFocus < 30 && (nightPlan?.IndividualTrainingSlots ?? 0) <= 0) return; // Low focus: skip individual training

        var squad = await api.ExecuteForBotAsync("GetSquad");
        if (!squad.Success) return;

        var players = BotApiTranslationReader.GetObjectList(squad, "players")
            .Select(ToPlayer)
            .Where(p => !string.IsNullOrEmpty(p.Id))
            .ToList();
        if (players.Count == 0) return;

        // Pick youngest players, preferring those with the weakest main skill
        var youngPlayers = players
            .Where(p => p.Age <= 22 && !p.HasIndividualTraining && !p.HasRedCard && p.Injured == 0)
            .OrderBy(p => p.Skills is not null && p.MainSkill >= 0 && p.MainSkill < p.Skills.Length
                        ? p.Skills[p.MainSkill]
                        : p.Strength)
            .ThenByDescending(p => p.Talent)
            .ToList();

        // Number of players to train scales with youth focus
        int count = bot.YouthFocus switch
        {
            >= 80 => Math.Min(3, youngPlayers.Count),
            >= 50 => Math.Min(2, youngPlayers.Count),
            _ => Math.Min(1, youngPlayers.Count)
        };

        if (nightPlan is not null)
        {
            count = Math.Min(youngPlayers.Count, Math.Max(count, nightPlan.IndividualTrainingSlots));
        }

        for (int i = 0; i < count; i++)
        {
            await api.ExecuteForBotAsync("SaveIndividualTraining", new IdRequest { Id = youngPlayers[i].Id });
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

        // Instruct scout
        await api.ExecuteForBotAsync("InstructScout", new InstructScoutRequest());

        // Check scouted players and recruit the best one
        var scouted = await api.ExecuteForBotAsync("GetScoutedPlayers");
        if (!scouted.Success) return;

        var players = BotApiTranslationReader.GetObjectList(scouted, "players")
            .Select(ToScoutedPlayer)
            .Where(p => !string.IsNullOrEmpty(p.Id))
            .ToList();
        if (players.Count == 0) return;

        var best = players
            .OrderByDescending(p => p.Talent)
            .ThenByDescending(p => p.Strength)
            .First();

        // High youth focus bots are more likely to recruit
        if (best.Talent >= 60 || (bot.YouthFocus >= 70 && best.Talent >= 40))
        {
            await api.ExecuteForBotAsync("RecruitScoutedPlayer", new IdRequest { Id = best.Id });
        }
    }

    private static PlayerSnapshot ToPlayer(Dictionary<string, object?> data)
        => new()
        {
            Id = BotApiTranslationReader.GetString(data, "id"),
            Strength = BotApiTranslationReader.GetDecimal(data, "strength"),
            Talent = BotApiTranslationReader.GetInt(data, "talent"),
            Age = BotApiTranslationReader.GetInt(data, "age"),
            HasIndividualTraining = BotApiTranslationReader.GetBool(data, "hasIndividualTraining"),
            HasRedCard = BotApiTranslationReader.GetBool(data, "hasRedCard"),
            Injured = BotApiTranslationReader.GetInt(data, "injured"),
            MainSkill = BotApiTranslationReader.GetInt(data, "mainSkill"),
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
