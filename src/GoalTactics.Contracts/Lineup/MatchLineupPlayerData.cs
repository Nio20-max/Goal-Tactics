using GoalTactics.Contracts.Squad;

namespace GoalTactics.Contracts.Lineup;

/// <summary>Lineup player: all SquadPlayerData fields + per-position strengths for Xamarin compat.</summary>
public sealed class MatchLineupPlayerData : SquadPlayerData
{
    public List<PositionStrength>? PositionStrengths { get; init; }
}

public sealed class PositionStrength
{
    public int Position { get; init; }
    public decimal Strength { get; init; }
}
