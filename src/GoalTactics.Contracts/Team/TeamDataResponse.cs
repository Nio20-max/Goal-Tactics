using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class TeamDataResponse : ResponseObject
{
    public TeamData? TeamData { get; init; }
}
