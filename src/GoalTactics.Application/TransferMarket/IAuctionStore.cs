using GoalTactics.Contracts.TransferMarket;

namespace GoalTactics.Application.TransferMarket;

public interface IAuctionStore
{
    /// <summary>Search active auctions with filters. Uses Page/PageSize from request for pagination.</summary>
    Task<(IReadOnlyList<TransferPlayerData> Items, int TotalCount)> SearchAsync(TransferSearchRequest request, CancellationToken ct = default);

    /// <summary>Get a single auction by its ID.</summary>
    Task<TransferPlayerData?> GetAuctionAsync(Guid auctionId, CancellationToken ct = default);

    /// <summary>Place a bid; returns true if accepted. Extends the timer if &lt;20 s remain.</summary>
    Task<bool> PlaceBidAsync(Guid auctionId, string teamId, string teamName, string? teamLogo, long amount, CancellationToken ct = default);

    /// <summary>Get auctions favourited by the user.</summary>
    Task<IReadOnlyList<TransferPlayerData>> GetFavoritesAsync(string userId, CancellationToken ct = default);

    /// <summary>Toggle favourite status.</summary>
    Task ToggleFavoriteAsync(string userId, Guid auctionId, CancellationToken ct = default);

    /// <summary>Get auctions where the seller is the user's team (their listed players).</summary>
    Task<IReadOnlyList<TransferPlayerData>> GetSellingsAsync(string teamId, CancellationToken ct = default);

    /// <summary>Settle expired auctions: transfer player to winning bidder or return to seller.</summary>
    Task<int> SettleExpiredAuctionsAsync(CancellationToken ct = default);

    /// <summary>List a player for sale by a team.</summary>
    Task<Guid> ListPlayerAsync(string sellerTeamId, string playerId, long minimumBid, TimeSpan duration, CancellationToken ct = default);

    /// <summary>Ensure the market has at least <paramref name="minimumCount"/> active system auctions; generates new ones if needed.</summary>
    Task EnsureSystemAuctionsAsync(int minimumCount, CancellationToken ct = default);
}
