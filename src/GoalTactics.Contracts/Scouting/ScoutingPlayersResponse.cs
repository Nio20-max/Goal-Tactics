using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Squad;

namespace GoalTactics.Contracts.Scouting;

public sealed class ScoutingPlayersResponse : ResponseObject
{
    public IReadOnlyList<SquadPlayerData> Players { get; init; } = [];
    public int ScoutingCost { get; init; }
    public int PremiumScoutingCost { get; init; }
    public int SpeedupCost { get; init; }
    public string? NextScoutingDate { get; init; }
    public string? NextPremiumScoutingDate { get; init; }
    public int PendingScoutCount { get; init; }
    public int MaxSimultaneousScouts { get; init; }
}
