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
        return Ok(new TextResponse { Text = "Season ongoing" });
    }
}
