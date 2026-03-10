using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Lineup;

public sealed class MatchLineupResponse : ResponseObject
{
    public IReadOnlyList<MatchLineupPlayerData> Players { get; init; } = [];
    public IReadOnlyList<MatchSystemData> Systems { get; init; } = [];
    public TacticData[] Tactics { get; init; } = [];
    public MatchFormationData? FormationData { get; init; }
    public bool IsLocked { get; init; }
    public string? HomeShirt { get; init; }
    public decimal CaptainBonus { get; init; }
    public decimal PenaltyBonus { get; init; }
    public decimal CornerBonus { get; init; }
    public decimal FreekickBonus { get; init; }
}

public sealed class MatchFormationData
{
    public List<FormationPlayer>? Players { get; init; }
    public Guid MatchSystemID { get; init; }
    public Guid MatchTacticID { get; init; }
}

public sealed class FormationPlayer
{
    public Guid PlayerID { get; init; }
    public Guid MatchSystemFieldID { get; init; }
    public List<Guid>? MatchStandardPositionID { get; init; }
    public Guid MatchPositionDirectionID { get; init; }
}

public sealed class MatchSystemData
{
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public List<MatchSystemFieldData>? Fields { get; init; }
}

public sealed class MatchSystemFieldData
{
    public Guid Id { get; init; }
    public Guid PositionId { get; init; }
}

public sealed class TacticData
{
    public Guid ID { get; init; }
    public string? Name { get; init; }
    public int Value { get; init; }
}
