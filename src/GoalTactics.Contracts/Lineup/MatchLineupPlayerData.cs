using GoalTactics.Contracts.Squad;

namespace GoalTactics.Contracts.Lineup;

/// <summary>Lineup player: all SquadPlayerData fields + per-position strengths for Xamarin compat.</summary>
public sealed class MatchLineupPlayerData : SquadPlayerData
{
    /// <summary>Legacy Xamarin compatibility: per-position strengths (0..3) used by older clients.</summary>
    public List<PositionStrength>? PositionStrengths { get; init; }

    /// <summary>Modern client expects per-position strengths keyed by position GUID.</summary>
    public List<PositionStrengthById>? Positions { get; init; }
}

public sealed class PositionStrength
{
    public int Position { get; init; }
    public decimal Strength { get; init; }
}

public sealed class PositionStrengthById
{
    public Guid PositionId { get; init; }
    public decimal Strength { get; init; }
}
