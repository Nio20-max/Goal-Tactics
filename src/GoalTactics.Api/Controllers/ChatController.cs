using GoalTactics.Api.Extensions;
using GoalTactics.Application.Chat;
using GoalTactics.Contracts.Chat;
using GoalTactics.Contracts.Common;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.RateLimiting;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Authorize]
public sealed class ChatController(IChatService chatService) : ControllerBase
{
    [HttpPost("GetChatHistory")]
    public async Task<ActionResult<ChatHistoryResponse>> GetChatHistory([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ChatHistoryResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await chatService.GetHistoryAsync(userId, cancellationToken));
    }

    [HttpPost("PostChatMessage")]
    [EnableRateLimiting("chat-write")]
    public async Task<ActionResult<ResponseObject>> PostChatMessage([FromBody] ChatPostRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        if (string.IsNullOrWhiteSpace(request.Message))
        {
            return BadRequest(new ResponseObject { Success = false, Message = "Message is required" });
        }

        if (request.Message.Trim().Length > 512)
        {
            return BadRequest(new ResponseObject { Success = false, Message = "Message is too long" });
        }

        await chatService.PostAsync(userId, request.Message, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Posted" });
    }

    [HttpPost("Post")]
    [EnableRateLimiting("chat-write")]
    public Task<ActionResult<ResponseObject>> Post([FromBody] ChatPostRequest request, CancellationToken cancellationToken)
    {
        return PostChatMessage(request, cancellationToken);
    }

    [HttpPost("Typing")]
    [EnableRateLimiting("chat-write")]
    public async Task<ActionResult<ResponseObject>> Typing([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await chatService.NotifyTypingAsync(userId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Typing" });
    }
}
