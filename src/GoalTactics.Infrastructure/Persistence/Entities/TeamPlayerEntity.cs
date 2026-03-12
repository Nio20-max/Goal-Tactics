namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamPlayerEntity
{
    public required string Id { get; set; }

    public required string TeamId { get; set; }

    public string Name { get; set; } = string.Empty;

    public string Origin { get; set; } = "DE";

    public string Position { get; set; } = "MID";

    public int ShirtNumber { get; set; }

    public int Age { get; set; }

    public int Talent { get; set; }

    public decimal Strength { get; set; }

    public int Fitness { get; set; }

    public int Matches { get; set; }

    public int Goals { get; set; }

    public int YellowCards { get; set; }

    public int RedCards { get; set; }

    public string? IndividualTrainingSkill { get; set; }

    public DateTime? IndividualTrainingUntilUtc { get; set; }

    public DateTime? ContractEndUtc { get; set; }

    /// <summary>True while the player is in the scouted pool (not yet recruited).</summary>
    public bool IsScouted { get; set; }

    public TeamEntity? Team { get; set; }
}
