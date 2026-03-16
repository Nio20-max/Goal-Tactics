using GoalTactics.Contracts.League;

namespace GoalTactics.Application.League;

public interface ILeagueService
{
    Task<LeagueTableResponse> GetLeagueTableAsync(string userId, Guid leagueId, CancellationToken cancellationToken = default);

    Task<MatchesResponse> GetMatchesAsync(string userId, Guid leagueId, int page = 1, int pageSize = 50, CancellationToken cancellationToken = default);

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

    public async Task<MatchesResponse> GetMatchesAsync(string userId, Guid leagueId, int page = 1, int pageSize = 50, CancellationToken cancellationToken = default)
    {
        var matches = await leagueStore.GetMatchesForUserAsync(userId, leagueId, cancellationToken);

        var totalCount = matches.Count;

        return new MatchesResponse
        {
            Success = true,
            HomeTrikot = "trikot0",
            AwayTrikot = "trikot0",
            TotalCount = totalCount,
            CurrentPage = 1,
            TotalPages = 1,
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
                    HomeScore = m.HomeScore ?? -1,
                    AwayScore = m.AwayScore ?? -1,
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
        // Determine the user's league if none specified
        var effectiveLeagueId = leagueId;
        if (effectiveLeagueId == Guid.Empty)
        {
            var table = await leagueStore.GetLeagueTableForUserAsync(userId, Guid.Empty, cancellationToken);
            // We need a league ID; since GetLeagueTableForUserAsync resolves it, let's fetch from matches
            var matches = await leagueStore.GetMatchesForUserAsync(userId, Guid.Empty, cancellationToken);
            // Use the table to generate GoalGetters from real data
        }

        var topScorers = await leagueStore.GetTopScorersAsync(effectiveLeagueId, 10, cancellationToken);

        if (topScorers.Count > 0)
        {
            return new GoalGettersResponse
            {
                Success = true,
                Players = topScorers.Select(s => new GoalGetterPlayerData
                {
                    Id = s.PlayerId,
                    Name = s.PlayerName,
                    Country = s.Origin.ToLowerInvariant(),
                    Head = s.Head,
                    Strength = s.Strength,
                    Talent = s.Talent,
                    Age = s.Age,
                    Position = s.Position switch { "GK" => 0, "DEF" => 2, "MID" => 4, "FWD" => 6, _ => 4 },
                    EndDate = DateTime.UtcNow.Date.AddDays(14).ToString("O"),
                    TeamName = s.TeamName,
                    TeamLogo = s.TeamLogo,
                    IsMine = s.IsMine,
                    Goals = s.Goals
                }).ToArray()
            };
        }

        // No goals scored yet — return an empty list instead of placeholder data
        return new GoalGettersResponse
        {
            Success = true,
            Players = []
        };
    }
}
