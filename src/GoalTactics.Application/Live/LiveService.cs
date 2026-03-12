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
            var report = "Match not found";
            return new LiveMatchResponse
            {
                Success = true,
                Report = report,
                Match = new LiveMatchData
                {
                    MatchId = matchId,
                    Id = matchId,
                    HomeScore = -1,
                    AwayScore = -1,
                    HomeStrength = -1,
                    AwayStrength = -1,
                    Report = report
                }
            };
        }

        return BuildResponse(match);
    }

    public async Task<LiveMatchResponse> GetMatchReportAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var match = await leagueStore.GetMatchAsync(matchId, cancellationToken);
        if (match is null)
        {
            var report = "Match not found";
            return new LiveMatchResponse
            {
                Success = true,
                Report = report,
                Match = new LiveMatchData
                {
                    MatchId = matchId,
                    Id = matchId,
                    HomeScore = -1,
                    AwayScore = -1,
                    HomeStrength = -1,
                    AwayStrength = -1,
                    Report = report
                }
            };
        }

        return BuildResponse(match);
    }

    private static LiveMatchResponse BuildResponse(LeagueMatchRecord match)
    {
        var report = match.IsPlayed
            ? GenerateReport(match)
            : $"Upcoming match: {match.HomeName} vs {match.AwayName} on {match.ScheduledDateUtc:yyyy-MM-dd}";

        var myTeam = match.UserTeamId == match.HomeTeamId ? 1
                   : match.UserTeamId == match.AwayTeamId ? 2
                   : 0;

        var opponentTeamId = myTeam == 1
            ? Guid.TryParse(match.AwayTeamId, out var awayGuid) ? awayGuid : Guid.Empty
            : Guid.TryParse(match.HomeTeamId, out var homeGuid) ? homeGuid : Guid.Empty;

        return new LiveMatchResponse
        {
            Success = true,
            Report = report,
            Match = new LiveMatchData
            {
                // Android
                MatchId = match.Id,
                HomeTeam = match.HomeName,
                AwayTeam = match.AwayName,
                // Xamarin
                Id = match.Id,
                HomeName = match.HomeName,
                AwayName = match.AwayName,
                HomeLogo = match.HomeLogo,
                AwayLogo = match.AwayLogo,
                HomeCountry = match.HomeCountry ?? "",
                AwayCountry = match.AwayCountry ?? "",
                HomeScore = match.HomeScore ?? -1,
                AwayScore = match.AwayScore ?? -1,
                HomeStrength = match.HomeStrength,
                AwayStrength = match.AwayStrength,
                HasLineup = false,
                IsFriendly = false,
                HomeTrikot = null,
                AwayTrikot = null,
                OpponentTeamId = opponentTeamId,
                Date = match.ScheduledDateUtc.ToString("O"),
                MyTeam = myTeam,
                Report = report
            }
        };
    }

    private static string GenerateReport(LeagueMatchRecord m)
    {
        return $"<b>{m.HomeName} {m.HomeScore} - {m.AwayScore} {m.AwayName}</b>";
    }
}
