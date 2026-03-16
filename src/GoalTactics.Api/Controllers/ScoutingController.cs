using GoalTactics.Api.Extensions;
using GoalTactics.Application.Scouting;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Scouting;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Scouting")]
[Authorize]
public sealed class ScoutingController(IScoutingService scoutingService) : ControllerBase
{
    [HttpPost("GetScoutedPlayers")]
    [HttpPost("GetPlayers")]
    public async Task<ActionResult<ScoutingPlayersResponse>> GetScoutedPlayers([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ScoutingPlayersResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await scoutingService.GetScoutedPlayersAsync(userId, cancellationToken));
    }

    [HttpPost("InstructScout")]
    [HttpPost("Instruct")]
    public async Task<ActionResult<ScoutingPlayersResponse>> InstructScout([FromBody] ScoutInstructionRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ScoutingPlayersResponse { Success = false, Message = "Invalid token context" });
        }

        await scoutingService.InstructScoutAsync(userId, request, cancellationToken);
        return Ok(await scoutingService.GetScoutedPlayersAsync(userId, cancellationToken));
    }

    [HttpPost("RecruitScoutedPlayer")]
    [HttpPost("Recruit")]
    public async Task<ActionResult<ResponseObject>> RecruitScoutedPlayer([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await scoutingService.RecruitAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Recruited" });
    }

    [HttpPost("SpeedupScout")]
    public async Task<ActionResult<ResponseObject>> SpeedupScout([FromBody] SpeedupRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        // Legacy clients may not send an Id; they only send the price.
        // If the caller is requesting a premium speedup, find the earliest pending premium scout.
        var assignmentId = request.Id != Guid.Empty ? request.Id : await scoutingService.GetNextPendingScoutIdAsync(userId, request.Price == 300, cancellationToken);
        if (assignmentId == Guid.Empty)
        {
            return Ok(new ResponseObject { Success = false, Message = "No pending scout found." });
        }

        await scoutingService.SpeedupAsync(userId, assignmentId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Sped up" });
    }
}
