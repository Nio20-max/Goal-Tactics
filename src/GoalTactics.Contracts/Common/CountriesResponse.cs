namespace GoalTactics.Contracts.Common;

public sealed class CountriesResponse
{
    public required IReadOnlyList<CountryDto> Countries { get; init; }
}
