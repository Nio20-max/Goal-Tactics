using GoalTactics.Application.Common;

namespace GoalTactics.UnitTests.Common;

public sealed class CountryCatalogTests
{
    [Fact]
    public void GetCountries_ReturnsStableCountries()
    {
        var sut = new InMemoryCountryCatalog();

        var countries = sut.GetCountries();

        Assert.True(countries.Count > 3);
        Assert.Contains(countries, c => c.IsoCode == "DE");
        Assert.Contains(countries, c => c.IsoCode == "AT");
        Assert.Contains(countries, c => c.IsoCode == "CH");
    }
}
