using GoalTactics.Api.Extensions;
using GoalTactics.Application.Auth;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("chat")]
public sealed class ChatWebController( IAuthService authService ) : ControllerBase
{
    private readonly IAuthService _authService = authService;

    // Support website chat login path so frontend chat widgets can authenticate without depending
    // on an eye-sore SignalR connection-id error page from the raw /chat hub path.
    [AllowAnonymous]
    [HttpPost("login")]
    public async Task<ActionResult<AuthResponse>> Login([FromBody] AuthRequest request, CancellationToken cancellationToken)
    {
        var result = await _authService.LoginAsync(request, cancellationToken);
        return Ok(result);
    }

    [Authorize]
    [HttpPost("logout")]
    public async Task<ActionResult<ResponseObject>> Logout(CancellationToken cancellationToken)
    {
        var tokenId = HttpContext.GetCurrentTokenId();
        if (string.IsNullOrWhiteSpace(tokenId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await _authService.LogoutAsync(tokenId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Logged out" });
    }

    [Authorize]
    [HttpGet("me")]
    public ActionResult<AuthResponse> Me()
    {
        var userId = HttpContext.GetCurrentUserId();
        var managerName = HttpContext.GetCurrentManagerName();

        if (string.IsNullOrWhiteSpace(userId) || string.IsNullOrWhiteSpace(managerName))
        {
            return Unauthorized(new AuthResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(new AuthResponse
        {
            Success = true,
            UserId = Guid.TryParse(userId, out var uid) ? uid : Guid.Empty,
            ManagerName = managerName,
            Message = "Authenticated"
        });
    }
}
