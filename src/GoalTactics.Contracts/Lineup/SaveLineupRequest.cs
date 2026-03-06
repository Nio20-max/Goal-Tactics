using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Lineup;

public sealed class SaveLineupRequest : RequestObject
{
    public Guid MatchId { get; init; }

    public IReadOnlyList<Guid> PlayerIds { get; init; } = [];

    public string? System { get; init; }

    public string? Tactic { get; init; }
}
