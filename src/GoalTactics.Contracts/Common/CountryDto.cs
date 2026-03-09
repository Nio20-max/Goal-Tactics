namespace GoalTactics.Contracts.Common;

public sealed class CountryDto
{
    public required Guid Id { get; init; }

    public required string Name { get; init; }

    public required string IsoCode { get; init; }

    /// <summary>Legacy app reads "Short" instead of "IsoCode".</summary>
    public string Short => IsoCode;
}
