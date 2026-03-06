using GoalTactics.Contracts.Common;

namespace GoalTactics.Application.Common;

public interface ICountryCatalog
{
    IReadOnlyList<CountryDto> GetCountries();
}

public sealed class InMemoryCountryCatalog : ICountryCatalog
{
    private static readonly IReadOnlyList<CountryDto> Countries =
    [
        new CountryDto { Id = 1, Name = "Germany", IsoCode = "DE" },
        new CountryDto { Id = 2, Name = "Austria", IsoCode = "AT" },
        new CountryDto { Id = 3, Name = "Switzerland", IsoCode = "CH" },
        new CountryDto { Id = 4, Name = "Netherlands", IsoCode = "NL" }
    ];

    public IReadOnlyList<CountryDto> GetCountries() => Countries;
}
