using GoalTactics.Contracts.TransferMarket;
using GoalTactics.Application.Team;

namespace GoalTactics.Application.TransferMarket;

public interface ITransferMarketService
{
    Task<TransferSearchResponse> SearchAsync(string userId, TransferSearchRequest request, CancellationToken cancellationToken = default);

    Task<TransferDetailsResponse> GetDetailsAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task BidAsync(string userId, BidRequest request, CancellationToken cancellationToken = default);

    Task UpdateFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task AddFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task RemoveFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task<TransferSearchResponse> GetFavoritesAsync(string userId, CancellationToken cancellationToken = default);

    Task<Guid> ListPlayerForSaleAsync(string userId, SellPlayerRequest request, CancellationToken cancellationToken = default);
}

public sealed class TransferMarketService(ITeamStore teamStore, IAuctionStore auctionStore) : ITransferMarketService
{
    private const int BidStarsCost = 200;
    private const int MinimumSystemAuctions = 10;
    private const long StartBidIncrement = 5000;
    private const long MaxBidIncrement = 150000;
    private const long MaxBidForIncrement = 5_500_000;

    public async Task<TransferSearchResponse> SearchAsync(string userId, TransferSearchRequest request, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var myTeamId = Guid.TryParse(team.TeamId, out var tid) ? tid : Guid.Empty;

        await auctionStore.EnsureSystemAuctionsAsync(MinimumSystemAuctions, cancellationToken);

        // Return all matching auctions in one response. The old client API could page, but we now return everything in one go.
        // Keep pagination metadata for compatibility, but always indicate a single page.
        var (players, totalCount) = await auctionStore.SearchAsync(request, cancellationToken);
        var favorites = await auctionStore.GetFavoritesAsync(userId, cancellationToken);
        var sellings = await auctionStore.GetSellingsAsync(team.TeamId, cancellationToken);

        return new TransferSearchResponse
        {
            Success = true,
            Players = players,
            Favorites = favorites,
            Sellings = sellings,
            MyTeamId = myTeamId,
            TotalCount = totalCount,
            CurrentPage = 1,
            TotalPages = 1
        };
    }

    public async Task<TransferDetailsResponse> GetDetailsAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var myTeamId = Guid.TryParse(team.TeamId, out var tid) ? tid : Guid.Empty;

        var player = await auctionStore.GetAuctionAsync(id, cancellationToken);
        if (player is null)
        {
            var emptyAuction = CreateFallbackAuctionPlayer(id);
            var emptyPlayer = CreateFallbackExtendedPlayer(id);
            return new TransferDetailsResponse
            {
                Success = false,
                Message = "Auction not found",
                BidCost = BidStarsCost,
                MyTeamId = myTeamId,
                Player = emptyPlayer,
                AuctionPlayer = emptyAuction
            };
        }

        var mappedAuction = MapToAuctionPlayer(player);
        var mappedPlayer = MapToExtendedPlayer(player);

        return new TransferDetailsResponse
        {
            Success = true,
            BidCost = BidStarsCost,
            MyTeamId = myTeamId,
            Player = mappedPlayer,
            AuctionPlayer = mappedAuction
        };
    }

    public async Task BidAsync(string userId, BidRequest request, CancellationToken cancellationToken = default)
    {
        var auctionId = request.ResolvedAuctionId;
        if (auctionId == Guid.Empty)
            throw new InvalidOperationException("Auction id is required.");

        long bidAmount;
        if (request.Bid > 0)
        {
            bidAmount = request.Bid;
        }
        else
        {
            var auction = await auctionStore.GetAuctionAsync(auctionId, cancellationToken);
            if (auction is null)
            {
                throw new InvalidOperationException("Auction was not found.");
            }

            var currentBid = Math.Max(auction.Bid, 1);
            bidAmount = currentBid + CalculateBidIncrement(currentBid);
        }

        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        var spent = await teamStore.TrySpendStarsAsync(userId, BidStarsCost, cancellationToken);
        if (!spent)
            throw new InvalidOperationException("Bidding on a player costs 200 GT Stars.");

        var accepted = await auctionStore.PlaceBidAsync(
            auctionId,
            team.TeamId,
            team.Name,
            null,
            bidAmount,
            cancellationToken);

        if (!accepted)
            throw new InvalidOperationException("Bid was not accepted. It may be too low or the auction has ended.");
    }

    public async Task UpdateFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        await auctionStore.ToggleFavoriteAsync(userId, id, cancellationToken);
    }

    public async Task AddFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        var favorites = await auctionStore.GetFavoritesAsync(userId, cancellationToken);
        if (favorites.Any(x => x.AuctionId == id))
        {
            return;
        }

        await auctionStore.ToggleFavoriteAsync(userId, id, cancellationToken);
    }

    public async Task RemoveFavoriteAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        var favorites = await auctionStore.GetFavoritesAsync(userId, cancellationToken);
        if (favorites.All(x => x.AuctionId != id))
        {
            return;
        }

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
        if (request.ResolvedPlayerId == Guid.Empty)
            throw new InvalidOperationException("Player id is required.");

        if (request.ResolvedMinimumBid <= 0)
            throw new InvalidOperationException("Minimum bid must be positive.");

        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);

        var durationHours = Math.Clamp(request.ResolvedDurationHours, 1, 24);
        var auctionId = await auctionStore.ListPlayerAsync(
            team.TeamId,
            request.ResolvedPlayerId.ToString("N"),
            request.ResolvedMinimumBid,
            TimeSpan.FromHours(durationHours),
            cancellationToken);

        return auctionId;
    }

    private static TransferAuctionPlayerData CreateFallbackAuctionPlayer(Guid auctionId)
    {
        return new TransferAuctionPlayerData
        {
            Id = auctionId,
            AuctionId = auctionId,
            Name = string.Empty,
            EndDate = DateTime.UtcNow.ToString("O"),
            Bid = 0,
            BidIncrement = StartBidIncrement,
            MainSkill = 0,
            BonusSkills = [1, 13, 13, 12],
            SellPrice = 0,
            TransfermarketFee = 0,
            TransfermarketMaxOffer = 0,
            TransfermarketMinOffer = 0,
            TransfermarketMaxHours = 48,
            CanExtendContract = false,
            HasIndividualTraining = false
        };
    }

    private static TransferExtendedPlayerData CreateFallbackExtendedPlayer(Guid auctionId)
    {
        return new TransferExtendedPlayerData
        {
            Id = auctionId,
            AuctionId = auctionId,
            EndDate = DateTime.UtcNow.ToString("O"),
            Bid = 0,
            BidIncrement = StartBidIncrement,
            Offer = 0,
            OfferTeamId = Guid.Empty,
            BidTeamId = Guid.Empty,
            IsFavorite = false,
            IsFrozen = false
        };
    }

    private static TransferAuctionPlayerData MapToAuctionPlayer(TransferPlayerData player)
    {
        var mainSkill = player.Position switch
        {
            0 => 1,
            4 => 3,
            6 => 2,
            _ => 0
        };

        var baseSkill = Math.Max(1m, Math.Round(player.Strength, 0));
        var skills = new[]
        {
            baseSkill, baseSkill, baseSkill, baseSkill, baseSkill, baseSkill, baseSkill,
            baseSkill, baseSkill, baseSkill, baseSkill, baseSkill, baseSkill, baseSkill
        };

        return new TransferAuctionPlayerData
        {
            Id = player.Id,
            TeamId = Guid.Empty,
            Name = player.Name,
            CustomName = string.Empty,
            Age = player.Age,
            Talent = player.Talent,
            Position = player.Position,
            Strength = player.Strength,
            Country = player.Country,
            Head = player.Head,
            IsFrozen = player.IsFrozen,
            AuctionId = player.AuctionId,
            Bid = player.Bid,
            BidIncrement = CalculateBidIncrement(player.Bid),
            Offer = player.Bid,
            OfferTeamId = Guid.Empty,
            EndDate = player.EndDate,
            BidTeamId = Guid.Empty,
            BidTeamName = player.BidTeamName,
            BidTeamLogo = player.BidTeamLogo,
            OfferTeamName = string.Empty,
            OfferTeamTrikot = "trikot0",
            OfferTeamLogo = string.Empty,
            IsFavorite = false,
            Experience = 0,
            Fitness = 100,
            Body = "01_body-A00",
            Gloves = "01_Gloves01",
            Shoes = "01_Shoes01",
            Salary = 0,
            MarketValue = player.Bid,
            Origin = player.Country,
            Skills = skills,
            MainSkill = mainSkill,
            BonusSkills = [1, 13, 13, 12],
            YellowCards = 0,
            HasRedCard = false,
            Injured = 0,
            IsForSale = true,
            SellPrice = player.Bid,
            TransfermarketFee = 0,
            TransfermarketMaxOffer = player.Bid,
            TransfermarketMinOffer = player.Bid,
            TransfermarketMaxHours = 48,
            IsUpgraded = false,
            MaxUpgradeStrength = player.Strength,
            Shirt = -1,
            CanExtendContract = false,
            HasIndividualTraining = false
        };
    }

    private static TransferExtendedPlayerData MapToExtendedPlayer(TransferPlayerData player)
    {
        return new TransferExtendedPlayerData
        {
            Id = player.Id,
            TeamId = Guid.Empty,
            Name = player.Name,
            CustomName = string.Empty,
            AuctionId = player.AuctionId,
            Bid = player.Bid,
            BidIncrement = CalculateBidIncrement(player.Bid),
            Offer = player.Bid,
            OfferTeamId = Guid.Empty,
            EndDate = player.EndDate,
            BidTeamId = Guid.Empty,
            BidTeamName = player.BidTeamName,
            BidTeamLogo = player.BidTeamLogo,
            IsFavorite = false,
            IsFrozen = player.IsFrozen
        };
    }

    private static long CalculateBidIncrement(decimal currentBid)
    {
        var boundedBid = decimal.Clamp(currentBid, 0m, MaxBidForIncrement);
        var scaled = StartBidIncrement + (boundedBid / MaxBidForIncrement) * (MaxBidIncrement - StartBidIncrement);
        var rounded = Math.Round(scaled / 100m, MidpointRounding.AwayFromZero) * 100m;
        return (long)decimal.Clamp(rounded, StartBidIncrement, MaxBidIncrement);
    }
}
