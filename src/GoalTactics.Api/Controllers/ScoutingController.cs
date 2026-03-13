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
    public async Task<ActionResult<ResponseObject>> InstructScout([FromBody] ScoutInstructionRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await scoutingService.InstructScoutAsync(userId, request, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Scout instructed" });
    }

    [HttpPost("RecruitScoutedPlayer")]
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
    public async Task<ActionResult<ResponseObject>> SpeedupScout([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await scoutingService.SpeedupAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Sped up" });
    }
}
