namespace GoalTactics.Contracts.Squad;

public sealed class SquadPlayerData
{
    public Guid Id { get; init; }

    public string? Name { get; init; }

    public string? Position { get; init; }

    public int Strength { get; init; }

    public int Fitness { get; init; }
}
