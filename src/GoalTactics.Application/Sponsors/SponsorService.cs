using GoalTactics.Contracts.Sponsors;
using GoalTactics.Application.Team;

namespace GoalTactics.Application.Sponsors;

public interface ISponsorService
{
    Task<SponsorOffersResponse> GetOffersAsync(string userId, CancellationToken cancellationToken = default);

    Task NegotiateAsync(string userId, Guid offerId, CancellationToken cancellationToken = default);

    Task AcceptAsync(string userId, Guid offerId, CancellationToken cancellationToken = default);
}

public sealed class SponsorService(ITeamStore teamStore, ISponsorStore sponsorStore) : ISponsorService
{
    private const int NegotiateCost = 100;
    private const int MainContractDays = 30;
    private const int SecondaryContractDays = 14;

    private static readonly string[] MainSponsorNames =
    [
        "Tankstelle Oiltec", "AutoHaus Krüger", "Stadtwerke Energie", "TechVision GmbH",
        "Brauerei Goldkrone", "Möbelhaus Komfort", "Reisebüro Fernweh", "Versicherung Sicher+"
    ];

    private static readonly string[] MainSponsorDescriptions =
    [
        "Benzin zu fairen und stabil hohen Preisen",
        "Ihr Autohaus des Vertrauens seit 1985",
        "Grüne Energie für alle",
        "Innovation trifft Tradition",
        "Das Bier mit Charakter",
        "Wohnen mit Stil",
        "Die Welt entdecken",
        "Sicherheit für Ihre Zukunft"
    ];

    private static readonly string[] SecondarySponsorNames =
    [
        "Fensterreinigung WischWasch", "Pizza Express Luigi", "Blumen Paradies",
        "Fitness Studio PowerFit", "Bäckerei Sonnenschein", "Druckerei Farbklecks",
        "Tierhandlung Fell & Feder", "Eiscafé Dolce Vita"
    ];

    private static readonly string[] SecondarySponsorDescriptions =
    [
        "Wir putzen Ihre Fenster bei jedem Wetter, auch Nachts!",
        "Echte italienische Pizza — schnell geliefert",
        "Blumengrüße für jeden Anlass",
        "Werden Sie fit mit uns!",
        "Frisch gebacken seit Generationen",
        "Druck in Perfektion",
        "Alles für Ihr Haustier",
        "Das beste Eis der Stadt"
    ];

    public async Task<SponsorOffersResponse> GetOffersAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var activeContracts = await sponsorStore.GetActiveContractsAsync(team.TeamId, cancellationToken);

        var mainContract = activeContracts.FirstOrDefault(c => c.Type == "Main");
        var secondaryContract = activeContracts.FirstOrDefault(c => c.Type == "Secondary");

        // Generate deterministic offers based on team id + day seed (offers rotate daily when no contract)
        var daySeed = DateTime.UtcNow.DayOfYear + DateTime.UtcNow.Year * 1000;
        var seed = HashCode.Combine(team.TeamId, "sponsor", daySeed);
        var rng = new Random(seed);

        var strengthFactor = 1.0 + (double)team.Strength / 100.0;

        var mainBaseMoney = (long)(rng.Next(50_000, 300_001) * strengthFactor);
        var mainBonusPerWin = (long)(rng.Next(10_000, 50_001) * strengthFactor);
        var mainBonusPerGoal = (long)(rng.Next(5_000, 20_001) * strengthFactor);
        var mainStars = 300;
        var mainIdx = rng.Next(MainSponsorNames.Length);

        var secondaryBaseMoney = (long)(rng.Next(30_000, 100_001) * strengthFactor);
        var secondaryBonusPerWin = (long)(rng.Next(5_000, 20_001) * strengthFactor);
        var secondaryBonusPerGoal = (long)(rng.Next(2_000, 10_001) * strengthFactor);
        var secondaryStars = 200;
        var secondaryIdx = rng.Next(SecondarySponsorNames.Length);

        // Use deterministic IDs so clients can reference them
        var mainId = GenerateOfferId(team.TeamId, "Main", daySeed);
        var secondaryId = GenerateOfferId(team.TeamId, "Secondary", daySeed);

        // Build legacy Xamarin amounts
        var mainAmounts = new[]
        {
            new OfferAmountData { Current = mainBaseMoney / 3, Previous = 0 },
            new OfferAmountData { Current = mainBaseMoney * 2, Previous = 0 },
            new OfferAmountData { Current = mainBaseMoney * 3, Previous = 0 }
        };

        var secondaryAmounts = new[]
        {
            new OfferAmountData { Current = Math.Max(5_000L, secondaryBaseMoney / 8), Previous = 0 },
            new OfferAmountData { Current = Math.Max(2_500L, secondaryBaseMoney / 16), Previous = 0 },
            new OfferAmountData { Current = Math.Max(1_000L, secondaryBaseMoney / 32), Previous = 0 }
        };

        var mainName = MainSponsorNames[mainIdx];
        var mainDesc = MainSponsorDescriptions[mainIdx];
        var secondaryName = SecondarySponsorNames[secondaryIdx];
        var secondaryDesc = SecondarySponsorDescriptions[secondaryIdx];

        // If the team already has an active contract, show contract info instead of offer
        var mainEndDate = mainContract?.EndDateUtc ?? DateTime.UtcNow.Date.AddDays(MainContractDays).AddHours(18);
        var secondaryEndDate = secondaryContract?.EndDateUtc ?? DateTime.UtcNow.Date.AddDays(SecondaryContractDays).AddHours(18);

        return new SponsorOffersResponse
        {
            Success = true,
            NegotiateCost = NegotiateCost,
            ManagerName = team.Name,
            // Xamarin / legacy client
            Main = new SponsorData
            {
                OfferId = mainContract is not null ? Guid.Parse(mainContract.Id) : mainId,
                Name = mainContract?.SponsorName ?? mainName,
                Description = mainContract?.SponsorDescription ?? mainDesc,
                Date = mainEndDate.ToString("O"),
                Amounts = mainAmounts,
                Stars = mainContract?.StarsPayout ?? mainStars,
                Cards = 3,
                Accepted = mainContract is not null
            },
            Secondary = new SponsorData
            {
                OfferId = secondaryContract is not null ? Guid.Parse(secondaryContract.Id) : secondaryId,
                Name = secondaryContract?.SponsorName ?? secondaryName,
                Description = secondaryContract?.SponsorDescription ?? secondaryDesc,
                Date = secondaryEndDate.ToString("O"),
                Amounts = secondaryAmounts,
                Stars = secondaryContract?.StarsPayout ?? secondaryStars,
                Cards = 2,
                Accepted = secondaryContract is not null
            },
            // Android / new client
            Offers =
            [
                new SponsorOfferData
                {
                    Id = mainContract is not null ? Guid.Parse(mainContract.Id) : mainId,
                    Name = mainContract?.SponsorName ?? mainName,
                    Description = mainContract?.SponsorDescription ?? mainDesc,
                    Money = (int)Math.Min(mainContract?.BaseMoney ?? mainBaseMoney, int.MaxValue),
                    Stars = mainContract?.StarsPayout ?? mainStars,
                    BonusPerWin = (int)Math.Min(mainContract?.BonusPerWin ?? mainBonusPerWin, int.MaxValue),
                    BonusPerGoal = (int)Math.Min(mainContract?.BonusPerGoal ?? mainBonusPerGoal, int.MaxValue),
                    ContractDays = mainContract is not null ? (int)(mainContract.EndDateUtc - DateTime.UtcNow).TotalDays : MainContractDays,
                    IsActive = mainContract is not null,
                    Type = "Main"
                },
                new SponsorOfferData
                {
                    Id = secondaryContract is not null ? Guid.Parse(secondaryContract.Id) : secondaryId,
                    Name = secondaryContract?.SponsorName ?? secondaryName,
                    Description = secondaryContract?.SponsorDescription ?? secondaryDesc,
                    Money = (int)Math.Min(secondaryContract?.BaseMoney ?? secondaryBaseMoney, int.MaxValue),
                    Stars = secondaryContract?.StarsPayout ?? secondaryStars,
                    BonusPerWin = (int)Math.Min(secondaryContract?.BonusPerWin ?? secondaryBonusPerWin, int.MaxValue),
                    BonusPerGoal = (int)Math.Min(secondaryContract?.BonusPerGoal ?? secondaryBonusPerGoal, int.MaxValue),
                    ContractDays = secondaryContract is not null ? (int)(secondaryContract.EndDateUtc - DateTime.UtcNow).TotalDays : SecondaryContractDays,
                    IsActive = secondaryContract is not null,
                    Type = "Secondary"
                }
            ]
        };
    }

    public async Task NegotiateAsync(string userId, Guid offerId, CancellationToken cancellationToken = default)
    {
        var spent = await teamStore.TrySpendStarsAsync(userId, NegotiateCost, cancellationToken);
        if (!spent)
        {
            throw new InvalidOperationException("Insufficient GT Stars.");
        }
        // Negotiation spends stars; the next GetOffers call uses a different seed so amounts may improve
    }

    public async Task AcceptAsync(string userId, Guid offerId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        // Regenerate the offer to validate & get amounts
        var daySeed = DateTime.UtcNow.DayOfYear + DateTime.UtcNow.Year * 1000;
        var seed = HashCode.Combine(team.TeamId, "sponsor", daySeed);
        var rng = new Random(seed);

        var strengthFactor = 1.0 + (double)team.Strength / 100.0;

        var mainBaseMoney = (long)(rng.Next(50_000, 300_001) * strengthFactor);
        var mainBonusPerWin = (long)(rng.Next(10_000, 50_001) * strengthFactor);
        var mainBonusPerGoal = (long)(rng.Next(5_000, 20_001) * strengthFactor);
        var mainStars = 300;
        var mainIdx = rng.Next(MainSponsorNames.Length);

        var secondaryBaseMoney = (long)(rng.Next(30_000, 100_001) * strengthFactor);
        var secondaryBonusPerWin = (long)(rng.Next(5_000, 20_001) * strengthFactor);
        var secondaryBonusPerGoal = (long)(rng.Next(2_000, 10_001) * strengthFactor);
        var secondaryStars = 200;
        var secondaryIdx = rng.Next(SecondarySponsorNames.Length);

        var mainId = GenerateOfferId(team.TeamId, "Main", daySeed);
        var secondaryId = GenerateOfferId(team.TeamId, "Secondary", daySeed);

        var now = DateTime.UtcNow;

        if (offerId == mainId)
        {
            await sponsorStore.CreateContractAsync(
                team.TeamId, "Main",
                MainSponsorNames[mainIdx], MainSponsorDescriptions[mainIdx],
                mainBaseMoney, mainBonusPerWin, mainBonusPerGoal, mainStars,
                now, now.AddDays(MainContractDays), cancellationToken);
        }
        else if (offerId == secondaryId)
        {
            await sponsorStore.CreateContractAsync(
                team.TeamId, "Secondary",
                SecondarySponsorNames[secondaryIdx], SecondarySponsorDescriptions[secondaryIdx],
                secondaryBaseMoney, secondaryBonusPerWin, secondaryBonusPerGoal, secondaryStars,
                now, now.AddDays(SecondaryContractDays), cancellationToken);
        }
        else
        {
            throw new InvalidOperationException("Invalid offer ID.");
        }
    }

    private static Guid GenerateOfferId(string teamId, string type, int daySeed)
    {
        var hash = HashCode.Combine(teamId, type, daySeed, "offer");
        var bytes = new byte[16];
        BitConverter.TryWriteBytes(bytes, hash);
        BitConverter.TryWriteBytes(bytes.AsSpan(4), HashCode.Combine(hash, teamId));
        BitConverter.TryWriteBytes(bytes.AsSpan(8), HashCode.Combine(hash, type));
        BitConverter.TryWriteBytes(bytes.AsSpan(12), daySeed);
        return new Guid(bytes);
    }
}
