using System.Text.Json;
using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotPlayerCareerTracker
{
    private readonly List<TrackedPlayer> trackedPlayers =
    [
        new()
        {
            PlayerId = "P-17-New",
            PlayerName = "Luca Weber",
            ManagerPersona = "NewManagerBot",
            StartAge = 17,
            CurrentAge = 17,
            CurrentStrength = 48
        },
        new()
        {
            PlayerId = "P-21-Youth",
            PlayerName = "Nils Berger",
            ManagerPersona = "YouthFocusedBot",
            StartAge = 21,
            CurrentAge = 21,
            CurrentStrength = 60
        },
        new()
        {
            PlayerId = "P-25-Conservative",
            PlayerName = "Ivan Rossi",
            ManagerPersona = "ConservativeBot",
            StartAge = 25,
            CurrentAge = 25,
            CurrentStrength = 68
        },
        new()
        {
            PlayerId = "P-29-Trader",
            PlayerName = "Mateo Costa",
            ManagerPersona = "AggressiveTraderBot",
            StartAge = 29,
            CurrentAge = 29,
            CurrentStrength = 72
        },
        new()
        {
            PlayerId = "P-19-Social",
            PlayerName = "Rene Novak",
            ManagerPersona = "SocialBot",
            StartAge = 19,
            CurrentAge = 19,
            CurrentStrength = 55
        }
    ];

    private readonly List<TrackedPlayerSeasonRecord> records = [];

    public void AdvanceSeason(int season)
    {
        foreach (var player in trackedPlayers)
        {
            if (!player.Sold)
            {
                player.CurrentAge++;
                player.CurrentStrength += GetGrowth(player.ManagerPersona, player.CurrentAge);
            }

            records.Add(new TrackedPlayerSeasonRecord
            {
                Season = season,
                PlayerId = player.PlayerId,
                PlayerName = player.PlayerName,
                ManagerPersona = player.ManagerPersona,
                StartAge = player.StartAge,
                AgeAtSeasonEnd = player.CurrentAge,
                StrengthAtSeasonEnd = player.CurrentStrength,
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

            var saleProbability = player.CurrentAge >= 28 ? 0.40 : 0.15;
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
            "season,player_id,player_name,manager_persona,start_age,age_end,strength_end,sold,sold_fee_money"
        };

        csv.AddRange(records.Select(x => string.Join(',',
            x.Season,
            x.PlayerId,
            EscapeCsv(x.PlayerName),
            x.ManagerPersona,
            x.StartAge,
            x.AgeAtSeasonEnd,
            x.StrengthAtSeasonEnd,
            x.Sold,
            x.SoldFeeMoney ?? 0m)));

        await File.WriteAllLinesAsync(Path.Combine(rootPath, "tracked-players.csv"), csv);

        var json = JsonSerializer.Serialize(records, new JsonSerializerOptions { WriteIndented = true });
        await File.WriteAllTextAsync(Path.Combine(rootPath, "tracked-players.json"), json);
    }

    private static int GetGrowth(string persona, int age)
    {
        var baseGrowth = age switch
        {
            <= 20 => 4,
            <= 24 => 3,
            <= 28 => 1,
            _ => -1
        };

        var personaBonus = persona switch
        {
            "YouthFocusedBot" => 2,
            "ConservativeBot" => 1,
            "AggressiveTraderBot" => 0,
            "SocialBot" => 0,
            _ => 1
        };

        return baseGrowth + personaBonus;
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
