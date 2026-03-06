using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Ladder;

public sealed class LadderResponse : ResponseObject
{
    public IReadOnlyList<LadderTeamData> Teams { get; init; } = [];

    public string? EndDate { get; init; }

    public Guid LadderId { get; init; }
}
