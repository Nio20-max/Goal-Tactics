using GoalTactics.Api.Extensions;
using GoalTactics.Application.Sponsors;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Sponsors;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Authorize]
public sealed class SponsorController(ISponsorService sponsorService) : ControllerBase
{
    [HttpPost("GetSponsorOffers")]
    public async Task<ActionResult<SponsorOffersResponse>> GetSponsorOffers([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new SponsorOffersResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await sponsorService.GetOffersAsync(userId, cancellationToken));
    }

    [HttpPost("NegotiateSponsor")]
    public async Task<ActionResult<ResponseObject>> NegotiateSponsor([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await sponsorService.NegotiateAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Negotiated" });
    }

    [HttpPost("AcceptSponsor")]
    public async Task<ActionResult<ResponseObject>> AcceptSponsor([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await sponsorService.AcceptAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Accepted" });
    }
}
