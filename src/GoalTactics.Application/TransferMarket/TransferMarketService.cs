using GoalTactics.Contracts.TransferMarket;
using GoalTactics.Application.Team;

namespace GoalTactics.Application.TransferMarket;

public interface ITransferMarketService
{
    Task<TransferSearchResponse> SearchAsync(string userId, TransferSearchRequest request, CancellationToken cancellationToken = default);

    Task<TransferDetailsResponse> GetDetailsAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task BidAsync(string userId, BidRequest request, CancellationToken cancellationToken = default);

    Task UpdateFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task<TransferSearchResponse> GetFavoritesAsync(string userId, CancellationToken cancellationToken = default);

    Task<Guid> ListPlayerForSaleAsync(string userId, SellPlayerRequest request, CancellationToken cancellationToken = default);
}

public sealed class TransferMarketService(ITeamStore teamStore, IAuctionStore auctionStore) : ITransferMarketService
{
    private const int BidStarsCost = 200;
    private const int MinimumSystemAuctions = 10;

    public async Task<TransferSearchResponse> SearchAsync(string userId, TransferSearchRequest request, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var myTeamId = Guid.TryParse(team.TeamId, out var tid) ? tid : Guid.Empty;

        // Ensure there are enough system auctions on the market
        await auctionStore.EnsureSystemAuctionsAsync(MinimumSystemAuctions, cancellationToken);

        var (players, totalCount) = await auctionStore.SearchAsync(request, cancellationToken);
        var favorites = await auctionStore.GetFavoritesAsync(userId, cancellationToken);
        var sellings = await auctionStore.GetSellingsAsync(team.TeamId, cancellationToken);

        var pageSize = request.SafePageSize;

        return new TransferSearchResponse
        {
            Success = true,
            Players = players,
            Favorites = favorites,
            Sellings = sellings,
            MyTeamId = myTeamId,
            TotalCount = totalCount,
            CurrentPage = request.SafePage,
            TotalPages = (int)Math.Ceiling((double)totalCount / pageSize)
        };
    }

    public async Task<TransferDetailsResponse> GetDetailsAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var myTeamId = Guid.TryParse(team.TeamId, out var tid) ? tid : Guid.Empty;

        var player = await auctionStore.GetAuctionAsync(id, cancellationToken);

        return new TransferDetailsResponse
        {
            Success = true,
            BidCost = BidStarsCost,
            MyTeamId = myTeamId,
            Player = player,
            AuctionPlayer = player
        };
    }

    public async Task BidAsync(string userId, BidRequest request, CancellationToken cancellationToken = default)
    {
        if (request.Bid <= 0)
            throw new InvalidOperationException("Bid must be positive.");

        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        // Charge GT Stars for placing a bid
        var spent = await teamStore.TrySpendStarsAsync(userId, BidStarsCost, cancellationToken);
        if (!spent)
            throw new InvalidOperationException("Bidding on a player costs 200 GT Stars.");

        // Place the actual bid in the auction store
        var accepted = await auctionStore.PlaceBidAsync(
            request.Id,
            team.TeamId,
            team.Name,
            null,
            request.Bid,
            cancellationToken);

        if (!accepted)
            throw new InvalidOperationException("Bid was not accepted. It may be too low or the auction has ended.");
    }

    public async Task UpdateFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        await auctionStore.ToggleFavoriteAsync(userId, id, cancellationToken);
    }

    public async Task<TransferSearchResponse> GetFavoritesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var myTeamId = Guid.TryParse(team.TeamId, out var tid) ? tid : Guid.Empty;

        var favorites = await auctionStore.GetFavoritesAsync(userId, cancellationToken);

        return new TransferSearchResponse
        {
            Success = true,
            Players = favorites,
            Favorites = favorites,
            Sellings = [],
            MyTeamId = myTeamId
        };
    }

    public async Task<Guid> ListPlayerForSaleAsync(string userId, SellPlayerRequest request, CancellationToken cancellationToken = default)
    {
        if (request.MinimumBid <= 0)
            throw new InvalidOperationException("Minimum bid must be positive.");

        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        var durationHours = Math.Clamp(request.DurationHours, 1, 24);
        var auctionId = await auctionStore.ListPlayerAsync(
            team.TeamId,
            request.PlayerId.ToString("N"),
            request.MinimumBid,
            TimeSpan.FromHours(durationHours),
            cancellationToken);

        return auctionId;
    }
}
