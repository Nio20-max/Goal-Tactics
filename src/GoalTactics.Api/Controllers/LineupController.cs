using GoalTactics.Api.Extensions;
using GoalTactics.Application.Lineup;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Lineup;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Lineup")]
[Authorize]
public sealed class LineupController(ILineupService lineupService) : ControllerBase
{
    [HttpPost("GetLineups")]
    public async Task<ActionResult<LineupsResponse>> GetLineups([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new LineupsResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await lineupService.GetLineupsAsync(userId, cancellationToken));
    }

    [HttpPost("GetMatchLineup")]
    [HttpPost("GetMatchFormation")]
    public async Task<ActionResult<MatchLineupResponse>> GetMatchLineup([FromBody] LineupRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new MatchLineupResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await lineupService.GetMatchLineupAsync(userId, request.ResolvedMatchId, cancellationToken));
    }

    [HttpPost("SaveLineup")]
    public async Task<ActionResult<ResponseObject>> SaveLineup([FromBody] SaveLineupRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await lineupService.SaveLineupAsync(userId, request, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Saved" });
    }
}
