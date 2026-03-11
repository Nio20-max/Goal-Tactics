using GoalTactics.Api.Extensions;
using GoalTactics.Application.Tutorial;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Tutorial;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Tutorial")]
[Authorize]
public sealed class TutorialController(ITutorialService tutorialService) : ControllerBase
{
    [HttpPost("GetTutorial")]
    public async Task<ActionResult<TutorialResponse>> GetTutorial([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TutorialResponse { Success = false, Message = "Invalid token context" });
        }

        var response = await tutorialService.GetTutorialAsync(userId, cancellationToken);
        return Ok(response);
    }

    [HttpPost("SkipTutorial")]
    public async Task<ActionResult<TutorialResponse>> SkipTutorial([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TutorialResponse { Success = false, Message = "Invalid token context" });
        }

        var response = await tutorialService.SkipTutorialAsync(userId, cancellationToken);
        return Ok(response);
    }

    [HttpPost("FinishTutorialStep")]
    public async Task<ActionResult<TutorialResponse>> FinishTutorialStep([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TutorialResponse { Success = false, Message = "Invalid token context" });
        }

        var response = await tutorialService.FinishTutorialStepAsync(userId, cancellationToken);
        return Ok(response);
    }

    [HttpPost("ResetTutorial")]
    public async Task<ActionResult<TutorialResponse>> ResetTutorial([FromBody] TutorialRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TutorialResponse { Success = false, Message = "Invalid token context" });
        }

        var response = await tutorialService.ResetTutorialAsync(userId, request.TopicID, cancellationToken);
        return Ok(response);
    }
}
