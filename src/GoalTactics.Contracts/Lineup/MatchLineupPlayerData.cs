namespace GoalTactics.Contracts.Lineup;

public sealed class MatchLineupPlayerData
{
    public Guid PlayerId { get; init; }

    public string? Name { get; init; }

    public string? Position { get; init; }

    public bool IsStarting { get; init; }
}
