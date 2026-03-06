namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class LeagueTeamEntity
{
    public required string Id { get; set; }

    public required string LeagueId { get; set; }

    public string? TeamId { get; set; }

    public required string TeamName { get; set; }

    public bool IsBot { get; set; }

    public decimal Strength { get; set; }

    public string Country { get; set; } = "DE";

    public string Logo { get; set; } = "logo_default";

    public bool IsOnline { get; set; }

    public int MatchesHome { get; set; }

    public int MatchesAway { get; set; }

    public int WinsHome { get; set; }

    public int WinsAway { get; set; }

    public int LossesHome { get; set; }

    public int LossesAway { get; set; }

    public int DrawsHome { get; set; }

    public int DrawsAway { get; set; }

    public int GoalsScoredHome { get; set; }

    public int GoalsScoredAway { get; set; }

    public int GoalsReceivedHome { get; set; }

    public int GoalsReceivedAway { get; set; }

    public int PointsHome { get; set; }

    public int PointsAway { get; set; }

    public LeagueEntity? League { get; set; }
}
