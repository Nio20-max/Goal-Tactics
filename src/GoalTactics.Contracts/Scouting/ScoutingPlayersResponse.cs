using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Scouting;

public sealed class ScoutingPlayersResponse : ResponseObject
{
    public IReadOnlyList<ScoutedPlayerData> Players { get; init; } = [];
    public int ScoutingCost { get; init; }
    public int PremiumScoutingCost { get; init; }
    public int SpeedupCost { get; init; }
    public string? NextScoutingDate { get; init; }
    public string? NextPremiumScoutingDate { get; init; }
}

public sealed class ScoutedPlayerData
{
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public string? Position { get; init; }
    public int Talent { get; init; }
    public int Strength { get; init; }
}
