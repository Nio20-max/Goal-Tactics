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
            .ToArray();

        foreach (var bot in trackedTeams)
        {
            records.Add(new TeamSeasonRecord
            {
                Season = season,
                BotId = bot.BotId,
                ManagerName = bot.ManagerName,
                TeamName = bot.TeamName,
                CountryIso = bot.CountryIso,
                TimeZoneId = bot.TimeZoneId,
                Persona = bot.Persona,
                Tier = bot.Tier,
                LeagueGroup = bot.LeagueGroup,
                Position = bot.Position,
                SeasonWins = bot.SeasonWins,
                SeasonLosses = bot.SeasonLosses,
                SeasonDraws = bot.SeasonDraws,
                StadiumLevel = bot.StadiumLevel,
                    VipSeats = bot.VipSeats,
                    SitSeats = bot.SitSeats,
                    StandSeats = bot.StandSeats,
                TrainingCenterLevel = bot.TrainingCenterLevel,
                OfficeLevel = bot.OfficeLevel,
                FanShopLevel = bot.FanShopLevel,
                ParkingLevel = bot.ParkingLevel,
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
        Directory.CreateDirectory(rootPath);

        var ordered = records
            .OrderBy(x => x.Season)
            .ThenBy(x => x.Tier)
            .ThenBy(x => x.LeagueGroup)
            .ThenBy(x => x.TeamName, StringComparer.Ordinal)
            .ToArray();

        var csv = new List<string>
        {
            "team_name,season,bot_id,manager_name,country_iso,time_zone,persona,tier,group,position,season_wins,season_losses,season_draws,season_points,stadium_level,vip_seats,sit_seats,stand_seats,training_center_level,office_level,fan_shop_level,parking_level,team_strength,money_balance,stars_balance,money_in,money_out,stars_in,stars_out"
        };

        csv.AddRange(ordered.Select(x => string.Join(',',
            EscapeCsv(x.TeamName),
            x.Season,
            x.BotId,
            EscapeCsv(x.ManagerName),
            x.CountryIso,
            EscapeCsv(x.TimeZoneId),
            x.Persona,
            x.Tier,
            x.LeagueGroup,
            x.Position,
            x.SeasonWins,
            x.SeasonLosses,
            x.SeasonDraws,
            (x.SeasonWins * 3) + x.SeasonDraws,
            x.StadiumLevel,
            x.VipSeats,
            x.SitSeats,
            x.StandSeats,
            x.TrainingCenterLevel,
            x.OfficeLevel,
            x.FanShopLevel,
            x.ParkingLevel,
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

        await WriteSeasonLeagueExportsAsync(rootPath, ordered);
    }

    private static async Task WriteSeasonLeagueExportsAsync(string rootPath, IReadOnlyList<TeamSeasonRecord> ordered)
    {
        var grouped = ordered
            .GroupBy(x => new { x.Season, x.Tier, x.LeagueGroup })
            .OrderBy(x => x.Key.Season)
            .ThenBy(x => x.Key.Tier)
            .ThenBy(x => x.Key.LeagueGroup)
            .ToArray();

        foreach (var league in grouped)
        {
            var seasonFolder = Path.Combine(rootPath, $"season{league.Key.Season}");
            var leagueFolder = Path.Combine(seasonFolder, "league");
            var standingsFolder = Path.Combine(leagueFolder, "standings");
            var teamsRootFolder = Path.Combine(leagueFolder, "teams");
            var leagueKey = $"tier{league.Key.Tier}_group{league.Key.LeagueGroup}";
            var leagueTeamsFolder = Path.Combine(teamsRootFolder, leagueKey);

            Directory.CreateDirectory(standingsFolder);
            Directory.CreateDirectory(leagueTeamsFolder);

            var leagueTeams = league
                .OrderByDescending(x => (x.SeasonWins * 3) + x.SeasonDraws)
                .ThenByDescending(x => x.SeasonWins)
                .ThenByDescending(x => x.TeamStrength)
                .ThenBy(x => x.TeamName, StringComparer.Ordinal)
                .ToArray();

            var standings = leagueTeams
                .Select((team, index) => new LeagueStandingRow
                {
                    Rank = index + 1,
                    Season = team.Season,
                    Tier = team.Tier,
                    LeagueGroup = team.LeagueGroup,
                    TeamName = team.TeamName,
                    BotId = team.BotId,
                    Persona = team.Persona,
                    Wins = team.SeasonWins,
                    Draws = team.SeasonDraws,
                    Losses = team.SeasonLosses,
                    Points = (team.SeasonWins * 3) + team.SeasonDraws,
                    TeamStrength = team.TeamStrength,
                    MoneyBalance = team.MoneyBalance,
                    StarsBalance = team.StarsBalance
                })
                .ToArray();

            var standingsCsv = new List<string>
            {
                "rank,season,tier,group,team_name,bot_id,persona,wins,draws,losses,points,team_strength,money_balance,stars_balance"
            };

            standingsCsv.AddRange(standings.Select(x => string.Join(',',
                x.Rank,
                x.Season,
                x.Tier,
                x.LeagueGroup,
                EscapeCsv(x.TeamName),
                x.BotId,
                x.Persona,
                x.Wins,
                x.Draws,
                x.Losses,
                x.Points,
                x.TeamStrength,
                x.MoneyBalance,
                x.StarsBalance)));

            await File.WriteAllLinesAsync(Path.Combine(standingsFolder, $"{leagueKey}.csv"), standingsCsv);

            var standingsJson = JsonSerializer.Serialize(standings, new JsonSerializerOptions { WriteIndented = true });
            await File.WriteAllTextAsync(Path.Combine(standingsFolder, $"{leagueKey}.json"), standingsJson);

            var leagueTeamsCsv = new List<string>
            {
                "team_name,season,bot_id,manager_name,country_iso,time_zone,persona,tier,group,position,season_wins,season_losses,season_draws,season_points,stadium_level,vip_seats,sit_seats,stand_seats,training_center_level,office_level,fan_shop_level,parking_level,team_strength,money_balance,stars_balance,money_in,money_out,stars_in,stars_out"
            };

            leagueTeamsCsv.AddRange(leagueTeams.Select(x => string.Join(',',
                EscapeCsv(x.TeamName),
                x.Season,
                x.BotId,
                EscapeCsv(x.ManagerName),
                x.CountryIso,
                EscapeCsv(x.TimeZoneId),
                x.Persona,
                x.Tier,
                x.LeagueGroup,
                x.Position,
                x.SeasonWins,
                x.SeasonLosses,
                x.SeasonDraws,
                (x.SeasonWins * 3) + x.SeasonDraws,
                x.StadiumLevel,
                x.VipSeats,
                x.SitSeats,
                x.StandSeats,
                x.TrainingCenterLevel,
                x.OfficeLevel,
                x.FanShopLevel,
                x.ParkingLevel,
                x.TeamStrength,
                x.MoneyBalance,
                x.StarsBalance,
                x.MoneyInSeason,
                x.MoneyOutSeason,
                x.StarsInSeason,
                x.StarsOutSeason)));

            await File.WriteAllLinesAsync(Path.Combine(leagueTeamsFolder, "teams.csv"), leagueTeamsCsv);

            foreach (var team in leagueTeams)
            {
                var fileName = SanitizeFileName(team.TeamName) + ".json";
                var teamJson = JsonSerializer.Serialize(team, new JsonSerializerOptions { WriteIndented = true });
                await File.WriteAllTextAsync(Path.Combine(leagueTeamsFolder, fileName), teamJson);
            }
        }
    }

    private static string EscapeCsv(string value)
    {
        if (!value.Contains(',', StringComparison.Ordinal)
            && !value.Contains('"', StringComparison.Ordinal)
            && !value.Contains('\n', StringComparison.Ordinal)
            && !value.Contains('\r', StringComparison.Ordinal))
        {
            return value;
        }

        return $"\"{value.Replace("\"", "\"\"", StringComparison.Ordinal)}\"";
    }

    private static string SanitizeFileName(string value)
    {
        var invalid = Path.GetInvalidFileNameChars();
        var clean = new string(value.Select(c => invalid.Contains(c) ? '_' : c).ToArray());
        return clean.Replace(' ', '_');
    }

    private sealed class LeagueStandingRow
    {
        public int Rank { get; init; }

        public int Season { get; init; }

        public int Tier { get; init; }

        public int LeagueGroup { get; init; }

        public required string TeamName { get; init; }

        public Guid BotId { get; init; }

        public required string Persona { get; init; }

        public int Wins { get; init; }

        public int Draws { get; init; }

        public int Losses { get; init; }

        public int Points { get; init; }

        public int TeamStrength { get; init; }

        public decimal MoneyBalance { get; init; }

        public decimal StarsBalance { get; init; }
    }
}
