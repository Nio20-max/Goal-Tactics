namespace GoalTactics.Contracts.Scouting;

public sealed class ScoutedPlayerData
{
    public Guid Id { get; init; }

    public string? Name { get; init; }

    public string? Position { get; init; }

    public int Talent { get; init; }

    public int Strength { get; init; }
}
