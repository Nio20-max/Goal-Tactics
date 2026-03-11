using GoalTactics.Contracts.League;

namespace GoalTactics.Application.League;

public interface ILeagueService
{
    Task<LeagueTableResponse> GetLeagueTableAsync(string userId, Guid leagueId, CancellationToken cancellationToken = default);

    Task<MatchesResponse> GetMatchesAsync(string userId, Guid leagueId, CancellationToken cancellationToken = default);

    Task<GoalGettersResponse> GetGoalGettersAsync(string userId, Guid leagueId, CancellationToken cancellationToken = default);
}

public sealed class LeagueService(ILeagueStore leagueStore) : ILeagueService
{
    public async Task<LeagueTableResponse> GetLeagueTableAsync(string userId, Guid leagueId, CancellationToken cancellationToken = default)
    {
        var table = await leagueStore.GetLeagueTableForUserAsync(userId, leagueId, cancellationToken);

        return new LeagueTableResponse
        {
            Success = true,
            LeagueName = table.LeagueName,
            Mount = table.Mount,
            Dismount = table.Dismount,
            Teams = table.Teams.Select(x => new LeagueTableData
            {
                Id = x.Id,
                Name = x.Name,
                Strength = x.Strength,
                Logo = x.Logo,
                Country = x.Country,
                IsOnline = x.IsOnline,
                IsMine = x.IsMine,
                Matches = new LeagueTableValue { Home = x.MatchesHome, Away = x.MatchesAway },
                Wins = new LeagueTableValue { Home = x.WinsHome, Away = x.WinsAway },
                Losses = new LeagueTableValue { Home = x.LossesHome, Away = x.LossesAway },
                Draws = new LeagueTableValue { Home = x.DrawsHome, Away = x.DrawsAway },
                GoalsScored = new LeagueTableValue { Home = x.GoalsScoredHome, Away = x.GoalsScoredAway },
                GoalsReceived = new LeagueTableValue { Home = x.GoalsReceivedHome, Away = x.GoalsReceivedAway },
                Points = new LeagueTableValue { Home = x.PointsHome, Away = x.PointsAway }
            }).ToArray()
        };
    }

    public async Task<MatchesResponse> GetMatchesAsync(string userId, Guid leagueId, CancellationToken cancellationToken = default)
    {
        var table = await leagueStore.GetLeagueTableForUserAsync(userId, leagueId, cancellationToken);
        var teams = table.Teams.ToArray();

        return new MatchesResponse
        {
            Success = true,
            HomeTrikot = "trikot0",
            AwayTrikot = "trikot0",
            Matches = teams
                .Chunk(2)
                .Where(pair => pair.Length == 2)
                .Select((pair, index) => new MatchData
                {
                    Id = Guid.NewGuid(),
                    Date = DateTime.UtcNow.Date.AddDays(index).AddHours(18).ToString("O"),
                    HomeLogo = pair[0].Logo,
                    AwayLogo = pair[1].Logo,
                    HomeName = pair[0].Name,
                    AwayName = pair[1].Name,
                    MyTeam = pair[0].IsMine ? 1 : (pair[1].IsMine ? 2 : 0),
                    HomeCountry = pair[0].Country,
                    AwayCountry = pair[1].Country,
                    HomeScore = pair[0].PointsHome >= pair[1].PointsHome ? 1 : 0,
                    AwayScore = pair[1].PointsHome > pair[0].PointsHome ? 1 : 0,
                    OpponentTeamId = pair[0].IsMine ? pair[1].Id : pair[0].Id,
                    HomeStrength = (int)Math.Round(pair[0].Strength, MidpointRounding.AwayFromZero),
                    AwayStrength = (int)Math.Round(pair[1].Strength, MidpointRounding.AwayFromZero),
                    HasLineup = pair[0].IsMine || pair[1].IsMine,
                    HomeTrikot = "trikot0",
                    AwayTrikot = "trikot0",
                    IsFriendly = false
                })
                .ToArray()
        };
    }

    public async Task<GoalGettersResponse> GetGoalGettersAsync(string userId, Guid leagueId, CancellationToken cancellationToken = default)
    {
        var table = await leagueStore.GetLeagueTableForUserAsync(userId, leagueId, cancellationToken);

        return new GoalGettersResponse
        {
            Success = true,
            Players = table.Teams
                .OrderByDescending(team => team.GoalsScoredHome + team.GoalsScoredAway)
                .Take(10)
                .Select((team, index) => new GoalGetterPlayerData
                {
                    Id = Guid.NewGuid(),
                    Name = $"{team.Name} Striker",
                    Country = team.Country,
                    Head = $"01_head-A{index % 15:00}",
                    Strength = team.Strength,
                    Talent = Math.Clamp(10 - (index / 2), 6, 10),
                    Age = 18 + index,
                    Position = 6,
                    EndDate = DateTime.UtcNow.Date.AddDays(14).ToString("O"),
                    TeamName = team.Name,
                    TeamLogo = team.Logo,
                    IsMine = team.IsMine,
                    Goals = team.GoalsScoredHome + team.GoalsScoredAway
                })
                .ToArray()
        };
    }
}
