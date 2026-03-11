namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class LeagueMatchEntity
{
    public required string Id { get; set; }
    public required string LeagueId { get; set; }
    public int Matchday { get; set; }
    public required string HomeLeagueTeamId { get; set; }
    public required string AwayLeagueTeamId { get; set; }
    public string? HomeTeamName { get; set; }
    public string? AwayTeamName { get; set; }
    public string? HomeLogo { get; set; }
    public string? AwayLogo { get; set; }
    public string? HomeCountry { get; set; }
    public string? AwayCountry { get; set; }
    public int HomeStrength { get; set; }
    public int AwayStrength { get; set; }
    public int? HomeScore { get; set; }
    public int? AwayScore { get; set; }
    public bool IsPlayed { get; set; }
    public DateTime ScheduledDateUtc { get; set; }
    public DateTime? PlayedAtUtc { get; set; }
    public LeagueEntity? League { get; set; }
}
