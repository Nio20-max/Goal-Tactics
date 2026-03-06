using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class ClubNewsResponse : ResponseObject
{
    public IReadOnlyList<ClubNews> News { get; init; } = [];
}
