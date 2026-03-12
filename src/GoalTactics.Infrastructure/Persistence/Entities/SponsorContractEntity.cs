namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class SponsorContractEntity
{
    public required string Id { get; set; }

    public required string TeamId { get; set; }

    /// <summary>Main or Secondary.</summary>
    public required string Type { get; set; }

    public required string SponsorName { get; set; }

    public string? SponsorDescription { get; set; }

    /// <summary>Base money paid per matchday.</summary>
    public long BaseMoney { get; set; }

    /// <summary>Extra money per win.</summary>
    public long BonusPerWin { get; set; }

    /// <summary>Extra money per goal scored.</summary>
    public long BonusPerGoal { get; set; }

    /// <summary>GT Stars paid daily.</summary>
    public int StarsPayout { get; set; }

    public DateTime StartDateUtc { get; set; }

    public DateTime EndDateUtc { get; set; }

    public bool IsActive { get; set; } = true;

    public TeamEntity? Team { get; set; }
}
