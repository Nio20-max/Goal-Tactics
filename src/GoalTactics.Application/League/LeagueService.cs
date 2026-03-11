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
        var matches = await leagueStore.GetMatchesForUserAsync(userId, leagueId, cancellationToken);

        return new MatchesResponse
        {
            Success = true,
            HomeTrikot = "trikot0",
            AwayTrikot = "trikot0",
            Matches = matches.Select(m =>
            {
                var userTeamId = m.UserTeamId;
                int myTeam = 0;
                if (userTeamId is not null)
                {
                    if (m.HomeTeamId == userTeamId) myTeam = 1;
                    else if (m.AwayTeamId == userTeamId) myTeam = 2;
                }

                return new MatchData
                {
                    Id = m.Id,
                    Date = m.ScheduledDateUtc.ToString("O"),
                    HomeLogo = m.HomeLogo,
                    AwayLogo = m.AwayLogo,
                    HomeName = m.HomeName,
                    AwayName = m.AwayName,
                    MyTeam = myTeam,
                    HomeCountry = m.HomeCountry,
                    AwayCountry = m.AwayCountry,
                    HomeScore = m.HomeScore ?? 0,
                    AwayScore = m.AwayScore ?? 0,
                    OpponentTeamId = myTeam == 1
                        ? (Guid.TryParse(m.AwayTeamId, out var oid) ? oid : Guid.Empty)
                        : (Guid.TryParse(m.HomeTeamId, out var oid2) ? oid2 : Guid.Empty),
                    HomeStrength = m.HomeStrength,
                    AwayStrength = m.AwayStrength,
                    HasLineup = myTeam > 0,
                    HomeTrikot = "trikot0",
                    AwayTrikot = "trikot0",
                    IsFriendly = false
                };
            }).ToArray()
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
