using GoalTactics.Contracts.Sponsors;

namespace GoalTactics.Application.Sponsors;

public interface ISponsorService
{
    Task<SponsorOffersResponse> GetOffersAsync(string userId, CancellationToken cancellationToken = default);

    Task NegotiateAsync(string userId, Guid offerId, CancellationToken cancellationToken = default);

    Task AcceptAsync(string userId, Guid offerId, CancellationToken cancellationToken = default);
}

public sealed class SponsorService : ISponsorService
{
    public Task<SponsorOffersResponse> GetOffersAsync(string userId, CancellationToken cancellationToken = default)
    {
        var stubAmounts = new[]
        {
            new OfferAmountData { Current = 10000, Previous = 0 },
            new OfferAmountData { Current = 5000, Previous = 0 },
            new OfferAmountData { Current = 2500, Previous = 0 }
        };

        return Task.FromResult(new SponsorOffersResponse
        {
            Success = true,
            NegotiateCost = 5,
            ManagerName = "Manager",
            Main = new SponsorData
            {
                OfferId = Guid.NewGuid(),
                Name = "Starter Sponsor",
                Description = "Weekly payout",
                Date = DateTime.UtcNow.AddDays(30).ToString("yyyy-MM-dd"),
                Amounts = stubAmounts,
                Stars = 5,
                Cards = 0,
                Accepted = true
            },
            Secondary = new SponsorData
            {
                OfferId = Guid.NewGuid(),
                Name = "Training Sponsor",
                Description = "Monthly bonus",
                Date = DateTime.UtcNow.AddDays(14).ToString("yyyy-MM-dd"),
                Amounts = stubAmounts,
                Stars = 2,
                Cards = 0,
                Accepted = false
            }
        });
    }

    public Task NegotiateAsync(string userId, Guid offerId, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }

    public Task AcceptAsync(string userId, Guid offerId, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }
}
