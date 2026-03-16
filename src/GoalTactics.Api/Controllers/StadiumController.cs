using GoalTactics.Api.Extensions;
using GoalTactics.Application.Stadium;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Stadium;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Stadium")]
[Authorize]
public sealed class StadiumController(IStadiumService stadiumService) : ControllerBase
{
    [HttpPost("GetStadium")]
    public async Task<ActionResult<StadiumResponse>> GetStadium([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new StadiumResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await stadiumService.GetStadiumAsync(userId, cancellationToken));
    }

    [HttpPost("GetBuildPlaces")]
    public async Task<ActionResult<BuildPlacesResponse>> GetBuildPlaces([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new BuildPlacesResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await stadiumService.GetBuildPlacesAsync(userId, cancellationToken));
    }

    [HttpPost("BuildStadium")]
    [HttpPost("Build")]
    public Task<ActionResult<ResponseObject>> BuildStadium([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, (userId, id, ct) => stadiumService.BuildAsync(userId, id, 1, ct), "Build started");

    [HttpPost("BuildPlaces")]
    public async Task<ActionResult<ResponseObject>> BuildPlaces([FromBody] StadiumPlacesRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        var place = request.Places?.FirstOrDefault(p => p.Count > 0);
        if (place is null)
        {
            return Ok(new ResponseObject { Success = false, Message = "No places specified" });
        }

        await stadiumService.BuildAsync(userId, place.Id, place.Count, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Build started" });
    }

    [HttpPost("SpeedupBuilding")]
    [HttpPost("Speedup")]
    public Task<ActionResult<ResponseObject>> SpeedupBuilding([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, stadiumService.SpeedupAsync, "Build sped up");

    [HttpPost("RenewStadiumGrass")]
    [HttpPost("RenewGrass")]
    public async Task<ActionResult<ResponseObject>> RenewStadiumGrass([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await stadiumService.RenewGrassAsync(userId, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Grass renewed" });
    }

    [HttpPost("RenameStadium")]
    public async Task<ActionResult<ResponseObject>> RenameStadium([FromBody] TextRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await stadiumService.RenameAsync(userId, request.Text, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Renamed" });
    }

    [HttpPost("GetUnderConstruction")]
    public async Task<ActionResult<UnderConstructionResponse>> GetUnderConstruction([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new UnderConstructionResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await stadiumService.GetUnderConstructionAsync(userId, cancellationToken));
    }

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
