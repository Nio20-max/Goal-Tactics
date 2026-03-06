using GoalTactics.Application.Auth;
using GoalTactics.Api.Extensions;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.RateLimiting;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
public sealed class AuthController(IAuthService authService) : ControllerBase
{
    [EnableRateLimiting("auth-sensitive")]
    [HttpPost("Register")]
    public async Task<ActionResult<RegisterResponse>> Register([FromBody] RegisterRequest request, CancellationToken cancellationToken)
    {
        var result = await authService.RegisterAsync(request, cancellationToken);
        return result.Success ? Ok(result) : Conflict(result);
    }

    [EnableRateLimiting("auth-sensitive")]
    [HttpPost("Login")]
    public async Task<ActionResult<AuthResponse>> Login([FromBody] AuthRequest request, CancellationToken cancellationToken)
    {
        var result = await authService.LoginAsync(request, cancellationToken);
        return result.Success ? Ok(result) : Unauthorized(result);
    }

    [EnableRateLimiting("auth-sensitive")]
    [HttpPost("VerifyLogin")]
    public async Task<ActionResult<AuthResponse>> VerifyLogin([FromBody] TextRequest request, CancellationToken cancellationToken)
    {
        var result = await authService.VerifyLoginAsync(request.Text, cancellationToken);
        return result.Success ? Ok(result) : Unauthorized(result);
    }

    [Authorize]
    [HttpGet("Me")]
    public ActionResult<AuthResponse> Me()
    {
        var userId = HttpContext.GetCurrentUserId();
        var managerName = HttpContext.GetCurrentManagerName();

        if (string.IsNullOrWhiteSpace(userId) || string.IsNullOrWhiteSpace(managerName))
        {
            return Unauthorized(new AuthResponse
            {
                Success = false,
                Message = "Invalid token context"
            });
        }

        return Ok(new AuthResponse
        {
            Success = true,
            ManagerName = managerName,
            Message = "Authenticated user context"
        });
    }

    [Authorize]
    [HttpPost("Logout")]
    public async Task<ActionResult<ResponseObject>> Logout(CancellationToken cancellationToken)
    {
        var tokenId = HttpContext.GetCurrentTokenId();
        if (string.IsNullOrWhiteSpace(tokenId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await authService.LogoutAsync(tokenId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Logged out" });
    }
}
