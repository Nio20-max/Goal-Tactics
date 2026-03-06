namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class LadderEntryEntity
{
    public required string Id { get; set; }

    public required string LadderId { get; set; }

    public string? TeamId { get; set; }

    public required string TeamName { get; set; }

    public required string TeamLogo { get; set; }

    public int Points { get; set; }

    public int Rank { get; set; }

    public int Stamina { get; set; }

    public int Strength { get; set; }

    public bool IsBot { get; set; }

    public DateTime UpdatedAtUtc { get; set; }

    public LadderSeasonEntity? Ladder { get; set; }
}
