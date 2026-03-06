using GoalTactics.Api.Extensions;
using GoalTactics.Application.Live;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Live;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Authorize]
public sealed class LiveController(ILiveService liveService) : ControllerBase
{
    [HttpPost("GetLiveMatch")]
    public async Task<ActionResult<LiveMatchResponse>> GetLiveMatch([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new LiveMatchResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await liveService.GetLiveMatchAsync(userId, request.Id, cancellationToken));
    }

    [HttpPost("GetMatchReport")]
    public async Task<ActionResult<LiveMatchResponse>> GetMatchReport([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new LiveMatchResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await liveService.GetMatchReportAsync(userId, request.Id, cancellationToken));
    }

    [HttpPost("GetMatchDetails")]
    public Task<ActionResult<LiveMatchResponse>> GetMatchDetails([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        return GetMatchReport(request, cancellationToken);
    }
}
