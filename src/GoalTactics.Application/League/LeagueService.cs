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

    public Task<MatchesResponse> GetMatchesAsync(string userId, Guid leagueId, CancellationToken cancellationToken = default)
        => Task.FromResult(new MatchesResponse { Success = true });

    public Task<GoalGettersResponse> GetGoalGettersAsync(string userId, Guid leagueId, CancellationToken cancellationToken = default)
        => Task.FromResult(new GoalGettersResponse { Success = true });
}
