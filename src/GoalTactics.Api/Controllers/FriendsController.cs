using GoalTactics.Api.Extensions;
using GoalTactics.Application.Friends;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Friends;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Authorize]
public sealed class FriendsController(IFriendsService friendsService) : ControllerBase
{
    [HttpPost("GetFriends")]
    public async Task<ActionResult<FriendsResponse>> GetFriends([FromBody] SearchRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new FriendsResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await friendsService.GetFriendsAsync(userId, request, cancellationToken));
    }

    [HttpPost("GetChallenges")]
    public async Task<ActionResult<ChallengesResponse>> GetChallenges([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ChallengesResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await friendsService.GetChallengesAsync(userId, cancellationToken));
    }

    [HttpPost("ReplyChallenge")]
    public async Task<ActionResult<ChallengesResponse>> ReplyChallenge([FromBody] ChallengeReplyRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ChallengesResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await friendsService.ReplyChallengeAsync(userId, request, cancellationToken));
    }

    [HttpPost("SendChallenge")]
    public async Task<ActionResult<ChallengesResponse>> SendChallenge([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ChallengesResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await friendsService.SendChallengeAsync(userId, request.Id, cancellationToken));
    }

    [HttpPost("Like")]
    public async Task<ActionResult<ResponseObject>> Like([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await friendsService.LikeAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Liked" });
    }

    [HttpPost("Unlike")]
    public async Task<ActionResult<ResponseObject>> Unlike([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await friendsService.UnlikeAsync(userId, request.Id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Unliked" });
    }

    [HttpPost("Accept")]
    public async Task<ActionResult<FriendsResponse>> Accept([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new FriendsResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await friendsService.AcceptAsync(userId, request.Id, cancellationToken));
    }

    [HttpPost("Decline")]
    public async Task<ActionResult<FriendsResponse>> Decline([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new FriendsResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await friendsService.DeclineAsync(userId, request.Id, cancellationToken));
    }
}
