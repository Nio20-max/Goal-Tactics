using GoalTactics.Api.Extensions;
using GoalTactics.Application.Sponsors;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Sponsors;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Sponsor")]
[Authorize]
public sealed class SponsorController(ISponsorService sponsorService) : ControllerBase
{
    [HttpPost("GetSponsorOffers")]
    [HttpPost("GetSponsors")]
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
    [HttpPost("Negotiate")]
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
    [HttpPost("Accept")]
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
