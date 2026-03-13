using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Team;
using GoalTactics.Contracts.Sponsors;
using GoalTactics.Contracts.Stadium;
using GoalTactics.Contracts.TransferMarket;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Team;

public sealed class TeamControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public TeamControllerTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task MyTeamInfo_Resources_And_Rename_Work()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var myTeamResponse = await client.PostAsJsonAsync("/api/GetMyTeamInfo", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, myTeamResponse.StatusCode);
        var myTeamBody = await myTeamResponse.Content.ReadFromJsonAsync<TeamDataResponse>();
        Assert.NotNull(myTeamBody);
        Assert.True(myTeamBody!.Success);
        Assert.NotNull(myTeamBody.TeamData);

        var teamId = Guid.Parse(myTeamBody.TeamData!.Id!);

        var resourcesResponse = await client.PostAsJsonAsync("/api/GetMyResources", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, resourcesResponse.StatusCode);
        var resourcesBody = await resourcesResponse.Content.ReadFromJsonAsync<ResourcesResponse>();
        Assert.NotNull(resourcesBody);
        Assert.True(resourcesBody!.Success);
        Assert.Equal(10000000m, resourcesBody.Money);
        Assert.Equal(5000m, resourcesBody.GTStars);

        var prefixedResourcesResponse = await client.PostAsJsonAsync("/api/Team/GetMyResources", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, prefixedResourcesResponse.StatusCode);

        var renameResponse = await client.PostAsJsonAsync("/api/ChangeTeamName", new RenameRequest
        {
            Id = teamId,
            Name = "Renamed FC"
        });
        Assert.Equal(HttpStatusCode.OK, renameResponse.StatusCode);

        var updatedTeamResponse = await client.PostAsJsonAsync("/api/GetMyTeamInfo", new RequestObject());
        var updatedTeamBody = await updatedTeamResponse.Content.ReadFromJsonAsync<TeamDataResponse>();
        Assert.NotNull(updatedTeamBody);
        Assert.Equal("Renamed FC", updatedTeamBody!.TeamData!.Name);
    }

    [Fact]
    public async Task Extended_Team_Info_Matches_Legacy_App_Expectations()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var response = await client.PostAsJsonAsync("/api/Team/GetMyTeamExtendedInfo", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, response.StatusCode);

        var body = await response.Content.ReadFromJsonAsync<ExtendedTeamDataResponse>();
        Assert.NotNull(body);
        Assert.True(body!.Success);
        Assert.NotNull(body.TeamData);
        Assert.NotNull(body.TeamData!.UserData);
        Assert.Equal("TeamManager", body.TeamData.UserData!.Name);
        Assert.Equal(500, body.RenameTeamCost);
        Assert.StartsWith("#", body.Season);
        Assert.True(body.Matchday >= 1);
        Assert.True(body.TeamData.PlayersCount >= 18);
        Assert.NotNull(body.LastMatch);
        Assert.NotNull(body.NextMatch);
    }

    [Fact]
    public async Task Sponsor_Transfer_And_Stadium_Compatibility_Flows_Work()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var sponsorResponse = await client.PostAsJsonAsync("/api/Sponsor/GetSponsors", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, sponsorResponse.StatusCode);
        var sponsorBody = await sponsorResponse.Content.ReadFromJsonAsync<SponsorOffersResponse>();
        Assert.NotNull(sponsorBody);
        Assert.NotEmpty(sponsorBody!.Offers);

        var stadiumResponse = await client.PostAsJsonAsync("/api/Stadium/GetStadium", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, stadiumResponse.StatusCode);
        var stadiumBody = await stadiumResponse.Content.ReadFromJsonAsync<StadiumResponse>();
        Assert.NotNull(stadiumBody);
        Assert.Equal(500, stadiumBody!.ChangeNameCost);
        Assert.Equal(0, stadiumBody.RenewGrassCost);
        Assert.Equal(10, stadiumBody.SpeedupCost);

        // stadium body should include building entries; verify upgrade cost of a
        // stadium seat entry matches the new flat per-block cost.
        var vipBuilding = stadiumBody.Buildings?.FirstOrDefault(b => b.Name == "VIP-Sitze");
        if (vipBuilding is not null)
        {
            // legacy payload cost display for VIP seat block
            var expected = 5_000m;
            Assert.Equal(expected, vipBuilding.UpgradeCost);
        }

        var beforeBidResources = await (await client.PostAsJsonAsync("/api/Team/GetMyResources", new RequestObject())).Content.ReadFromJsonAsync<ResourcesResponse>();
        Assert.NotNull(beforeBidResources);

        // Search for an existing auction to bid on (system auctions are auto-generated)
        var searchResponse = await client.PostAsJsonAsync("/api/Transfermarket/Search", new TransferSearchRequest());
        Assert.Equal(HttpStatusCode.OK, searchResponse.StatusCode);
        var searchBody = await searchResponse.Content.ReadFromJsonAsync<TransferSearchResponse>();
        Assert.NotNull(searchBody);
        Assert.NotEmpty(searchBody!.Players);
        var auctionId = searchBody.Players[0].AuctionId;

        var bidResponse = await client.PostAsJsonAsync("/api/Transfermarket/PlaceBid", new BidRequest { Id = auctionId, Bid = (int)(searchBody.Players[0].Bid + 1000) });
        Assert.Equal(HttpStatusCode.OK, bidResponse.StatusCode);

        var afterBidResources = await (await client.PostAsJsonAsync("/api/Team/GetMyResources", new RequestObject())).Content.ReadFromJsonAsync<ResourcesResponse>();
        Assert.NotNull(afterBidResources);
        Assert.Equal(beforeBidResources!.GTStars - 200, afterBidResources!.GTStars);

        var buildPlacesResponse = await client.PostAsJsonAsync("/api/GetBuildPlaces", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, buildPlacesResponse.StatusCode);
        var buildPlacesBody = await buildPlacesResponse.Content.ReadFromJsonAsync<BuildPlacesResponse>();
        Assert.NotNull(buildPlacesBody);

        // after the fix we should have at least two buildable entries; the office
        // itself plus at least one other facility (training, fan shop etc) because
        // the requirement on office level was relaxed.
        Assert.True(buildPlacesBody!.Places.Count(p => p.CanBuild) >= 2,
            "Expected more than one buildable place after registration");

        // stadium levels are returned in blocks instead of raw seat counts.
        var vip = buildPlacesBody.Places.First(p => p.BuildingType == "StadiumVips");
        var seats = buildPlacesBody.Places.First(p => p.BuildingType == "StadiumSeats");
        var stands = buildPlacesBody.Places.First(p => p.BuildingType == "StadiumStands");
        Assert.Equal(20, vip.Level);   // 200 seats / 10
        Assert.Equal(25, seats.Level); // 2500 seats / 100
        Assert.Equal(23, stands.Level); // 2300 seats / 100

        var buildTarget = buildPlacesBody.Places.First(place => place.CanBuild);

        var buildResponse = await client.PostAsJsonAsync("/api/Stadium/Build", new IdRequest { Id = buildTarget.Id });
        Assert.Equal(HttpStatusCode.OK, buildResponse.StatusCode);

        var underConstructionResponse = await client.PostAsJsonAsync("/api/Stadium/GetUnderConstruction", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, underConstructionResponse.StatusCode);
        var underConstructionBody = await underConstructionResponse.Content.ReadFromJsonAsync<UnderConstructionResponse>();
        Assert.NotNull(underConstructionBody);
        Assert.NotNull(underConstructionBody!.Building);

        var speedupResponse = await client.PostAsJsonAsync("/api/Stadium/Speedup", new IdRequest { Id = buildTarget.Id });
        Assert.Equal(HttpStatusCode.OK, speedupResponse.StatusCode);
    }

    [Fact]
    public async Task StadiumVip_Building_Increases_Capacity_By_Block()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        // fetch current stadium info
        var beforeStadiumResp = await client.PostAsJsonAsync("/api/Stadium/GetStadium", new RequestObject());
        var beforeBody = await beforeStadiumResp.Content.ReadFromJsonAsync<StadiumResponse>();
        Assert.NotNull(beforeBody);
        var beforeCapacity = beforeBody!.Stadium!.Capacity;

        // find a vip place and build it
        var buildPlacesResp = await client.PostAsJsonAsync("/api/GetBuildPlaces", new RequestObject());
        var buildPlacesBody = await buildPlacesResp.Content.ReadFromJsonAsync<BuildPlacesResponse>();
        Assert.NotNull(buildPlacesBody);
        var vipPlace = buildPlacesBody!.Places.FirstOrDefault(p => p.BuildingType == "StadiumVips" && p.CanBuild);
        Assert.NotNull(vipPlace);

        var buildResp = await client.PostAsJsonAsync("/api/Stadium/Build", new IdRequest { Id = vipPlace!.Id });
        Assert.Equal(HttpStatusCode.OK, buildResp.StatusCode);

        // speedup to complete instantly
        var speedResp = await client.PostAsJsonAsync("/api/Stadium/Speedup", new IdRequest { Id = vipPlace.Id });
        Assert.Equal(HttpStatusCode.OK, speedResp.StatusCode);

        // re-fetch stadium info; capacity should have increased by 10 seats
        var afterStadiumResp = await client.PostAsJsonAsync("/api/Stadium/GetStadium", new RequestObject());
        var afterBody = await afterStadiumResp.Content.ReadFromJsonAsync<StadiumResponse>();
        Assert.NotNull(afterBody);
        Assert.Equal(beforeCapacity + 10, afterBody!.Stadium!.Capacity);
    }

    [Fact]
    public async Task Mail_And_Finance_Endpoints_Return_Valid_Responses()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var mailResponse = await client.PostAsJsonAsync("/api/GetMyMail", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, mailResponse.StatusCode);
        var mailBody = await mailResponse.Content.ReadFromJsonAsync<MailResponse>();
        Assert.NotNull(mailBody);
        Assert.True(mailBody!.Success);

        var financesResponse = await client.PostAsJsonAsync("/api/GetFinances", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, financesResponse.StatusCode);
        var financesBody = await financesResponse.Content.ReadFromJsonAsync<FinancesResponse>();
        Assert.NotNull(financesBody);
        Assert.True(financesBody!.Success);

        var historyResponse = await client.PostAsJsonAsync("/api/GetFinanceHistory", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, historyResponse.StatusCode);
        var historyBody = await historyResponse.Content.ReadFromJsonAsync<FinanceHistoryResponse>();
        Assert.NotNull(historyBody);
        Assert.True(historyBody!.Success);
    }

    private async Task<string> RegisterAndLoginAsync()
    {
        var email = $"team_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "TeamManager"
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
