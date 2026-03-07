using System.Text.Json;
using GoalTactics.Bots.Models;

namespace GoalTactics.Bots.Services;

public sealed class BotTeamSeasonTracker
{
    private readonly List<TeamSeasonRecord> records = [];

    public void CaptureSeason(int season, IReadOnlyList<BotClubProfile> bots)
    {
        var trackedTeams = bots
            .OrderBy(x => x.Tier)
            .ThenBy(x => x.LeagueGroup)
            .ThenBy(x => x.TeamName, StringComparer.Ordinal)
            .Take(18)
            .ToArray();

        foreach (var bot in trackedTeams)
        {
            records.Add(new TeamSeasonRecord
            {
                Season = season,
                BotId = bot.BotId,
                TeamName = bot.TeamName,
                Persona = bot.Persona,
                Tier = bot.Tier,
                LeagueGroup = bot.LeagueGroup,
                StadiumLevel = bot.StadiumLevel,
                TrainingCenterLevel = bot.TrainingCenterLevel,
                TeamStrength = bot.Strength,
                MoneyBalance = bot.Money,
                StarsBalance = bot.Stars,
                MoneyInSeason = bot.MoneyInSeason,
                MoneyOutSeason = bot.MoneyOutSeason,
                StarsInSeason = bot.StarsInSeason,
                StarsOutSeason = bot.StarsOutSeason
            });
        }
    }

    public async Task WriteAsync(string rootPath)
    {
        var ordered = records
            .OrderBy(x => x.TeamName, StringComparer.Ordinal)
            .ThenBy(x => x.Season)
            .ToArray();

        var csv = new List<string>
        {
            "team_name,season,persona,tier,group,stadium_level,training_center_level,team_strength,money_balance,stars_balance,money_in,money_out,stars_in,stars_out"
        };

        csv.AddRange(ordered.Select(x => string.Join(',',
            EscapeCsv(x.TeamName),
            x.Season,
            x.Persona,
            x.Tier,
            x.LeagueGroup,
            x.StadiumLevel,
            x.TrainingCenterLevel,
            x.TeamStrength,
            x.MoneyBalance,
            x.StarsBalance,
            x.MoneyInSeason,
            x.MoneyOutSeason,
            x.StarsInSeason,
            x.StarsOutSeason)));

        await File.WriteAllLinesAsync(Path.Combine(rootPath, "tracked-teams.csv"), csv);

        var json = JsonSerializer.Serialize(ordered, new JsonSerializerOptions { WriteIndented = true });
        await File.WriteAllTextAsync(Path.Combine(rootPath, "tracked-teams.json"), json);
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
