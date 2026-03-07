namespace GoalTactics.Bots.Models;

public sealed class TrackedPlayer
{
    public required string PlayerId { get; init; }

    public required string PlayerName { get; init; }

    public required string ManagerPersona { get; init; }

    public int StartAge { get; init; }

    public int CurrentAge { get; set; }

    public int CurrentStrength { get; set; }

    public bool Sold { get; set; }

    public int? SoldInSeason { get; set; }

    public decimal? SoldFeeMoney { get; set; }
}
