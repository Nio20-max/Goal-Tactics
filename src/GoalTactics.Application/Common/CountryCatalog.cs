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
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000001"), Name = "Germany", IsoCode = "DE" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000002"), Name = "Austria", IsoCode = "AT" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000003"), Name = "Switzerland", IsoCode = "CH" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000004"), Name = "Netherlands", IsoCode = "NL" }
    ];

    public IReadOnlyList<CountryDto> GetCountries() => Countries;
}
