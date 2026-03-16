using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Scouting;

public sealed class SpeedupRequest : IdRequest
{
    /// <summary>Legacy clients sometimes send the speedup price instead of an item id.</summary>
    public int Price { get; init; }
}
