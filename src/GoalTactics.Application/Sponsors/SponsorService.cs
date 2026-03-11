using GoalTactics.Contracts.Sponsors;
using GoalTactics.Application.Team;

namespace GoalTactics.Application.Sponsors;

public interface ISponsorService
{
    Task<SponsorOffersResponse> GetOffersAsync(string userId, CancellationToken cancellationToken = default);

    Task NegotiateAsync(string userId, Guid offerId, CancellationToken cancellationToken = default);

    Task AcceptAsync(string userId, Guid offerId, CancellationToken cancellationToken = default);
}

public sealed class SponsorService(ITeamStore teamStore) : ISponsorService
{
    public async Task<SponsorOffersResponse> GetOffersAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var baseAmount = Math.Max(25_000L, (long)Math.Round(team.MarketValue / 30m, MidpointRounding.AwayFromZero));
        var mainAmounts = new[]
        {
            new OfferAmountData { Current = baseAmount / 3, Previous = 0 },
            new OfferAmountData { Current = baseAmount * 2, Previous = 0 },
            new OfferAmountData { Current = baseAmount * 3, Previous = 0 }
        };

        var secondaryAmounts = new[]
        {
            new OfferAmountData { Current = Math.Max(5_000L, baseAmount / 8), Previous = 0 },
            new OfferAmountData { Current = Math.Max(2_500L, baseAmount / 16), Previous = 0 },
            new OfferAmountData { Current = Math.Max(1_000L, baseAmount / 32), Previous = 0 }
        };

        return new SponsorOffersResponse
        {
            Success = true,
            NegotiateCost = 100,
            ManagerName = team.Name,
            Main = new SponsorData
            {
                OfferId = Guid.Parse("4ce8e811-3c1a-4cea-9d0e-614e3b164dc1"),
                Name = "Tankstelle Oiltec",
                Description = "Benzin zu fairen und stabil hohen Preisen",
                Date = DateTime.UtcNow.Date.AddDays(30).AddHours(18).ToString("O"),
                Amounts = mainAmounts,
                Stars = 300,
                Cards = 3,
                Accepted = true
            },
            Secondary = new SponsorData
            {
                OfferId = Guid.Parse("c36c62e6-f373-455b-9c6d-e598cc8dd95c"),
                Name = "Fensterreinigung WischWasch",
                Description = "Wir putzen Ihre Fenster bei jedem Wetter, auch Nachts!",
                Date = DateTime.UtcNow.AddDays(3).ToString("O"),
                Amounts = secondaryAmounts,
                Stars = 200,
                Cards = 2,
                Accepted = true
            }
        };
    }

    public async Task NegotiateAsync(string userId, Guid offerId, CancellationToken cancellationToken = default)
    {
        var spent = await teamStore.TrySpendStarsAsync(userId, 100m, cancellationToken);
        if (!spent)
        {
            throw new InvalidOperationException("Insufficient GT Stars.");
        }
    }

    public Task AcceptAsync(string userId, Guid offerId, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }
}
