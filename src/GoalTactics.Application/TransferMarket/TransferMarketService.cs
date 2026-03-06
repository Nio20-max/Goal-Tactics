using GoalTactics.Contracts.TransferMarket;

namespace GoalTactics.Application.TransferMarket;

public interface ITransferMarketService
{
    Task<TransferSearchResponse> SearchAsync(string userId, TransferSearchRequest request, CancellationToken cancellationToken = default);

    Task<TransferDetailsResponse> GetDetailsAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task BidAsync(string userId, BidRequest request, CancellationToken cancellationToken = default);

    Task UpdateFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task<TransferSearchResponse> GetFavoritesAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class TransferMarketService : ITransferMarketService
{
    public Task<TransferSearchResponse> SearchAsync(string userId, TransferSearchRequest request, CancellationToken cancellationToken = default)
    {
        var player = new TransferPlayerData
        {
            Id = Guid.NewGuid(),
            Name = "Transfer Player",
            Position = "DEF",
            Strength = 66,
            MinimumBid = 20000,
            EndDate = DateTime.UtcNow.AddHours(6).ToString("O")
        };

        return Task.FromResult(new TransferSearchResponse
        {
            Success = true,
            Players = [player]
        });
    }

    public async Task<TransferDetailsResponse> GetDetailsAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        var search = await SearchAsync(userId, new TransferSearchRequest(), cancellationToken);
        var player = search.Players.FirstOrDefault();

        return new TransferDetailsResponse
        {
            Success = true,
            Player = player is null
                ? null
                : new TransferPlayerData
                {
                    Id = id == Guid.Empty ? player.Id : id,
                    Name = player.Name,
                    Position = player.Position,
                    Strength = player.Strength,
                    MinimumBid = player.MinimumBid,
                    EndDate = player.EndDate
                }
        };
    }

    public Task BidAsync(string userId, BidRequest request, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task UpdateFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task<TransferSearchResponse> GetFavoritesAsync(string userId, CancellationToken cancellationToken = default)
    {
        return SearchAsync(userId, new TransferSearchRequest(), cancellationToken);
    }
}
