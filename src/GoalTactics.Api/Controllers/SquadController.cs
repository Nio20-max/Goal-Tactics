using GoalTactics.Api.Extensions;
using GoalTactics.Application.Common;
using GoalTactics.Application.Squad;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Squad;
using GoalTactics.Contracts.TransferMarket;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
[Route("api/Squad")]
[Authorize]
public sealed class SquadController(ISquadService squadService, ICountryCatalog countryCatalog, ITransferMarketService transferMarketService) : ControllerBase
{
    [HttpPost("GetSquad")]
    [HttpPost("GetPlayers")]
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

    [HttpPost("GetTeamPlayers")]
    public async Task<ActionResult<TeamPlayersResponse>> GetTeamPlayers([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TeamPlayersResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await squadService.GetTeamPlayersAsync(userId, request.Id, cancellationToken));
    }

    [HttpPost("GetTrainingProgress")]
    public async Task<ActionResult<TrainingProgressResponse>> GetTrainingProgress([FromBody] IdRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TrainingProgressResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await squadService.GetTrainingProgressAsync(userId, request.Id, cancellationToken));
    }

    [HttpPost("RenamePlayer")]
    [HttpPost("ChangePlayerName")]
    public async Task<ActionResult<TextResponse>> ChangePlayerName([FromBody] RenameRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TextResponse { Success = false, Message = "Invalid token context" });
        }

        await squadService.ChangePlayerNameAsync(userId, request.Id, request.Name, cancellationToken);
        return Ok(new TextResponse { Success = true, Text = request.Name?.Trim() ?? string.Empty });
    }

    [HttpPost("ChangeOrigin")]
    [HttpPost("ChangePlayerOrigin")]
    public async Task<ActionResult<TextResponse>> ChangePlayerOrigin([FromBody] OriginRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new TextResponse { Success = false, Message = "Invalid token context" });
        }

        var origin = countryCatalog.GetCountries().FirstOrDefault(x => x.Id == request.CountryId)?.IsoCode ?? "DE";
        await squadService.ChangePlayerOriginAsync(userId, request.Id, origin, cancellationToken);
        return Ok(new TextResponse { Success = true, Text = origin });
    }

    [HttpPost("ChangeShirt")]
    [HttpPost("ChangePlayerShirt")]
    public async Task<ActionResult<ResponseObject>> ChangePlayerShirt([FromBody] NumberRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        await squadService.ChangePlayerShirtAsync(userId, request.Id, request.Number, cancellationToken);
        return Ok(new ResponseObject { Success = true, Message = "Updated" });
    }

    [HttpPost("SellPlayer")]
    public Task<ActionResult<ResponseObject>> SellPlayer([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.SellPlayerAsync, "Player sold");

    [HttpPost("FirePlayer")]
    public Task<ActionResult<ResponseObject>> FirePlayer([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.FirePlayerAsync, "Player fired");

    [HttpPost("ExtendPlayerContract")]
    public async Task<ActionResult<PlayerContractResponse>> ExtendPlayerContract([FromBody] PlayerContractRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new PlayerContractResponse { Success = false, Message = "Invalid token context" });
        }

        var playerId = request.PlayerID != Guid.Empty ? request.PlayerID : request.Id;
        return Ok(await squadService.ExtendContractAsync(userId, playerId, request.Salary, request.PremiumRenewal, cancellationToken));
    }

    [HttpPost("GetPlayerContractCost")]
    public async Task<ActionResult<PlayerContractResponse>> GetPlayerContractCost([FromBody] PlayerContractRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new PlayerContractResponse { Success = false, Message = "Invalid token context" });
        }

        var playerId = request.PlayerID != Guid.Empty ? request.PlayerID : request.Id;
        return Ok(await squadService.GetPlayerContractCostAsync(userId, playerId, request.Salary, cancellationToken));
    }

    [HttpPost("UpgradePlayer")]
    public Task<ActionResult<ResponseObject>> UpgradePlayer([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.UpgradePlayerAsync, "Player upgraded");

    [HttpPost("UseSkillCard")]
    public Task<ActionResult<ResponseObject>> UseSkillCard([FromBody] GoalTactics.Contracts.Squad.UseSkillCardRequest request, CancellationToken cancellationToken)
    {
        GoalTactics.Application.Team.SkillCardRecord? card = null;
        if (request.Card is not null)
        {
            card = new GoalTactics.Application.Team.SkillCardRecord(
                request.Card.Skill,
                request.Card.Rarity,
                request.Card.Count,
                request.Card.Bonus);
        }

        return ExecuteMutation(request.Id, cancellationToken, (userId, playerId, ct) => squadService.UseSkillCardAsync(userId, playerId, card, ct), "Skill card applied");
    }

    [HttpPost("HealPlayer")]
    public Task<ActionResult<ResponseObject>> HealPlayer([FromBody] IdRequest request, CancellationToken cancellationToken) =>
        ExecuteMutation(request.Id, cancellationToken, squadService.HealPlayerAsync, "Player healed");

    [HttpPost("GetSkillCards")]
    public async Task<ActionResult<GoalTactics.Contracts.Squad.SkillCardsResponse>> GetSkillCards([FromBody] RequestObject request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new GoalTactics.Contracts.Squad.SkillCardsResponse { Success = false, Message = "Invalid token context" });
        }

        return Ok(await squadService.GetSkillCardsAsync(userId, cancellationToken));
    }

    [HttpPost("SendToTransfermarket")]
    public async Task<ActionResult<ResponseObject>> SendToTransfermarket([FromBody] SellPlayerRequest request, CancellationToken cancellationToken)
    {
        var userId = HttpContext.GetCurrentUserId();
        if (string.IsNullOrWhiteSpace(userId))
        {
            return Unauthorized(new ResponseObject { Success = false, Message = "Invalid token context" });
        }

        var auctionId = await transferMarketService.ListPlayerForSaleAsync(userId, request, cancellationToken);
        var message = auctionId == Guid.Empty
            ? "Player sold directly"
            : $"Player listed with auction {auctionId}";
        return Ok(new ResponseObject { Success = true, Message = message });
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
