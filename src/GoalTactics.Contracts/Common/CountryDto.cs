namespace GoalTactics.Contracts.Common;

public sealed class CountryDto
{
    public required int Id { get; init; }

    public required string Name { get; init; }

    public required string IsoCode { get; init; }
}
