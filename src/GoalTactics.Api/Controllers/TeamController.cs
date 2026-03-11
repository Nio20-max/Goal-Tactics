using GoalTactics.Api.Extensions;
using GoalTactics.Application.Team;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Team;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Team")]
[Authorize]
public sealed class TeamController(ITeamService teamService) : ControllerBase
{
    [HttpPost("GetTeamInfo")]
    public async Task<ActionResult<TeamDataResponse>> GetTeamInfo([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var response = await teamService.GetTeamInfoAsync(request.Id, cancellationToken);
        return response.Success ? Ok(response) : NotFound(response);
    }

    [HttpPost("GetMyTeamInfo")]
    public async Task<ActionResult<TeamDataResponse>> GetMyTeamInfo([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TeamDataResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await teamService.GetMyTeamInfoAsync(userId, cancellationToken));
    }

    [HttpPost("GetMyTeamExtendedInfo")]
    public async Task<ActionResult<ExtendedTeamDataResponse>> GetMyTeamExtendedInfo([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ExtendedTeamDataResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await teamService.GetMyTeamExtendedInfoAsync(userId, cancellationToken));
    }

    [HttpPost("GetClubNews")]
    public async Task<ActionResult<ClubNewsResponse>> GetClubNews([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ClubNewsResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await teamService.GetClubNewsAsync(request.Id, userId, cancellationToken));
    }

    [HttpPost("GetMyResources")]
    public async Task<ActionResult<ResourcesResponse>> GetMyResources([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResourcesResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await teamService.GetMyResourcesAsync(userId, cancellationToken));
    }

    [HttpPost("GetMyMail")]
    public async Task<ActionResult<MailResponse>> GetMyMail([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new MailResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await teamService.GetMyMailAsync(userId, cancellationToken));
    }

    [HttpPost("MarkAsRead")]
    public async Task<ActionResult<ResponseObject>> MarkAsRead([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await teamService.MarkAsReadAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Updated" });
    }

    [HttpPost("MarkAllAsRead")]
    public async Task<ActionResult<ResponseObject>> MarkAllAsRead([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await teamService.MarkAllAsReadAsync(userId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Updated" });
    }

    [HttpPost("DeleteMail")]
    public async Task<ActionResult<ResponseObject>> DeleteMail([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await teamService.DeleteMailAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Deleted" });
    }

    [HttpPost("DeleteAllRead")]
    public async Task<ActionResult<ResponseObject>> DeleteAllRead([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await teamService.DeleteAllReadAsync(userId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Deleted" });
    }

    [HttpPost("GetAccomplishments")]
    public async Task<ActionResult<AccomplishmentsResponse>> GetAccomplishments([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new AccomplishmentsResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await teamService.GetAccomplishmentsAsync(userId, cancellationToken));
    }

    [HttpPost("GetFinanceHistory")]
    public async Task<ActionResult<FinanceHistoryResponse>> GetFinanceHistory([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new FinanceHistoryResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await teamService.GetFinanceHistoryAsync(userId, cancellationToken));
    }

    [HttpPost("GetFinances")]
    public async Task<ActionResult<FinancesResponse>> GetFinances([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new FinancesResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await teamService.GetFinancesAsync(userId, cancellationToken));
    }

    [HttpPost("ChangeTeamName")]
    public async Task<ActionResult<ResponseObject>> ChangeTeamName([FromBody] RenameRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        if (string.IsNullOrWhiteSpace(request.Name))
        {
            return BadRequest(new ResponseObject { Success = false, Message = "Name is required" });
        }

        await teamService.ChangeTeamNameAsync(userId, request.Id, request.Name, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Renamed" });
    }
}
