using GoalTactics.Api.Extensions;
using GoalTactics.Application.Squad;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Squad;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Authorize]
public sealed class SquadController(ISquadService squadService) : ControllerBase
{
    [HttpPost("GetSquad")]
    public async Task<ActionResult<SquadResponse>> GetSquad([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new SquadResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await squadService.GetSquadAsync(userId, cancellationToken));
    }

    [HttpPost("GetPlayerStatistics")]
    public async Task<ActionResult<PlayerStatisticsResponse>> GetPlayerStatistics([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new PlayerStatisticsResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await squadService.GetPlayerStatisticsAsync(userId, request.Id, cancellationToken));
    }

    [HttpPost("ChangePlayerName")]
    public async Task<ActionResult<ResponseObject>> ChangePlayerName([FromBody] PlayerTextChangeRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await squadService.ChangePlayerNameAsync(userId, request.Id, request.Value, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Updated" });
    }

    [HttpPost("ChangePlayerOrigin")]
    public async Task<ActionResult<ResponseObject>> ChangePlayerOrigin([FromBody] PlayerTextChangeRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await squadService.ChangePlayerOriginAsync(userId, request.Id, request.Value, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Updated" });
    }

    [HttpPost("ChangePlayerShirt")]
    public async Task<ActionResult<ResponseObject>> ChangePlayerShirt([FromBody] PlayerShirtRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await squadService.ChangePlayerShirtAsync(userId, request.Id, request.ShirtNumber, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Updated" });
    }

    [HttpPost("SellPlayer")]
    public Task<ActionResult<ResponseObject>> SellPlayer([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.SellPlayerAsync, "Player sold");

    [HttpPost("FirePlayer")]
    public Task<ActionResult<ResponseObject>> FirePlayer([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.FirePlayerAsync, "Player fired");

    [HttpPost("ExtendPlayerContract")]
    public Task<ActionResult<ResponseObject>> ExtendPlayerContract([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.ExtendContractAsync, "Contract extended");

    [HttpPost("UpgradePlayer")]
    public Task<ActionResult<ResponseObject>> UpgradePlayer([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.UpgradePlayerAsync, "Player upgraded");

    [HttpPost("UseSkillCard")]
    public Task<ActionResult<ResponseObject>> UseSkillCard([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.UseSkillCardAsync, "Skill card applied");

    [HttpPost("HealPlayer")]
    public Task<ActionResult<ResponseObject>> HealPlayer([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.HealPlayerAsync, "Player healed");

    private async Task<ActionResult<ResponseObject>> ExecuteMutation(
        Guid id,
        CancellationToken cancellationToken,
        Func<string, Guid, CancellationToken, Task> operation,
        string message)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await operation(userId, id, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = message });
    }
}
