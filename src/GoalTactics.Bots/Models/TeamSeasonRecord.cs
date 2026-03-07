namespace GoalTactics.Bots.Models;

public sealed class TeamSeasonRecord
{
    public int Season { get; init; }

    public required Guid BotId { get; init; }

    public required string TeamName { get; init; }

    public required string Persona { get; init; }

    public int Tier { get; init; }

    public int LeagueGroup { get; init; }

    public int StadiumLevel { get; init; }

    public int TrainingCenterLevel { get; init; }

    public int TeamStrength { get; init; }

    public decimal MoneyBalance { get; init; }

    public decimal StarsBalance { get; init; }

    public decimal MoneyInSeason { get; init; }

    public decimal MoneyOutSeason { get; init; }

    public decimal StarsInSeason { get; init; }

    public decimal StarsOutSeason { get; init; }
}
