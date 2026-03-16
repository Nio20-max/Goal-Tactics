using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Lineup;

public sealed class SaveLineupRequest : RequestObject
{
    public Guid MatchId { get; init; }

    /// <summary>Xamarin client sends match id as Id instead of MatchId.</summary>
    public Guid Id { get; init; }

    public Guid ResolvedMatchId => MatchId != Guid.Empty ? MatchId : Id;

    public MatchFormationData? FormationData { get; init; }

    public bool Default { get; init; }

    // Backwards-compatible legacy field used by some clients.
    public IReadOnlyList<Guid> PlayerIds { get; init; } = [];

    public string? System { get; init; }

    public string? Tactic { get; init; }
}
