using GoalTactics.Api.Extensions;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Realtime;
using GoalTactics.Contracts.TransferMarket;
using GoalTactics.Realtime.Hubs;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.AspNetCore.SignalR;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Transfermarket")]
[Authorize]
public sealed class TransferMarketController(
    ITransferMarketService transferMarketService,
    ILogger<TransferMarketController> logger,
    IHubContext<AuctionHub> auctionHub) : ControllerBase
{
    [HttpPost("SearchTransfermarket")]
    [HttpPost("Search")]
    public async Task<ActionResult<TransferSearchResponse>> SearchTransfermarket([FromBody] TransferSearchRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TransferSearchResponse { Success = false, Message = "Invalid token context" });
        }

        try
        {
            return Ok(await transferMarketService.SearchAsync(userId, request, cancellationToken));
        }
        catch (Exception ex)
        {
            logger.LogError(ex, "Transfermarket search failed for user {UserId}", userId);
            return Ok(new TransferSearchResponse
            {
                Success = false,
                Message = "Transfermarket unavailable",
                Players = [],
                Favorites = [],
                Sellings = [],
                MyTeamId = Guid.Empty
            });
        }
    }

    [HttpPost("GetTransferDetails")]
    [HttpPost("GetDetails")]
    public async Task<ActionResult<TransferDetailsResponse>> GetTransferDetails([FromBody] TransferDetailsRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TransferDetailsResponse { Success = false, Message = "Invalid token context" });
        }

        var auctionId = request.ResolvedAuctionId;
        if (auctionId == Guid.Empty)
        {
            return Ok(new TransferDetailsResponse { Success = false, Message = "Invalid transfermarket id" });
        }

        return Ok(await transferMarketService.GetDetailsAsync(userId, auctionId, cancellationToken));
    }

    [HttpPost("GetBid")]
    public async Task<ActionResult<LegacyTransferBidResponse>> GetBid([FromBody] TransferDetailsRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new LegacyTransferBidResponse { Success = false, Message = "Invalid token context" });
        }

        var auctionId = request.ResolvedAuctionId;
        if (auctionId == Guid.Empty)
        {
            return Ok(new LegacyTransferBidResponse { Success = false, Message = "Invalid transfermarket id" });
        }

        var details = await transferMarketService.GetDetailsAsync(userId, auctionId, cancellationToken);
        var player = details.Player;
        return Ok(new LegacyTransferBidResponse
        {
            Success = details.Success,
            Message = details.Message,
            ID = player.AuctionId,
            PlayerID = player.Id,
            TeamID = player.TeamId,
            Offer = player.Offer,
            OfferTeamID = player.OfferTeamId,
            Bid = player.Bid,
            EndDate = player.EndDate,
            BidTeamLogo = player.BidTeamLogo,
            HasUpgrade = false,
            IsSuccessfulBid = false,
            Player = player
        });
    }

    [HttpPost("BidPlayer")]
    [HttpPost("PlaceBid")]
    [EnableRateLimiting("mutation-write")]
    public async Task<ActionResult<ResponseObject>> BidPlayer([FromBody] BidRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        var auctionId = request.ResolvedAuctionId;
        if (auctionId == Guid.Empty)
        {
            return Ok(new ResponseObject { Success = false, Message = "Invalid transfermarket id" });
        }

        try
        {
            await transferMarketService.BidAsync(userId, request, cancellationToken);

            var details = await transferMarketService.GetDetailsAsync(userId, auctionId, cancellationToken);
            var player = details.Player;

            var realtimeBid = new JsonRealtimeBid
            {
                AuctionID = auctionId,
                EndDate = player.EndDate,
                BidTeamId = player.BidTeamId,
                BidTeamName = player.BidTeamName,
                BidTeamLogo = player.BidTeamLogo,
                Bid = player.Bid,
                BidIncrement = player.BidIncrement
            };

            await auctionHub.Clients.All.SendAsync("Bidded", realtimeBid, cancellationToken);

            return Ok(new ResponseObject { Success = true, Message = "Bid placed" });
        }
        catch (InvalidOperationException ex)
        {
            return Ok(new ResponseObject { Success = false, Message = ex.Message });
        }
        catch (Exception ex)
        {
            logger.LogError(ex, "BidPlayer failed for user {UserId} and auction {AuctionId}", userId, auctionId);
            return Ok(new ResponseObject { Success = false, Message = "Bid failed" });
        }
    }

    [HttpPost("UpdateTransfermarketFavourites")]
    [EnableRateLimiting("mutation-write")]
    public async Task<ActionResult<TransferSearchResponse>> UpdateTransfermarketFavourites([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TransferSearchResponse
            {
                Success = false,
                Message = "Invalid token context",
                Players = [],
                Favorites = [],
                Sellings = [],
                MyTeamId = Guid.Empty
            });
        }

        await transferMarketService.UpdateFavoriteAsync(userId, request.Id, cancellationToken);
        var updated = await transferMarketService.GetFavoritesAsync(userId, cancellationToken);
        return Ok(updated);
    }

    [HttpPost("GetTransfermarketFavourites")]
    [HttpPost("GetFavorites")]
    public async Task<ActionResult<TransferSearchResponse>> GetTransfermarketFavourites([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TransferSearchResponse { Success = false, Message = "Invalid token context" });
        }

        try
        {
            return Ok(await transferMarketService.GetFavoritesAsync(userId, cancellationToken));
        }
        catch (Exception ex)
        {
            logger.LogError(ex, "Transfermarket favorites failed for user {UserId}", userId);
            return Ok(new TransferSearchResponse
            {
                Success = false,
                Message = "Transfermarket unavailable",
                Players = [],
                Favorites = [],
                Sellings = [],
                MyTeamId = Guid.Empty
            });
        }
    }

    [HttpPost("AddFavorite")]
    [EnableRateLimiting("mutation-write")]
    public async Task<ActionResult<ResponseObject>> AddFavorite([FromBody] BidRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        if (request.ResolvedAuctionId == Guid.Empty)
        {
            return Ok(new ResponseObject { Success = false, Message = "Invalid transfermarket id" });
        }

        await transferMarketService.AddFavoriteAsync(userId, request.ResolvedAuctionId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Added" });
    }

    [HttpPost("RemoveFavorite")]
    [EnableRateLimiting("mutation-write")]
    public async Task<ActionResult<ResponseObject>> RemoveFavorite([FromBody] BidRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        if (request.ResolvedAuctionId == Guid.Empty)
        {
            return Ok(new ResponseObject { Success = false, Message = "Invalid transfermarket id" });
        }

        await transferMarketService.RemoveFavoriteAsync(userId, request.ResolvedAuctionId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Removed" });
    }

    [HttpPost("SellPlayer")]
    [HttpPost("ListPlayer")]
    [EnableRateLimiting("mutation-write")]
    public async Task<ActionResult<ResponseObject>> SellPlayer([FromBody] SellPlayerRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        try
        {
            var auctionId = await transferMarketService.ListPlayerForSaleAsync(userId, request, cancellationToken);
            var message = auctionId == Guid.Empty
                ? "Player sold directly"
                : $"Player listed with auction {auctionId}";
            return Ok(new ResponseObject { Success = true, Message = message });
        }
        catch (InvalidOperationException ex)
        {
            return Ok(new ResponseObject { Success = false, Message = ex.Message });
        }
        catch (Exception ex)
        {
            logger.LogError(ex, "SellPlayer failed for user {UserId}", userId);
            return Ok(new ResponseObject { Success = false, Message = "Could not list player" });
        }
    }
}
