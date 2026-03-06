using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class AccomplishmentsResponse : ResponseObject
{
    public IReadOnlyList<AccomplishmentData> Accomplishments { get; init; } = [];
}
