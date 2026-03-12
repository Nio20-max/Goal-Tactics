namespace GoalTactics.Application.League;

public interface ILeagueStore
{
    Task<LeagueTableRecord> GetLeagueTableForUserAsync(string userId, Guid requestedLeagueId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<LeagueMatchRecord>> GetMatchesForUserAsync(string userId, Guid requestedLeagueId, CancellationToken cancellationToken = default);
    Task<LeagueMatchRecord?> GetMatchAsync(Guid matchId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<LeagueMatchRecord>> GetUpcomingMatchesForTeamAsync(string teamId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<GoalGetterRecord>> GetTopScorersAsync(Guid leagueId, int count, CancellationToken cancellationToken = default);
    Task ResolveMatchAsync(Guid matchId, int homeScore, int awayScore, IReadOnlyList<MatchScorerEvent> scorers, CancellationToken cancellationToken = default);
}

public sealed record LeagueTableRecord(string LeagueName, int Mount, int Dismount, IReadOnlyList<LeagueTableTeamRecord> Teams);

public sealed record LeagueMatchRecord(
    Guid Id,
    int Matchday,
    string HomeName,
    string AwayName,
    string HomeLogo,
    string AwayLogo,
    string HomeCountry,
    string AwayCountry,
    int HomeStrength,
    int AwayStrength,
    int? HomeScore,
    int? AwayScore,
    bool IsPlayed,
    DateTime ScheduledDateUtc,
    string HomeTeamId,
    string AwayTeamId,
    string? UserTeamId);

public sealed record LeagueTableTeamRecord(
    Guid Id,
    string Name,
    decimal Strength,
    string Logo,
    string Country,
    bool IsOnline,
    bool IsMine,
    int MatchesHome,
    int MatchesAway,
    int WinsHome,
    int WinsAway,
    int LossesHome,
    int LossesAway,
    int DrawsHome,
    int DrawsAway,
    int GoalsScoredHome,
    int GoalsScoredAway,
    int GoalsReceivedHome,
    int GoalsReceivedAway,
    int PointsHome,
    int PointsAway);

public sealed record GoalGetterRecord(
    Guid PlayerId,
    string PlayerName,
    string Origin,
    string Head,
    decimal Strength,
    int Talent,
    int Age,
    string Position,
    int Goals,
    string TeamName,
    string TeamLogo,
    bool IsMine);

public sealed record MatchScorerEvent(
    string TeamId,
    string PlayerId,
    int Minute);
