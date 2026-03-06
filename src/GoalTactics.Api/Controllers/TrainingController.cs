using GoalTactics.Api.Extensions;
using GoalTactics.Application.Training;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Training;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Authorize]
public sealed class TrainingController(ITrainingService trainingService) : ControllerBase
{
    [HttpPost("GetTeamTraining")]
    public async Task<ActionResult<TeamTrainingResponse>> GetTeamTraining([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TeamTrainingResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await trainingService.GetTeamTrainingAsync(userId, cancellationToken));
    }

    [HttpPost("SaveTeamTraining")]
    public async Task<ActionResult<ResponseObject>> SaveTeamTraining([FromBody] TeamTrainingSaveRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await trainingService.SaveTeamTrainingAsync(userId, request, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Saved" });
    }

    [HttpPost("SaveTacticTraining")]
    public async Task<ActionResult<ResponseObject>> SaveTacticTraining([FromBody] TacticTrainingSaveRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await trainingService.SaveTacticTrainingAsync(userId, request, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Saved" });
    }

    [HttpPost("BookTrainingCamp")]
    public async Task<ActionResult<ResponseObject>> BookTrainingCamp([FromBody] TrainingCampRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await trainingService.BookCampAsync(userId, request, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Booked" });
    }

    [HttpPost("SaveIndividualTraining")]
    public async Task<ActionResult<ResponseObject>> SaveIndividualTraining([FromBody] IndividualTrainingRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await trainingService.SaveIndividualTrainingAsync(userId, request, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Saved" });
    }

    [HttpPost("RenewIndividualTraining")]
    public async Task<ActionResult<ResponseObject>> RenewIndividualTraining([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await trainingService.RenewIndividualTrainingAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Renewed" });
    }

    [HttpPost("RenewAllIndividualTraining")]
    public async Task<ActionResult<ResponseObject>> RenewAllIndividualTraining([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await trainingService.RenewAllIndividualTrainingAsync(userId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Renewed" });
    }
}
