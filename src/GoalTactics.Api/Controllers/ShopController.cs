using GoalTactics.Api.Extensions;
using GoalTactics.Application.Shop;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Shop;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Shop")]
[Route("api/Purchase")]
[Authorize]
public sealed class ShopController(IShopService shopService) : ControllerBase
{
    [HttpPost("GetProducts")]
    public async Task<ActionResult<ShopProductsResponse>> GetProducts([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ShopProductsResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await shopService.GetProductsAsync(userId, cancellationToken));
    }

    [HttpPost("GetEquipment")]
    public async Task<ActionResult<ShopEquipmentResponse>> GetEquipment([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ShopEquipmentResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await shopService.GetEquipmentAsync(userId, cancellationToken));
    }

    [HttpPost("VerifyPurchase")]
    public async Task<ActionResult<ResponseObject>> VerifyPurchase([FromBody] ShopPurchaseVerifyRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await shopService.VerifyPurchaseAsync(userId, request, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Verified" });
    }

    [HttpPost("BuyProduct")]
    public async Task<ActionResult<ResponseObject>> BuyProduct([FromBody] ShopBuyProductRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        var success = request.Id != Guid.Empty
            ? await shopService.BuyProductAsync(userId, request.Id, cancellationToken)
            : !string.IsNullOrWhiteSpace(request.Identifier)
                && await shopService.BuyProductByIdentifierAsync(userId, request.Identifier, cancellationToken);

        if (!success)
        {
            return Ok(new ResponseObject { Success = false, Message = "Purchase failed" });
        }

        return Ok(new ResponseObject { Success = true, Message = "Purchased" });
    }

    [HttpPost("BuyEquipment")]
    public async Task<ActionResult<ResponseObject>> BuyEquipment([FromBody] ShopEquipmentRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        var success = await shopService.BuyEquipmentAsync(userId, request.Id, request.Equipment, request.Cost, cancellationToken);
        if (!success)
        {
            return Ok(new ResponseObject { Success = false, Message = "Purchase failed" });
        }

        return Ok(new ResponseObject { Success = true, Message = "Purchased" });
    }

    [HttpPost("UseEquipment")]
    public async Task<ActionResult<ResponseObject>> UseEquipment([FromBody] ShopEquipmentRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await shopService.UseEquipmentAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Applied" });
    }

    [HttpPost("WatchAd")]
    [HttpPost("ClaimAdReward")]
    public async Task<ActionResult<ResponseObject>> WatchAd([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await shopService.ClaimAdRewardAsync(userId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "100 stars awarded" });
    }
}
