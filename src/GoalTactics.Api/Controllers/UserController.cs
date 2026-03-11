using GoalTactics.Api.Extensions;
using GoalTactics.Application.User;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.User;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/User")]
[Authorize]
public sealed class UserController(IUserService userService) : ControllerBase
{
    [HttpPost("ClaimDailyReward")]
    [EnableRateLimiting("mutation-write")]
    public async Task<ActionResult<ValueResponse>> ClaimDailyReward([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ValueResponse { Success = false, Message = "Invalid token context" });
        }

        var value = await userService.ClaimDailyRewardAsync(userId, cancellationToken);
        return Ok(new ValueResponse { Success = true, Value = value });
    }

    [HttpPost("GetHelpshiftUserInfo")]
    public async Task<ActionResult<HelpshiftUserResponse>> GetHelpshiftUserInfo([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new HelpshiftUserResponse { Success = false, Message = "Invalid token context" });
        }

        var response = await userService.GetHelpshiftUserInfoAsync(userId, cancellationToken);
        return response.Success ? Ok(response) : NotFound(response);
    }

    [HttpPost("GetPreferences")]
    public async Task<ActionResult<PreferencesResponse>> GetPreferences([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new PreferencesResponse { Success = false, Message = "Invalid token context" });
        }

        var response = await userService.GetPreferencesAsync(userId, cancellationToken);
        return Ok(response);
    }

    [HttpPost("SavePreferences")]
    public async Task<ActionResult<ResponseObject>> SavePreferences([FromBody] PreferencesRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        if (request.NotificationSettings is null)
        {
            return BadRequest(new ResponseObject { Success = false, Message = "NotificationSettings is required" });
        }

        await userService.SavePreferencesAsync(userId, request.NotificationSettings, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Saved" });
    }

    [HttpPost("UpdateUser")]
    public async Task<ActionResult<UpdateUserResponse>> UpdateUser([FromBody] UpdateUserRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new UpdateUserResponse { Success = false, Message = "Invalid token context" });
        }

        var response = await userService.UpdateUserAsync(userId, request, cancellationToken);
        return Ok(response);
    }

    [HttpPost("DeleteAccount")]
    public async Task<ActionResult<ResponseObject>> DeleteAccount([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await userService.DeleteAccountAsync(userId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Deleted" });
    }

    [HttpPost("EnableMatchPush")]
    [EnableRateLimiting("mutation-write")]
    public async Task<ActionResult<EnableMatchPushResponse>> EnableMatchPush([FromBody] EnableMatchPushRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new EnableMatchPushResponse { Success = false, Message = "Invalid token context" });
        }

        var response = await userService.EnableMatchPushAsync(userId, request.MatchId, cancellationToken);
        return Ok(response);
    }
}
