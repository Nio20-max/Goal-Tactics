using System.Text.Json;
using GoalTactics.Bots.Config;
using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotPlayerCareerTracker(BotOptions options)
{
    private readonly List<TrackedPlayer> trackedPlayers =
    [
        new()
        {
            PlayerId = "P-16-NEW-01",
            PlayerName = "Luca Weber",
            ManagerPersona = "NewManagerBot",
            PositionGroup = 2,
            StartAge = 16,
            CurrentAge = 16,
            Talent = 9,
            Fitness = 100,
            CurrentStrength = 64m,
            UsesIndividualTraining = true
        },
        new()
        {
            PlayerId = "P-17-YTH-01",
            PlayerName = "Nils Berger",
            ManagerPersona = "YouthFocusedBot",
            PositionGroup = 1,
            StartAge = 17,
            CurrentAge = 17,
            Talent = 9,
            Fitness = 98,
            CurrentStrength = 66m,
            UsesIndividualTraining = true
        },
        new()
        {
            PlayerId = "P-18-YTH-02",
            PlayerName = "Mika Roth",
            ManagerPersona = "YouthFocusedBot",
            PositionGroup = 3,
            StartAge = 18,
            CurrentAge = 18,
            Talent = 8,
            Fitness = 95,
            CurrentStrength = 62m,
            UsesIndividualTraining = true
        },
        new()
        {
            PlayerId = "P-20-CON-01",
            PlayerName = "Ivan Rossi",
            ManagerPersona = "ConservativeBot",
            PositionGroup = 0,
            StartAge = 20,
            CurrentAge = 20,
            Talent = 7,
            Fitness = 92,
            CurrentStrength = 67m,
            UsesIndividualTraining = false
        },
        new()
        {
            PlayerId = "P-22-TRD-01",
            PlayerName = "Mateo Costa",
            ManagerPersona = "AggressiveTraderBot",
            PositionGroup = 2,
            StartAge = 22,
            CurrentAge = 22,
            Talent = 8,
            Fitness = 90,
            CurrentStrength = 69m,
            UsesIndividualTraining = true
        },
        new()
        {
            PlayerId = "P-24-SOC-01",
            PlayerName = "Rene Novak",
            ManagerPersona = "SocialBot",
            PositionGroup = 1,
            StartAge = 24,
            CurrentAge = 24,
            Talent = 6,
            Fitness = 88,
            CurrentStrength = 70m,
            UsesIndividualTraining = false
        },
        new()
        {
            PlayerId = "P-26-LAD-01",
            PlayerName = "Tomas Kral",
            ManagerPersona = "LadderGrinderBot",
            PositionGroup = 3,
            StartAge = 26,
            CurrentAge = 26,
            Talent = 7,
            Fitness = 91,
            CurrentStrength = 71m,
            UsesIndividualTraining = true
        },
        new()
        {
            PlayerId = "P-28-CON-02",
            PlayerName = "Jaro Leitner",
            ManagerPersona = "ConservativeBot",
            PositionGroup = 2,
            StartAge = 28,
            CurrentAge = 28,
            Talent = 10,
            Fitness = 93,
            CurrentStrength = 73m,
            UsesIndividualTraining = true
        },
        new()
        {
            PlayerId = "P-31-TRD-02",
            PlayerName = "Petar Vukic",
            ManagerPersona = "AggressiveTraderBot",
            PositionGroup = 0,
            StartAge = 31,
            CurrentAge = 31,
            Talent = 8,
            Fitness = 84,
            CurrentStrength = 74m,
            UsesIndividualTraining = false
        },
        new()
        {
            PlayerId = "P-33-SOC-02",
            PlayerName = "Dino Marin",
            ManagerPersona = "SocialBot",
            PositionGroup = 1,
            StartAge = 33,
            CurrentAge = 33,
            Talent = 9,
            Fitness = 82,
            CurrentStrength = 72m,
            UsesIndividualTraining = false
        },
        new()
        {
            PlayerId = "P-19-NEW-02",
            PlayerName = "Jan Novak",
            ManagerPersona = "NewManagerBot",
            PositionGroup = 2,
            StartAge = 19,
            CurrentAge = 19,
            Talent = 8,
            Fitness = 96,
            CurrentStrength = 65m,
            UsesIndividualTraining = true
        },
        new()
        {
            PlayerId = "P-21-LAD-02",
            PlayerName = "Aron Biel",
            ManagerPersona = "LadderGrinderBot",
            PositionGroup = 3,
            StartAge = 21,
            CurrentAge = 21,
            Talent = 10,
            Fitness = 99,
            CurrentStrength = 68m,
            UsesIndividualTraining = true
        },
        new()
        {
            PlayerId = "P-27-YTH-03",
            PlayerName = "Fabian Cordes",
            ManagerPersona = "YouthFocusedBot",
            PositionGroup = 0,
            StartAge = 27,
            CurrentAge = 27,
            Talent = 7,
            Fitness = 87,
            CurrentStrength = 70m,
            UsesIndividualTraining = false
        }
    ];

    private readonly List<TrackedPlayerSeasonRecord> records = [];
    private readonly Dictionary<string, decimal> cumulativeSeasonGain = new(StringComparer.Ordinal);

    public void StartSeason(int season)
    {
        cumulativeSeasonGain.Clear();
    }

    public IReadOnlyDictionary<string, int> GetWeeklyIndividualTrainingPlayerCounts()
    {
        return trackedPlayers
            .Where(x => !x.Sold && x.UsesIndividualTraining)
            .GroupBy(x => x.ManagerPersona)
            .ToDictionary(x => x.Key, x => x.Count(), StringComparer.Ordinal);
    }

    public void ApplyDailyTraining(DateTime dayUtc, IReadOnlyList<BotClubProfile> bots)
    {
        var byPersona = bots
            .GroupBy(x => x.Persona)
            .ToDictionary(g => g.Key, g => g.OrderByDescending(x => x.TrainingCenterLevel).ThenBy(x => x.TeamName, StringComparer.Ordinal).First(), StringComparer.Ordinal);

        foreach (var player in trackedPlayers.Where(x => !x.Sold))
        {
            if (!byPersona.TryGetValue(player.ManagerPersona, out var personaBot))
            {
                continue;
            }

            var mainGain = GetMainSpecGain(player.CurrentAge, player.Talent, personaBot.TrainingCenterLevel);
            if (player.PositionGroup != personaBot.TeamMainTrainingPosition)
            {
                mainGain = 0m;
            }

            var subGain = GetSubSpecGain(mainGain, player.CurrentAge);
            var individualGain = player.UsesIndividualTraining ? GetIndividualGain(player) : 0m;
            var campGain = personaBot.CampActiveUntilUtc.HasValue && personaBot.CampActiveUntilUtc.Value >= dayUtc
                ? options.CampSpecBoostPerDay * 0.35m
                : 0m;

            var dailyGain = mainGain + subGain + individualGain + campGain;
            player.LastDailyGain = dailyGain;
            player.CurrentStrength = Math.Min((decimal)options.MaxPlayerStrength, player.CurrentStrength + dailyGain);

            if (!cumulativeSeasonGain.TryGetValue(player.PlayerId, out var soFar))
            {
                soFar = 0m;
            }

            cumulativeSeasonGain[player.PlayerId] = soFar + dailyGain;
        }
    }

    public void AdvanceSeason(int season)
    {
        foreach (var player in trackedPlayers)
        {
            player.CurrentAge++;

            if (!player.Sold)
            {
                // Fitness naturally drifts down with age but remains bounded.
                if (player.CurrentAge > 28)
                {
                    player.Fitness = Math.Max(70, player.Fitness - 1);
                }
                else if (player.CurrentAge <= 22)
                {
                    player.Fitness = Math.Min(100, player.Fitness + 1);
                }
            }

            records.Add(new TrackedPlayerSeasonRecord
            {
                Season = season,
                PlayerId = player.PlayerId,
                PlayerName = player.PlayerName,
                ManagerPersona = player.ManagerPersona,
                PositionGroup = player.PositionGroup,
                Talent = player.Talent,
                Fitness = player.Fitness,
                StartAge = player.StartAge,
                AgeAtSeasonEnd = player.CurrentAge,
                StrengthAtSeasonEnd = player.CurrentStrength,
                AverageDailyGain = GetAverageDailyGain(player.PlayerId),
                Sold = player.Sold,
                SoldFeeMoney = player.SoldFeeMoney
            });
        }
    }

    public void TrySellPlayers(int season, IReadOnlyList<TransferCompletionRecord> transfers)
    {
        foreach (var player in trackedPlayers.Where(x => !x.Sold))
        {
            var related = transfers.FirstOrDefault(t => string.Equals(t.BuyerPersona, player.ManagerPersona, StringComparison.Ordinal));
            if (related is null)
            {
                continue;
            }

            var saleProbability = player.CurrentAge >= 31 ? 0.08 : 0.02;
            var random = new Random(HashCode.Combine(player.PlayerId, season, player.CurrentStrength));
            if (random.NextDouble() <= saleProbability)
            {
                player.Sold = true;
                player.SoldInSeason = season;
                player.SoldFeeMoney = related.FeeMoney;
            }
        }
    }

    public async Task WriteAsync(string rootPath)
    {
        var csv = new List<string>
        {
            "player_id,player_name,season,manager_persona,position_group,talent,fitness,start_age,age_end,strength_end,avg_daily_gain,sold,sold_fee_money"
        };

        csv.AddRange(records
            .OrderBy(x => x.PlayerId, StringComparer.Ordinal)
            .ThenBy(x => x.Season)
            .Select(x => string.Join(',',
            x.PlayerId,
            EscapeCsv(x.PlayerName),
            x.Season,
            x.ManagerPersona,
            x.PositionGroup,
            x.Talent,
            x.Fitness,
            x.StartAge,
            x.AgeAtSeasonEnd,
            x.StrengthAtSeasonEnd,
            x.AverageDailyGain,
            x.Sold,
            x.SoldFeeMoney ?? 0m)));

        await File.WriteAllLinesAsync(Path.Combine(rootPath, "tracked-players.csv"), csv);

        var json = JsonSerializer.Serialize(records, new JsonSerializerOptions { WriteIndented = true });
        await File.WriteAllTextAsync(Path.Combine(rootPath, "tracked-players.json"), json);
    }

    private decimal GetAverageDailyGain(string playerId)
    {
        if (!cumulativeSeasonGain.TryGetValue(playerId, out var total))
        {
            return 0m;
        }

        return Math.Round(total / 30m, 3);
    }

    // Calibrated against observed values from the decompiled game behavior notes.
    private static decimal GetMainSpecGain(int age, int talent, int trainingCenterLevel)
    {
        var baseGain = 0.08m + (0.015m * talent) + (0.01m * trainingCenterLevel);

        var ageBonus = age switch
        {
            <= 16 => 0.13m,
            17 => 0.125m,
            18 => 0.12m,
            19 => 0.11m,
            20 => 0.105m,
            21 => 0.10m,
            22 => 0.095m,
            23 => 0.085m,
            24 => 0.075m,
            25 => 0.065m,
            26 => 0.055m,
            27 => 0.04m,
            28 => 0.02m,
            29 => 0.0m,
            30 => -0.02m,
            31 => -0.05m,
            32 => -0.09m,
            33 => -0.135m,
            _ => -0.18m
        };

        return Math.Max(0.01m, Math.Round(baseGain + ageBonus, 3));
    }

    private static decimal GetSubSpecGain(decimal mainGain, int age)
    {
        var ageDamping = age >= 31 ? 0.75m : 1.0m;
        return Math.Round(mainGain * 0.18m * ageDamping, 3);
    }

    private static decimal GetIndividualGain(TrackedPlayer player)
    {
        var ageFactor = player.CurrentAge switch
        {
            <= 18 => 1.30m,
            <= 22 => 1.18m,
            <= 27 => 1.00m,
            <= 30 => 0.82m,
            <= 33 => 0.58m,
            _ => 0.38m
        };

        var fitnessFactor = 0.70m + (player.Fitness / 250m);
        var baseGain = 0.16m + (0.022m * player.Talent);
        return Math.Round(baseGain * ageFactor * fitnessFactor, 3);
    }

    private static string EscapeCsv(string value)
    {
        if (!value.Contains(',', StringComparison.Ordinal))
        {
            return value;
        }

        return $"\"{value.Replace("\"", "\"\"", StringComparison.Ordinal)}\"";
    }
}
