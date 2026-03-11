using GoalTactics.Application.Common;
using GoalTactics.Contracts.Common;
using Microsoft.AspNetCore.Mvc;

namespace GoalTactics.Api.Controllers;

[ApiController]
[Route("api")]
public sealed class CommonController(ICountryCatalog countryCatalog, IConfiguration configuration) : ControllerBase
{
    [HttpGet("Ping")]
    public ActionResult<ResponseObject> Ping()
    {
        return Ok(new ResponseObject
        {
            Success = true,
            Message = "pong"
        });
    }

    [HttpGet("GetVersion")]
    public ActionResult<string> GetVersion()
    {
        var version = configuration["App:Version"] ?? "0.1.0-dev";
        return Ok(version);
    }

    [HttpPost("GetCountries")]
    public ActionResult<CountriesResponse> GetCountries([FromBody] RequestObject request)
    {
        var response = new CountriesResponse
        {
            Countries = countryCatalog.GetCountries()
        };

        return Ok(response);
    }

    [HttpPost("GetSeasonInfo")]
    public ActionResult<TextResponse> GetSeasonInfo([FromBody] RequestObject request)
    {
        var seasonLengthDays = int.TryParse(configuration["App:SeasonLengthDays"], out var d) ? d : 30;
        var startDate = DateTime.TryParse(configuration["App:SeasonStartDate"], out var sd) ? sd : new DateTime(2026, 1, 1, 0, 0, 0, DateTimeKind.Utc);

        var elapsed = (DateTime.UtcNow - startDate).TotalDays;
        var currentSeason = (int)(elapsed / seasonLengthDays) + 1;
        var daysIntoSeason = (int)(elapsed % seasonLengthDays);
        var daysLeft = seasonLengthDays - daysIntoSeason;
        var matchday = daysIntoSeason + 1;

        return Ok(new TextResponse { Text = $"Season {currentSeason} - Matchday {matchday} ({daysLeft} days left)" });
    }
}
