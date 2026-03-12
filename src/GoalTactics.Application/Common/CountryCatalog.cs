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
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000001"), Name = "Frankreich", IsoCode = "FR" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000002"), Name = "Schweden", IsoCode = "SE" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000003"), Name = "Portugal", IsoCode = "PT" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000004"), Name = "T\u00fcrkei", IsoCode = "TR" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000005"), Name = "Belgien", IsoCode = "BE" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000006"), Name = "Uruguay", IsoCode = "UY" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000007"), Name = "Saudi Arabien", IsoCode = "SA" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000008"), Name = "Mexiko", IsoCode = "MX" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000009"), Name = "Deutschland", IsoCode = "DE" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000010"), Name = "Ecuador", IsoCode = "EC" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000011"), Name = "Gro\u00dfbritannien", IsoCode = "GB" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000012"), Name = "Argentinien", IsoCode = "AR" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000013"), Name = "Schweiz", IsoCode = "CH" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000014"), Name = "Spanien", IsoCode = "ES" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000015"), Name = "Ungarn", IsoCode = "HU" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000016"), Name = "\u00d6sterreich", IsoCode = "AT" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000017"), Name = "Brasilien", IsoCode = "BR" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000018"), Name = "Lettland", IsoCode = "LV" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000019"), Name = "Finnland", IsoCode = "FI" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000020"), Name = "Irland", IsoCode = "IE" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000021"), Name = "Tschechische Republik", IsoCode = "CZ" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000022"), Name = "Luxemburg", IsoCode = "LU" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000023"), Name = "Zypern", IsoCode = "CY" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000024"), Name = "D\u00e4nemark", IsoCode = "DK" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000025"), Name = "Columbia", IsoCode = "CO" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000026"), Name = "Estland", IsoCode = "EE" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000027"), Name = "Bulgarien", IsoCode = "BG" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000028"), Name = "Honduras", IsoCode = "HN" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000029"), Name = "Costa Rica", IsoCode = "CR" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000030"), Name = "Slovenien", IsoCode = "SI" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000031"), Name = "Slowakei", IsoCode = "SK" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000032"), Name = "Malta", IsoCode = "MT" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000033"), Name = "Polen", IsoCode = "PL" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000034"), Name = "Litauen", IsoCode = "LT" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000035"), Name = "Niederlande", IsoCode = "NL" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000036"), Name = "Griechenland", IsoCode = "EL" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000037"), Name = "Italien", IsoCode = "IT" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000038"), Name = "Rum\u00e4nien", IsoCode = "RO" },
        new CountryDto { Id = Guid.Parse("00000000-0000-0000-0000-000000000039"), Name = "Chile", IsoCode = "CL" }
    ];

    public IReadOnlyList<CountryDto> GetCountries() => Countries;
}
