using GoalTactics.Api.Extensions;
using GoalTactics.Application.Training;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Training;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Training")]
[Authorize]
public sealed class TrainingController(ITrainingService trainingService) : ControllerBase
{
    [HttpPost("GetTeamTraining")]
    [HttpPost("GetTraining")]
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
    public async Task<ActionResult<TeamTrainingData>> SaveTeamTraining([FromBody] TeamTrainingSaveRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TeamTrainingData { Success = false, Message = "Invalid token context" });
        }

        await trainingService.SaveTeamTrainingAsync(userId, request, cancellationToken);
        var response = await trainingService.GetTeamTrainingAsync(userId, cancellationToken);
        return Ok(response.TeamTraining ?? new TeamTrainingData { Success = true, Message = "Saved" });
    }

    [HttpPost("SaveTacticTraining")]
    public async Task<ActionResult<TacticTrainingData>> SaveTacticTraining([FromBody] TacticTrainingSaveRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TacticTrainingData { Success = false, Message = "Invalid token context" });
        }

        await trainingService.SaveTacticTrainingAsync(userId, request, cancellationToken);
        var response = await trainingService.GetTeamTrainingAsync(userId, cancellationToken);
        return Ok(response.TacticTraining ?? new TacticTrainingData { Success = true, Message = "Saved" });
    }

    [HttpPost("BookTrainingCamp")]
    [HttpPost("BookCamp")]
    public async Task<ActionResult<TrainingCampData>> BookTrainingCamp([FromBody] TrainingCampRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TrainingCampData { Success = false, Message = "Invalid token context" });
        }

        await trainingService.BookCampAsync(userId, request, cancellationToken);
        var response = await trainingService.GetTeamTrainingAsync(userId, cancellationToken);
        return Ok(response.TrainingCamp ?? new TrainingCampData { Success = true, Message = "Booked" });
    }

    [HttpPost("CancelCamp")]
    public async Task<ActionResult<TrainingCampData>> CancelCamp([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TrainingCampData { Success = false, Message = "Invalid token context" });
        }

        await trainingService.CancelCampAsync(userId, cancellationToken);
        var response = await trainingService.GetTeamTrainingAsync(userId, cancellationToken);
        return Ok(response.TrainingCamp ?? new TrainingCampData { Success = true, Message = "Canceled" });
    }

    [HttpPost("UpdateCamps")]
    public async Task<ActionResult<TrainingCampData>> UpdateCamps([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TrainingCampData { Success = false, Message = "Invalid token context" });
        }

        await trainingService.UpdateCampsAsync(userId, cancellationToken);
        var response = await trainingService.GetTeamTrainingAsync(userId, cancellationToken);
        return Ok(response.TrainingCamp ?? new TrainingCampData { Success = true, Message = "Updated" });
    }

    [HttpPost("SaveIndividualTraining")]
    [HttpPost("StartIndividualTraining")]
    public async Task<ActionResult<IndividualTrainingData>> SaveIndividualTraining([FromBody] IndividualTrainingRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new IndividualTrainingData { Success = false, Message = "Invalid token context" });
        }

        await trainingService.SaveIndividualTrainingAsync(userId, request, cancellationToken);
        var response = await trainingService.GetTeamTrainingAsync(userId, cancellationToken);
        return Ok(response.IndividualTraining ?? new IndividualTrainingData { Success = true, Message = "Saved" });
    }

    [HttpPost("CancelIndividualTraining")]
    public async Task<ActionResult<IndividualTrainingData>> CancelIndividualTraining([FromBody] IndividualTrainingRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new IndividualTrainingData { Success = false, Message = "Invalid token context" });
        }

        await trainingService.CancelIndividualTrainingAsync(userId, request.ResolvedPlayerId, cancellationToken);
        var response = await trainingService.GetTeamTrainingAsync(userId, cancellationToken);
        return Ok(response.IndividualTraining ?? new IndividualTrainingData { Success = true, Message = "Canceled" });
    }

    [HttpPost("RenewIndividualTraining")]
    public async Task<ActionResult<IndividualTrainingData>> RenewIndividualTraining([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new IndividualTrainingData { Success = false, Message = "Invalid token context" });
        }

        await trainingService.RenewIndividualTrainingAsync(userId, request.Id, cancellationToken);
        var response = await trainingService.GetTeamTrainingAsync(userId, cancellationToken);
        return Ok(response.IndividualTraining ?? new IndividualTrainingData { Success = true, Message = "Renewed" });
    }

    [HttpPost("RenewAllIndividualTraining")]
    [HttpPost("RenewAllIndividualTrainings")]
    public async Task<ActionResult<IndividualTrainingData>> RenewAllIndividualTraining([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new IndividualTrainingData { Success = false, Message = "Invalid token context" });
        }

        await trainingService.RenewAllIndividualTrainingAsync(userId, cancellationToken);
        var response = await trainingService.GetTeamTrainingAsync(userId, cancellationToken);
        return Ok(response.IndividualTraining ?? new IndividualTrainingData { Success = true, Message = "Renewed" });
    }
}
