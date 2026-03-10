using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Sponsors;

public sealed class SponsorOffersResponse : ResponseObject
{
    public SponsorData? Main { get; init; }

    public SponsorData? Secondary { get; init; }

    public int NegotiateCost { get; init; }

    public string? ManagerName { get; init; }
}
