using GoalTactics.Api.Extensions;
using GoalTactics.Application.League;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.League;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Authorize]
public sealed class LeagueController(ILeagueService leagueService) : ControllerBase
{
    [HttpPost("GetLeagueTable")]
    public async Task<ActionResult<LeagueTableResponse>> GetLeagueTable([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new LeagueTableResponse { Success = false, Message = "Invalid token context" });
        }

        var response = await leagueService.GetLeagueTableAsync(userId, request.Id, cancellationToken);
        return Ok(response);
    }
}
