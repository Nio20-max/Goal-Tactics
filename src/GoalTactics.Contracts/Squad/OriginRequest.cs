using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class OriginRequest : IdRequest
{
    public Guid CountryId { get; init; }
}