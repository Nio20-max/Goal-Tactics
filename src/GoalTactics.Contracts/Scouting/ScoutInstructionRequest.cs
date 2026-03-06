using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Scouting;

public sealed class ScoutInstructionRequest : RequestObject
{
    public string? ScoutType { get; init; }

    public string? PositionFilter { get; init; }
}
