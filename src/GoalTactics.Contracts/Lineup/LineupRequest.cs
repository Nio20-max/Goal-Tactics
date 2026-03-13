using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Lineup;

public sealed class LineupRequest : RequestObject
{
    public Guid MatchId { get; init; }

    /// <summary>Xamarin client sends match id as Id instead of MatchId.</summary>
    public Guid Id { get; init; }

    /// <summary>Xamarin client sends Friendly flag for friendly match lineups.</summary>
    public bool Friendly { get; init; }

    public Guid ResolvedMatchId => MatchId != Guid.Empty ? MatchId : Id;
}
