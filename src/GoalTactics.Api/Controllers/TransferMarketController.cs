using GoalTactics.Api.Extensions;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.TransferMarket;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Transfermarket")]
[Authorize]
public sealed class TransferMarketController(ITransferMarketService transferMarketService) : ControllerBase
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

        return Ok(await transferMarketService.SearchAsync(userId, request, cancellationToken));
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

        return Ok(await transferMarketService.GetDetailsAsync(userId, request.AuctionId, cancellationToken));
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

        await transferMarketService.BidAsync(userId, request, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Bid placed" });
    }

    [HttpPost("UpdateTransfermarketFavourites")]
    [EnableRateLimiting("mutation-write")]
    public async Task<ActionResult<ResponseObject>> UpdateTransfermarketFavourites([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await transferMarketService.UpdateFavoriteAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Updated" });
    }

    [HttpPost("GetTransfermarketFavourites")]
    public async Task<ActionResult<TransferSearchResponse>> GetTransfermarketFavourites([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TransferSearchResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await transferMarketService.GetFavoritesAsync(userId, cancellationToken));
    }
}
