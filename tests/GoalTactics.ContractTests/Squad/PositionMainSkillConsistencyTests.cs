using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Linq;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Scouting;
using GoalTactics.Contracts.Squad;
using GoalTactics.Contracts.TransferMarket;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Squad;

public sealed class PositionMainSkillConsistencyTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public PositionMainSkillConsistencyTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task SquadPlayers_NewTeam_HasExpectedPositionDistribution()
    {
        var token = await RegisterAndLoginAsync("squad_dist");
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var response = await client.PostAsJsonAsync("/api/Squad/GetPlayers", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, response.StatusCode);

        var body = await response.Content.ReadFromJsonAsync<SquadResponse>();
        Assert.NotNull(body);
        Assert.True(body!.Success);

        var byPosition = body.Players
            .GroupBy(player => player.Position)
            .ToDictionary(group => group.Key, group => group.Count());

        Assert.Equal(18, body.Players.Count);
        Assert.Equal(2, byPosition.GetValueOrDefault(0));
        Assert.Equal(6, byPosition.GetValueOrDefault(2));
        Assert.Equal(6, byPosition.GetValueOrDefault(4));
        Assert.Equal(4, byPosition.GetValueOrDefault(6));
    }

    [Fact]
    public async Task SquadPlayers_ExposeMainSkillMatchingPosition()
    {
        var token = await RegisterAndLoginAsync("squadmap");
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var response = await client.PostAsJsonAsync("/api/Squad/GetPlayers", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, response.StatusCode);

        var body = await response.Content.ReadFromJsonAsync<SquadResponse>();
        Assert.NotNull(body);
        Assert.True(body!.Success);
        Assert.NotEmpty(body.Players);

        Assert.All(body.Players, player =>
        {
            Assert.Contains(player.Position, new[] { 0, 2, 4, 6 });
            Assert.Equal(ExpectedMainSkill(player.Position), player.MainSkill);
        });
    }

    [Fact]
    public async Task PremiumScout_AcceptsLegacyPositionCodes_AndReturnsMatchingMainSkill()
    {
        var scenarios = new[]
        {
            (LegacyCode: 0, ExpectedPosition: 0),
            (LegacyCode: 2, ExpectedPosition: 2),
            (LegacyCode: 4, ExpectedPosition: 4),
            (LegacyCode: 6, ExpectedPosition: 6)
        };

        foreach (var scenario in scenarios)
        {
            var token = await RegisterAndLoginAsync($"scout_{scenario.LegacyCode}");
            client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

            var beforeResponse = await client.PostAsJsonAsync("/api/Scouting/GetScoutedPlayers", new RequestObject());
            Assert.Equal(HttpStatusCode.OK, beforeResponse.StatusCode);
            var beforeBody = await beforeResponse.Content.ReadFromJsonAsync<ScoutingPlayersResponse>();
            Assert.NotNull(beforeBody);
            var existingIds = beforeBody!.Players.Select(p => p.Id).ToHashSet();

            var instructResponse = await client.PostAsJsonAsync("/api/Scouting/InstructScout", new ScoutInstructionRequest
            {
                ScoutType = "premium",
                Type = "premium",
                Position = scenario.LegacyCode,
                Price = 1000
            });
            Assert.Equal(HttpStatusCode.OK, instructResponse.StatusCode);

            var instructBody = await instructResponse.Content.ReadFromJsonAsync<ScoutingPlayersResponse>();
            Assert.NotNull(instructBody);
            Assert.True(instructBody!.Success);

            var created = instructBody.Players.FirstOrDefault(p => !existingIds.Contains(p.Id));
            Assert.NotNull(created);
            Assert.Equal(scenario.ExpectedPosition, created!.Position);
            Assert.Equal(ExpectedMainSkill(created.Position), created.MainSkill);
        }
    }

    [Fact]
    public async Task TransferMarket_DetailsExposeMainSkillMatchingPosition_ForAllPositions()
    {
        var token = await RegisterAndLoginAsync("transfermap");
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var squadResponse = await client.PostAsJsonAsync("/api/Squad/GetPlayers", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, squadResponse.StatusCode);

        var squadBody = await squadResponse.Content.ReadFromJsonAsync<SquadResponse>();
        Assert.NotNull(squadBody);
        Assert.True(squadBody!.Success);

        var onePerPosition = squadBody.Players
            .GroupBy(p => p.Position)
            .Where(g => g.Key is 0 or 2 or 4 or 6)
            .Select(g => g.First())
            .OrderBy(p => p.Position)
            .ToList();

        Assert.NotEmpty(onePerPosition);

        foreach (var player in onePerPosition)
        {
            var sellResponse = await client.PostAsJsonAsync("/api/Transfermarket/SellPlayer", new SellPlayerRequest
            {
                PlayerId = player.Id,
                MinimumBid = 25000,
                DurationHours = 4
            });
            Assert.Equal(HttpStatusCode.OK, sellResponse.StatusCode);

            var sellBody = await sellResponse.Content.ReadFromJsonAsync<ResponseObject>();
            Assert.NotNull(sellBody);
            Assert.True(sellBody!.Success);
        }

        var searchResponse = await client.PostAsJsonAsync("/api/Transfermarket/SearchTransfermarket", new TransferSearchRequest());
        Assert.Equal(HttpStatusCode.OK, searchResponse.StatusCode);

        var searchBody = await searchResponse.Content.ReadFromJsonAsync<TransferSearchResponse>();
        Assert.NotNull(searchBody);
        Assert.True(searchBody!.Success);

        var sellingsByPosition = searchBody.Sellings
            .Where(s => s.Position is 0 or 2 or 4 or 6)
            .GroupBy(s => s.Position)
            .ToDictionary(g => g.Key, g => g.First());

        Assert.NotEmpty(sellingsByPosition);

        foreach (var position in sellingsByPosition.Keys.OrderBy(x => x))
        {
            Assert.True(sellingsByPosition.TryGetValue(position, out var selling));

            var detailsResponse = await client.PostAsJsonAsync("/api/Transfermarket/GetTransferDetails", new TransferDetailsRequest
            {
                AuctionId = selling!.Id
            });
            Assert.Equal(HttpStatusCode.OK, detailsResponse.StatusCode);

            var detailsBody = await detailsResponse.Content.ReadFromJsonAsync<TransferDetailsResponse>();
            Assert.NotNull(detailsBody);
            Assert.True(detailsBody!.Success);
            Assert.Equal(position, detailsBody.AuctionPlayer.Position);
        }
    }

    private static int ExpectedMainSkill(int position) => position switch
    {
        0 => 1,
        2 => 0,
        4 => 11,
        6 => 6,
        _ => 0
    };

    private async Task<string> RegisterAndLoginAsync(string prefix)
    {
        var email = $"{prefix}_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "MappingTester"
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
