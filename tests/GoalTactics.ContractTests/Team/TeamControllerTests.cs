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
        Assert.Equal(300, sponsorBody!.Main!.Stars);
        Assert.Equal(200, sponsorBody.Secondary!.Stars);
        Assert.Equal(100, sponsorBody.NegotiateCost);

        var stadiumResponse = await client.PostAsJsonAsync("/api/Stadium/GetStadium", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, stadiumResponse.StatusCode);
        var stadiumBody = await stadiumResponse.Content.ReadFromJsonAsync<StadiumResponse>();
        Assert.NotNull(stadiumBody);
        Assert.Equal(500, stadiumBody!.ChangeNameCost);
        Assert.Equal(0, stadiumBody.RenewGrassCost);
        Assert.Equal(10, stadiumBody.SpeedupCost);

        var beforeBidResources = await (await client.PostAsJsonAsync("/api/Team/GetMyResources", new RequestObject())).Content.ReadFromJsonAsync<ResourcesResponse>();
        Assert.NotNull(beforeBidResources);

        var bidResponse = await client.PostAsJsonAsync("/api/Transfermarket/PlaceBid", new BidRequest { Id = Guid.NewGuid(), Bid = 12345 });
        Assert.Equal(HttpStatusCode.OK, bidResponse.StatusCode);

        var afterBidResources = await (await client.PostAsJsonAsync("/api/Team/GetMyResources", new RequestObject())).Content.ReadFromJsonAsync<ResourcesResponse>();
        Assert.NotNull(afterBidResources);
        Assert.Equal(beforeBidResources!.GTStars - 200, afterBidResources!.GTStars);

        var buildPlacesResponse = await client.PostAsJsonAsync("/api/GetBuildPlaces", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, buildPlacesResponse.StatusCode);
        var buildPlacesBody = await buildPlacesResponse.Content.ReadFromJsonAsync<BuildPlacesResponse>();
        Assert.NotNull(buildPlacesBody);
        var buildTarget = buildPlacesBody!.Places.First(place => place.CanBuild);

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
