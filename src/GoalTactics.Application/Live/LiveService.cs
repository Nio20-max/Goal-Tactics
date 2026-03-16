using System.Text.Json;
using GoalTactics.Application.League;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Team;
using GoalTactics.Contracts.Live;

namespace GoalTactics.Application.Live;

public interface ILiveService
{
    Task<LiveMatchResponse> GetLiveMatchAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);

    Task<LiveMatchResponse> GetMatchReportAsync(string userId, Guid matchId, CancellationToken cancellationToken = default);
}

public sealed class LiveService(ILeagueStore leagueStore, ITeamStore teamStore) : ILiveService
{
    public async Task<LiveMatchResponse> GetLiveMatchAsync(string userId, Guid matchId, CancellationToken cancellationToken = default)
    {
        var match = await ResolveMatchAsync(userId, matchId, cancellationToken);
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
        var match = await ResolveMatchAsync(userId, matchId, cancellationToken);
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

    private async Task<LeagueMatchRecord?> ResolveMatchAsync(string userId, Guid matchId, CancellationToken cancellationToken)
    {
        if (matchId != Guid.Empty)
            return await leagueStore.GetMatchAsync(matchId, cancellationToken);

        // No matchId provided — find the user's next/current match
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var upcoming = await leagueStore.GetUpcomingMatchesForTeamAsync(team.TeamId, cancellationToken);
        return upcoming.FirstOrDefault();
    }

    private static LiveMatchResponse BuildResponse(LeagueMatchRecord match)
    {
        // Parse stored events JSON if available
        List<LiveMatchEventData>? eventDataList = null;
        List<MatchEvent>? matchEvents = null;
        if (!string.IsNullOrEmpty(match.EventsJson))
        {
            try
            {
                var jsonEvents = JsonSerializer.Deserialize<JsonElement[]>(match.EventsJson);
                if (jsonEvents is not null)
                {
                    eventDataList = new List<LiveMatchEventData>();
                    matchEvents = new List<MatchEvent>();
                    foreach (var je in jsonEvents)
                    {
                        var minute = je.GetProperty("Minute").GetInt32();
                        var typeName = je.GetProperty("Type").GetString() ?? "Goal";
                        var isHome = je.GetProperty("IsHome").GetBoolean();
                        var playerId = je.TryGetProperty("PlayerId", out var pid) ? pid.GetString() : null;
                        var playerName = je.TryGetProperty("PlayerName", out var pn) ? pn.GetString() : null;
                        var description = je.TryGetProperty("Description", out var desc) ? desc.GetString() : null;

                        eventDataList.Add(new LiveMatchEventData
                        {
                            Minute = minute,
                            Type = typeName,
                            IsHome = isHome,
                            PlayerName = playerName,
                            Description = description ?? $"{minute}' — {playerName}"
                        });

                        if (Enum.TryParse<MatchEventType>(typeName, out var eventType))
                        {
                            matchEvents.Add(new MatchEvent(minute, eventType, isHome, playerId, playerName));
                        }
                    }
                }
            }
            catch (JsonException)
            {
                // Corrupted JSON — ignore and fall back to simple report
            }
        }

        var report = match.IsPlayed
            ? GenerateReport(match, matchEvents)
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
                Report = report,
                Events = eventDataList?.ToArray()
            }
        };
    }

    private static string GenerateReport(LeagueMatchRecord m, IReadOnlyList<MatchEvent>? events)
    {
        if (events is not null && events.Count > 0)
        {
            return MatchReportGenerator.GenerateFullReport(
                m.HomeName, m.AwayName,
                m.HomeScore ?? 0, m.AwayScore ?? 0,
                events);
        }

        return $"<b>{m.HomeName} {m.HomeScore} - {m.AwayScore} {m.AwayName}</b>";
    }
}
