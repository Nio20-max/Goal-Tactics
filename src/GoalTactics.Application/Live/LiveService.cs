using GoalTactics.Application.League;
using GoalTactics.Contracts.Live;

namespace GoalTactics.Application.Live;

public interface ILiveService
{
    Task<LiveMatchResponse> GetLiveMatchAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);

    Task<LiveMatchResponse> GetMatchReportAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);
}

public sealed class LiveService(ILeagueStore leagueStore) : ILiveService
{
    public async Task<LiveMatchResponse> GetLiveMatchAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var match = await leagueStore.GetMatchAsync(matchId, cancellationToken);
        if (match is null)
        {
            return new LiveMatchResponse
            {
                Success = true,
                Match = new LiveMatchData
                {
                    MatchId = matchId,
                    Report = "Match not found"
                }
            };
        }

        return new LiveMatchResponse
        {
            Success = true,
            Match = new LiveMatchData
            {
                MatchId = match.Id,
                HomeTeam = match.HomeName,
                AwayTeam = match.AwayName,
                HomeScore = match.HomeScore ?? 0,
                AwayScore = match.AwayScore ?? 0,
                Report = match.IsPlayed
                    ? GenerateReport(match)
                    : "Match has not started yet"
            }
        };
    }

    public async Task<LiveMatchResponse> GetMatchReportAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var match = await leagueStore.GetMatchAsync(matchId, cancellationToken);
        if (match is null)
        {
            return new LiveMatchResponse
            {
                Success = true,
                Match = new LiveMatchData
                {
                    MatchId = matchId,
                    Report = "Match not found"
                }
            };
        }

        return new LiveMatchResponse
        {
            Success = true,
            Match = new LiveMatchData
            {
                MatchId = match.Id,
                HomeTeam = match.HomeName,
                AwayTeam = match.AwayName,
                HomeScore = match.HomeScore ?? 0,
                AwayScore = match.AwayScore ?? 0,
                Report = match.IsPlayed
                    ? GenerateReport(match)
                    : $"Upcoming match: {match.HomeName} vs {match.AwayName} on {match.ScheduledDateUtc:yyyy-MM-dd}"
            }
        };
    }

    private static string GenerateReport(LeagueMatchRecord m)
    {
        return $"<b>{m.HomeName} {m.HomeScore} - {m.AwayScore} {m.AwayName}</b>";
    }
}
