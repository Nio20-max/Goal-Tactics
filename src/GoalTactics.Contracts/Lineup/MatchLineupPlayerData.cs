using GoalTactics.Contracts.Squad;

namespace GoalTactics.Contracts.Lineup;

/// <summary>LineupPlayerData : SquadPlayerData in decompiled app.</summary>
public sealed class MatchLineupPlayerData : SquadPlayerData
{
    public List<PositionStrength>? Positions { get; init; }
}

public sealed class PositionStrength
{
    public Guid PositionId { get; init; }
    public decimal Strength { get; init; }
}
