namespace GoalTactics.Contracts.Sponsors;

public sealed class SponsorData
{
    public Guid OfferId { get; init; }

    public string? Date { get; init; }

    public string? Name { get; init; }

    public string? Description { get; init; }

    public OfferAmountData[] Amounts { get; init; } = [];

    public int Stars { get; init; }

    public int Cards { get; init; }

    public bool Accepted { get; init; }
}

public sealed class OfferAmountData
{
    public long Current { get; init; }

    public long Previous { get; init; }
}
