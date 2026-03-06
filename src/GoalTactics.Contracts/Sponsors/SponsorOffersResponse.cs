using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Sponsors;

public sealed class SponsorOffersResponse : ResponseObject
{
    public IReadOnlyList<SponsorOfferData> Offers { get; init; } = [];
}
