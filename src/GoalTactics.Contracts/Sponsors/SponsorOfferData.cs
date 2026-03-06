namespace GoalTactics.Contracts.Sponsors;

public sealed class SponsorOfferData
{
    public Guid Id { get; init; }

    public string? Name { get; init; }

    public string? Description { get; init; }

    public int Money { get; init; }

    public int Stars { get; init; }
}
