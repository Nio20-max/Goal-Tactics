namespace GoalTactics.Contracts.Common;

public sealed class CountriesResponse : ResponseObject
{
    public required IReadOnlyList<CountryDto> Countries { get; init; }
}
