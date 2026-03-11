using GoalTactics.Application.League;
using GoalTactics.Application.Team;
using GoalTactics.Contracts.Lineup;

namespace GoalTactics.Application.Lineup;

public interface ILineupService
{
    Task<LineupsResponse> GetLineupsAsync(string userId, CancellationToken cancellationToken = default);

    Task<MatchLineupResponse> GetMatchLineupAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);

    Task SaveLineupAsync(string userId, SaveLineupRequest request, CancellationToken cancellationToken = default);
}

public sealed class LineupService(ILeagueStore leagueStore, ITeamStore teamStore) : ILineupService
{
    private static readonly string[] SystemNames = ["4-4-2", "4-3-3", "3-5-2", "4-5-1", "5-3-2", "3-4-3"];
    private static readonly string[] TacticNames = ["Balanced", "Offensive", "Defensive", "Counter"];

    private static string PositionToString(int pos) => pos switch
    {
        0 => "Keeper",
        1 => "Defender",
        2 => "Midfielder",
        3 => "Striker",
        _ => "Midfielder"
    };

    private static int PositionToInt(string pos) => pos switch
    {
        "GK" => 0,
        "DEF" => 1,
        "MID" => 2,
        "FWD" => 3,
        _ => 2
    };

    public async Task<LineupsResponse> GetLineupsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var teamInfo = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        var upcoming = await leagueStore.GetUpcomingMatchesForTeamAsync(teamInfo.TeamId, cancellationToken);

        var lineups = upcoming.Select(m =>
        {
            var isHome = m.HomeTeamId == teamInfo.TeamId;
            var opponent = isHome ? m.AwayName : m.HomeName;
            return new LineupSummaryData
            {
                MatchId = m.Id,
                Opponent = opponent,
                IsLocked = false
            };
        }).ToArray();

        return new LineupsResponse { Success = true, Lineups = lineups };
    }

    public async Task<MatchLineupResponse> GetMatchLineupAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var teamInfo = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        // Get players
        var squad = await teamStore.GetSquadPlayersAsync(userId, cancellationToken);
        var players = squad.Select((p, i) => new MatchLineupPlayerData
        {
            PlayerId = p.Id,
            Name = p.Name,
            Position = PositionToString(PositionToInt(p.Position)),
            IsStarting = i < 11
        }).ToList();

        return new MatchLineupResponse
        {
            Success = true,
            IsLocked = false,
            Systems = SystemNames.ToList(),
            Tactics = TacticNames,
            Players = players
        };
    }

    public Task SaveLineupAsync(string userId, SaveLineupRequest request, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }
}
