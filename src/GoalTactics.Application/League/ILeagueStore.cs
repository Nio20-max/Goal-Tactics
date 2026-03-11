namespace GoalTactics.Application.League;

public interface ILeagueStore
{
    Task<LeagueTableRecord> GetLeagueTableForUserAsync(string userId, Guid requestedLeagueId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<LeagueMatchRecord>> GetMatchesForUserAsync(string userId, Guid requestedLeagueId, CancellationToken cancellationToken = default);
    Task<LeagueMatchRecord?> GetMatchAsync(Guid matchId, CancellationToken cancellationToken = default);
    Task<IReadOnlyList<LeagueMatchRecord>> GetUpcomingMatchesForTeamAsync(string teamId, CancellationToken cancellationToken = default);
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
