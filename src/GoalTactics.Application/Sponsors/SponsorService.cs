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
        return Task.FromResult(new SponsorOffersResponse
        {
            Success = true,
            Offers =
            [
                new SponsorOfferData
                {
                    Id = Guid.NewGuid(),
                    Name = "Starter Sponsor",
                    Description = "Weekly payout",
                    Money = 10000,
                    Stars = 5
                }
            ]
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
