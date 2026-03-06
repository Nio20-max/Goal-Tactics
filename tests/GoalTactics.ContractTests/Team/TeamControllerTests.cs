using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Team;
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
        Assert.True(resourcesBody.Money >= 0);

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
