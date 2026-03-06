using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class ExtendedTeamDataResponse : ResponseObject
{
    public ExtendedTeamData? TeamData { get; init; }

    public IReadOnlyList<ClubNews>? News { get; init; }

    public string? Season { get; init; }

    public string? SeasonStartDate { get; init; }

    public int Matchday { get; init; }

    public int RenameTeamCost { get; init; }
}
