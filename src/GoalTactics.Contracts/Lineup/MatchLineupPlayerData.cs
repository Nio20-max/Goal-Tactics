namespace GoalTactics.Contracts.Lineup;

/// <summary>LineupPlayerData in Android app — flat model.</summary>
public sealed class MatchLineupPlayerData
{
    public Guid PlayerId { get; init; }
    public string? Name { get; init; }
    public string? Position { get; init; }
    public bool IsStarting { get; init; }
}
