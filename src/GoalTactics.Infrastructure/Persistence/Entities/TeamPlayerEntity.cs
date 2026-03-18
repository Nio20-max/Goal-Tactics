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

    public decimal Experience { get; set; }

    public decimal? MarketValue { get; set; }

    public decimal? Skill0 { get; set; }

    public decimal? Skill1 { get; set; }

    public decimal? Skill2 { get; set; }

    public decimal? Skill3 { get; set; }

    public decimal? Skill4 { get; set; }

    public decimal? Skill5 { get; set; }

    public decimal? Skill6 { get; set; }

    public decimal? Skill7 { get; set; }

    public decimal? Skill8 { get; set; }

    public decimal? Skill9 { get; set; }

    public decimal? Skill10 { get; set; }

    public decimal? Skill11 { get; set; }

    public decimal? Skill12 { get; set; }

    public decimal? Skill13 { get; set; }

    public int Fitness { get; set; }

    public int Matches { get; set; }

    public int Goals { get; set; }

    public int YellowCards { get; set; }

    public int RedCards { get; set; }

    public int SuspensionMatchesRemaining { get; set; }

    public string? IndividualTrainingSkill { get; set; }

    public DateTime? IndividualTrainingUntilUtc { get; set; }

    public DateTime? ContractEndUtc { get; set; }

    /// <summary>True while the player is in the scouted pool (not yet recruited).</summary>
    public bool IsScouted { get; set; }

    /// <summary>When this scouted player becomes visible/ready. Null for non-scouted players.</summary>
    public DateTime? ScoutingReadyAtUtc { get; set; }

    public string Head { get; set; } = "01_head-A01";

    public string Body { get; set; } = "01_body-A00";

    public string Gloves { get; set; } = "01_Gloves01";

    public string Shoes { get; set; } = "01_Shoes01";

    /// <summary>Whether this scouted player was obtained using premium (stars) scouting.</summary>
    public bool IsPremiumScouting { get; set; }

    public TeamEntity? Team { get; set; }
}
