using System.IO;
using System.IO.Compression;
using System.Text;
using System.Text.Json;
using GoalTactics.Application.League;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Team;
using GoalTactics.Contracts.Live;
using GoalTactics.Contracts.League;

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
                Match = new MatchData
                {
                    Id = matchId,
                    HomeScore = 0,
                    AwayScore = 0,
                    HomeStrength = -1,
                    AwayStrength = -1,
                    HasScore = false,
                    Date = DateTime.UtcNow.ToString("O"),
                    DateValue = DateTime.UtcNow,
                }
            };
        }

        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        return BuildResponse(match, team.TeamId);
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
                Match = new MatchData
                {
                    Id = matchId,
                    HomeScore = 0,
                    AwayScore = 0,
                    HomeStrength = -1,
                    AwayStrength = -1,
                    HasScore = false,
                    Date = DateTime.UtcNow.ToString("O"),
                    DateValue = DateTime.UtcNow,
                }
            };
        }

        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        return BuildResponse(match, team.TeamId);
    }

    private async Task<LeagueMatchRecord?> ResolveMatchAsync(string userId, Guid matchId, CancellationToken cancellationToken)
    {
        if (matchId != Guid.Empty)
            return await leagueStore.GetMatchAsync(matchId, cancellationToken);

        // No matchId provided — find the user's live match (in-progress) if any, otherwise next upcoming match.
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var upcoming = await leagueStore.GetUpcomingMatchesForTeamAsync(team.TeamId, cancellationToken);

        var now = DateTime.UtcNow;

        // Prefer a match that should already have started but is not yet marked as played.
        var inProgress = upcoming
            .Where(m => !m.IsPlayed && m.ScheduledDateUtc <= now)
            .OrderByDescending(m => m.ScheduledDateUtc)
            .FirstOrDefault();

        if (inProgress is not null)
            return inProgress;

        return upcoming
            .OrderBy(m => m.ScheduledDateUtc)
            .FirstOrDefault();
    }

    private static LiveMatchResponse BuildResponse(LeagueMatchRecord match, string? userTeamId)
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
                // Corrupted events JSON — gracefully degrade to simple report without events
            }
        }

        // Build the match report payload expected by the legacy client.
        // It must be JSON that deserializes into the client's MatchReportData type.
        var now = DateTime.UtcNow;
        var isLiveInProgress = !match.IsPlayed && match.ScheduledDateUtc <= now;

        // For live matches, we can derive the current score from the stored event list.
        // Otherwise, for upcoming matches we still return -1:-1 to match legacy client behavior.
        int homeScore;
        int awayScore;
        bool hasScore;

        if (match.IsPlayed)
        {
            homeScore = match.HomeScore ?? -1;
            awayScore = match.AwayScore ?? -1;
            hasScore = true;
        }
        else if (isLiveInProgress)
        {
            if (matchEvents is not null && matchEvents.Any(e => e.Type == MatchEventType.Goal))
            {
                homeScore = matchEvents.Count(e => e.Type == MatchEventType.Goal && e.IsHome);
                awayScore = matchEvents.Count(e => e.Type == MatchEventType.Goal && !e.IsHome);
            }
            else
            {
                homeScore = 0;
                awayScore = 0;
            }

            hasScore = true;
        }
        else
        {
            homeScore = -1;
            awayScore = -1;
            hasScore = false;
        }

        var reportMessage = match.IsPlayed
            ? GenerateReport(match, matchEvents)
            : isLiveInProgress
                ? $"Live match: {match.HomeName} vs {match.AwayName}"
                : $"Upcoming match: {match.HomeName} vs {match.AwayName} on {match.ScheduledDateUtc:yyyy-MM-dd}";

        var matchEventList = matchEvents?.Select(e => new MatchReportEntryData
        {
            EntrySeverity = Severity.Normal,
            Type = e.Type switch
            {
                MatchEventType.Goal => EventType.Goal,
                MatchEventType.YellowCard => EventType.FoulYellow,
                MatchEventType.RedCard => EventType.FoulRed,
                MatchEventType.Injury => EventType.Injury,
                MatchEventType.Substitution => EventType.Replacement,
                _ => EventType.MatchInfo,
            },
            IsAdditionalTime = false,
            IsHomeTeamEvent = e.IsHome,
            KeyPlayerName = e.PlayerName,
            KeyPlayerName2 = null,
            Minute = e.Minute,
            Message = e.PlayerName ?? string.Empty,
            HomeTeamGoals = homeScore,
            AwayTeamGoals = awayScore,
            HomeTeamGoalshots = 0,
            AwayTeamGoalshots = 0,
            HomeTeamCorners = 0,
            AwayTeamCorners = 0,
            HomeTeamOffside = 0,
            AwayTeamOffside = 0,
            HomeTeamActions = 0,
            AwayTeamActions = 0,
            HomeTeamFouls = 0,
            AwayTeamFouls = 0,
            HomeTeamYellowCards = 0,
            AwayTeamYellowCards = 0,
            HomeTeamRedCards = 0,
            AwayTeamRedCards = 0,
            Second = 0,
            IsMinuteVisible = true
        }).ToList() ?? new List<MatchReportEntryData>();

        if (matchEventList.Count == 0)
        {
            matchEventList.Add(new MatchReportEntryData
            {
                EntrySeverity = Severity.Normal,
                Type = EventType.MatchInfo,
                IsAdditionalTime = false,
                IsHomeTeamEvent = false,
                KeyPlayerName = null,
                KeyPlayerName2 = null,
                Minute = 0,
                Message = reportMessage,
                HomeTeamGoals = homeScore,
                AwayTeamGoals = awayScore,
                HomeTeamGoalshots = 0,
                AwayTeamGoalshots = 0,
                HomeTeamCorners = 0,
                AwayTeamCorners = 0,
                HomeTeamOffside = 0,
                AwayTeamOffside = 0,
                HomeTeamActions = 0,
                AwayTeamActions = 0,
                HomeTeamFouls = 0,
                AwayTeamFouls = 0,
                HomeTeamYellowCards = 0,
                AwayTeamYellowCards = 0,
                HomeTeamRedCards = 0,
                AwayTeamRedCards = 0,
                Second = 0,
                IsMinuteVisible = true
            });
        }

        var matchReport = new MatchReportData
        {
            MatchEvents = matchEventList,
            HomeLineUp = new List<LineUp>(),
            AwayLineUp = new List<LineUp>()
        };

        var report = JsonSerializer.Serialize(matchReport);
        report = CompressIfNeeded(report);

        var myTeam = !string.IsNullOrEmpty(userTeamId) && userTeamId == match.HomeTeamId ? 1
                   : !string.IsNullOrEmpty(userTeamId) && userTeamId == match.AwayTeamId ? 2
                   : 0;

        var opponentTeamId = myTeam == 1
            ? Guid.TryParse(match.AwayTeamId, out var awayGuid) ? awayGuid : Guid.Empty
            : Guid.TryParse(match.HomeTeamId, out var homeGuid) ? homeGuid : Guid.Empty;

        return new LiveMatchResponse
        {
            Success = true,
            Report = report,
            Match = new MatchData
            {
                Id = match.Id,
                Date = match.ScheduledDateUtc.ToString("O"),
                DateValue = match.ScheduledDateUtc,
                HomeLogo = match.HomeLogo,
                AwayLogo = match.AwayLogo,
                HomeName = match.HomeName,
                AwayName = match.AwayName,
                MyTeam = myTeam,
                HomeCountry = match.HomeCountry ?? "",
                AwayCountry = match.AwayCountry ?? "",
                HomeScore = homeScore,
                AwayScore = awayScore,
                OpponentTeamId = opponentTeamId,
                HomeStrength = match.HomeStrength,
                AwayStrength = match.AwayStrength,
                HasLineup = false,
                IsFriendly = false,
                HomeTrikot = null,
                AwayTrikot = null,
                HasScore = hasScore,
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

    private static string CompressIfNeeded(string payload)
    {
        if (string.IsNullOrEmpty(payload) || payload.Length < 170)
            return payload;

        var bytes = System.Text.Encoding.UTF8.GetBytes(payload);
        using var memoryStream = new MemoryStream();
        using (var gzip = new GZipStream(memoryStream, CompressionMode.Compress, leaveOpen: true))
        {
            gzip.Write(bytes, 0, bytes.Length);
        }
        memoryStream.Position = 0;
        var compressedBytes = new byte[memoryStream.Length + 4];
        Buffer.BlockCopy(BitConverter.GetBytes(bytes.Length), 0, compressedBytes, 0, 4);
        memoryStream.Read(compressedBytes, 4, (int)memoryStream.Length);
        return "#cmp#" + Convert.ToBase64String(compressedBytes);
    }
}
