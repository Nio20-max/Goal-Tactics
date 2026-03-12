using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Scouting;

public sealed class ScoutInstructionRequest : RequestObject
{
    public string? ScoutType { get; init; }

    public string? PositionFilter { get; init; }

    /// <summary>Position filter sent by Xamarin client (-1 = any, 0 = GK, 1 = DEF, 2 = MID, 3 = FWD).</summary>
    public int Position { get; init; } = -1;

    /// <summary>Price/cost sent by Xamarin client (e.g. 500000 for normal scout).</summary>
    public int Price { get; init; }
}
