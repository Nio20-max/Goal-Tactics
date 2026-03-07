namespace GoalTactics.Bots.Models;

public sealed class TrackedPlayerSeasonRecord
{
    public int Season { get; init; }

    public required string PlayerId { get; init; }

    public required string PlayerName { get; init; }

    public required string ManagerPersona { get; init; }

    public int StartAge { get; init; }

    public int AgeAtSeasonEnd { get; init; }

    public int StrengthAtSeasonEnd { get; init; }

    public bool Sold { get; init; }

    public decimal? SoldFeeMoney { get; init; }
}
