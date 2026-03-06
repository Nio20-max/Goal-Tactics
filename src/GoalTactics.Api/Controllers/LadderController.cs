using GoalTactics.Api.Extensions;
using GoalTactics.Application.Ladder;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Ladder;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Authorize]
public sealed class LadderController(ILadderService ladderService) : ControllerBase
{
    [HttpPost("GetLadder")]
    public async Task<ActionResult<LadderResponse>> GetLadder([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new LadderResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await ladderService.GetLadderAsync(userId, request.Id, cancellationToken));
    }

    [HttpPost("GetLadderChallenge")]
    public async Task<ActionResult<LadderChallengeResponse>> GetLadderChallenge([FromBody] LadderChallengeRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new LadderChallengeResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await ladderService.GetLadderChallengeAsync(userId, request.TeamId, cancellationToken));
    }

    [HttpPost("RestoreStamina")]
    public async Task<ActionResult<TextResponse>> RestoreStamina([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized();
        }

        await ladderService.RestoreStaminaAsync(userId, cancellationToken);
        return Ok(new TextResponse { Value = "Stamina restored" });
    }

    [HttpPost("RunMatch")]
    public async Task<ActionResult<LadderMatchResponse>> RunMatch([FromBody] LadderChallengeRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new LadderMatchResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await ladderService.RunMatchAsync(userId, request.TeamId, cancellationToken));
    }
}
