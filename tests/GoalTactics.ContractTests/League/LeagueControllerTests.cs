using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.League;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.League;

public sealed class LeagueControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public LeagueControllerTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task GetLeagueTable_Returns_16_Clubs_And_PromotionRules()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var response = await client.PostAsJsonAsync("/api/GetLeagueTable", new IdRequest { Id = Guid.Empty });

        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var body = await response.Content.ReadFromJsonAsync<LeagueTableResponse>();
        Assert.NotNull(body);
        Assert.True(body!.Success);
        Assert.Equal(16, body.Teams.Count);
        Assert.Equal(2, body.Mount);
        Assert.Equal(6, body.Dismount);
    }

    [Fact]
    public async Task Matches_And_GoalGetters_Return_NonEmpty_Compatibility_Data()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var leagueTableResponse = await client.PostAsJsonAsync("/api/GetLeagueTable", new IdRequest { Id = Guid.Empty });
        var leagueTable = await leagueTableResponse.Content.ReadFromJsonAsync<LeagueTableResponse>();
        Assert.NotNull(leagueTable);

        var matchesResponse = await client.PostAsJsonAsync("/api/GetMatches", new IdRequest { Id = Guid.Empty });
        Assert.Equal(HttpStatusCode.OK, matchesResponse.StatusCode);
        var matchesBody = await matchesResponse.Content.ReadFromJsonAsync<MatchesResponse>();
        Assert.NotNull(matchesBody);
        Assert.True(matchesBody!.Success);
        Assert.NotEmpty(matchesBody.Matches);
        Assert.All(matchesBody.Matches, match => Assert.False(string.IsNullOrWhiteSpace(match.HomeLogo)));

        var goalGettersResponse = await client.PostAsJsonAsync("/api/GetGoalGetters", new IdRequest { Id = Guid.Empty });
        Assert.Equal(HttpStatusCode.OK, goalGettersResponse.StatusCode);
        var goalGettersBody = await goalGettersResponse.Content.ReadFromJsonAsync<GoalGettersResponse>();
        Assert.NotNull(goalGettersBody);
        Assert.True(goalGettersBody!.Success);
        Assert.NotEmpty(goalGettersBody.Players);
        Assert.All(goalGettersBody.Players, player => Assert.False(string.IsNullOrWhiteSpace(player.TeamLogo)));
    }

    private async Task<string> RegisterAndLoginAsync()
    {
        var email = $"league_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "LeagueManager"
        });
        Assert.Equal(HttpStatusCode.OK, registerResponse.StatusCode);

        var loginResponse = await client.PostAsJsonAsync("/api/Login", new AuthRequest
        {
            Email = email,
            Password = "pass12345"
        });
        Assert.Equal(HttpStatusCode.OK, loginResponse.StatusCode);

        var loginBody = await loginResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(loginBody);
        return loginBody!.Token!;
    }
}
