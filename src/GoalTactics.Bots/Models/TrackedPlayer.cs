namespace GoalTactics.Bots.Models;

public sealed class TrackedPlayer
{
    public required string PlayerId { get; init; }

    public required string PlayerName { get; init; }

    public required string ManagerPersona { get; init; }

    public int PositionGroup { get; init; }

    public int Talent { get; init; }

    public int Fitness { get; set; }

    public int StartAge { get; init; }

    public int CurrentAge { get; set; }

    public decimal CurrentStrength { get; set; }

    public bool UsesIndividualTraining { get; init; }

    public decimal LastDailyGain { get; set; }

    public bool Sold { get; set; }

    public int? SoldInSeason { get; set; }

    public decimal? SoldFeeMoney { get; set; }
}
