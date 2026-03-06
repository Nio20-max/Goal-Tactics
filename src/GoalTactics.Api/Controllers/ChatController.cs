using GoalTactics.Api.Extensions;
using GoalTactics.Application.Chat;
using GoalTactics.Contracts.Chat;
using GoalTactics.Contracts.Common;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

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
    public async Task<ActionResult<ResponseObject>> PostChatMessage([FromBody] ChatPostRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await chatService.PostAsync(userId, request.Message, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Posted" });
    }

    [HttpPost("Typing")]
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
