using System.Net;
using System.Net.Http.Json;
using GoalTactics.Contracts.Common;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Common;

public sealed class CommonControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient _client;

    public CommonControllerTests(WebApplicationFactory<Program> factory)
    {
        _client = factory.CreateClient();
    }

    [Fact]
    public async Task Ping_ReturnsPongEnvelope()
    {
        var response = await _client.GetAsync("/api/Ping");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var body = await response.Content.ReadFromJsonAsync<ResponseObject>();
        Assert.NotNull(body);
        Assert.True(body!.Success);
        Assert.Equal("pong", body.Message);
    }

    [Fact]
    public async Task GetVersion_ReturnsConfiguredVersionString()
    {
        var response = await _client.GetAsync("/api/GetVersion");

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var body = await response.Content.ReadAsStringAsync();
        Assert.Equal("0.1.0-dev", body.Trim('"'));
    }

    [Fact]
    public async Task GetCountries_ReturnsCountryList()
    {
        var response = await _client.PostAsJsonAsync("/api/GetCountries", new RequestObject());

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var body = await response.Content.ReadFromJsonAsync<CountriesResponse>();
        Assert.NotNull(body);
        Assert.NotEmpty(body!.Countries);
        Assert.Contains(body.Countries, x => x.IsoCode == "DE");
    }

    [Fact]
    public async Task GetSeasonInfo_ReturnsTextPayload()
    {
        var response = await _client.PostAsJsonAsync("/api/GetSeasonInfo", new RequestObject());

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var body = await response.Content.ReadFromJsonAsync<TextResponse>();
        Assert.NotNull(body);
        Assert.Equal("Season ongoing", body!.Text);
    }
}
