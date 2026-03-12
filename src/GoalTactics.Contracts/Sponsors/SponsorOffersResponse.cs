using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Sponsors;

public sealed class SponsorOffersResponse : ResponseObject
{
    // Xamarin / legacy client fields
    public SponsorData? Main { get; init; }
    public SponsorData? Secondary { get; init; }
    public int NegotiateCost { get; init; }
    public string? ManagerName { get; init; }

    // Android / new client field
    public IReadOnlyList<SponsorOfferData> Offers { get; init; } = [];
}

public sealed class SponsorOfferData
{
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public string? Description { get; init; }
    public int Money { get; init; }
    public int Stars { get; init; }
    public int BonusPerWin { get; init; }
    public int BonusPerGoal { get; init; }
    public int ContractDays { get; init; }
    public bool IsActive { get; init; }
    public string? Type { get; init; }
}
