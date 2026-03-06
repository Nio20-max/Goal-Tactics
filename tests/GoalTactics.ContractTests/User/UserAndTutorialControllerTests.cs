using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Tutorial;
using GoalTactics.Contracts.User;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.User;

public sealed class UserAndTutorialControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public UserAndTutorialControllerTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task Tutorial_Flow_Works_WithAuth()
    {
        var token = await RegisterAndLoginAsync();

        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var getResponse = await client.PostAsJsonAsync("/api/GetTutorial", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, getResponse.StatusCode);
        var getBody = await getResponse.Content.ReadFromJsonAsync<TutorialResponse>();
        Assert.NotNull(getBody);
        Assert.True(getBody!.Success);

        var finishResponse = await client.PostAsJsonAsync("/api/FinishTutorialStep", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, finishResponse.StatusCode);
        var finishBody = await finishResponse.Content.ReadFromJsonAsync<TutorialResponse>();
        Assert.NotNull(finishBody);
        Assert.True(finishBody!.Success);
        Assert.NotEqual(getBody.CurrentStep?.TopicID, finishBody.CurrentStep?.TopicID);

        var resetResponse = await client.PostAsJsonAsync("/api/ResetTutorial", new TutorialRequest { TopicID = "welcome" });
        Assert.Equal(HttpStatusCode.OK, resetResponse.StatusCode);
        var resetBody = await resetResponse.Content.ReadFromJsonAsync<TutorialResponse>();
        Assert.NotNull(resetBody);
        Assert.Equal("welcome", resetBody!.CurrentStep?.TopicID);
    }

    [Fact]
    public async Task Preferences_CanBeSavedAndLoaded()
    {
        var token = await RegisterAndLoginAsync();

        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var saveResponse = await client.PostAsJsonAsync("/api/SavePreferences", new PreferencesRequest
        {
            NotificationSettings = new NotificationSettings
            {
                AuctionOverbid = false,
                MatchResults = true,
                LineupIncomplete = false,
                FriendInvite = true,
                IneffectiveTraining = false,
                FriendlyMatch = true,
                System = true,
                AuctionEnd = false
            }
        });

        Assert.Equal(HttpStatusCode.OK, saveResponse.StatusCode);

        var getResponse = await client.PostAsJsonAsync("/api/GetPreferences", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, getResponse.StatusCode);

        var body = await getResponse.Content.ReadFromJsonAsync<PreferencesResponse>();
        Assert.NotNull(body);
        Assert.True(body!.Success);
        Assert.NotNull(body.NotificationSettings);
        Assert.False(body.NotificationSettings!.AuctionOverbid);
        Assert.False(body.NotificationSettings.AuctionEnd);
    }

    private async Task<string> RegisterAndLoginAsync()
    {
        var email = $"user_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "PhaseOneUser"
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
        Assert.False(string.IsNullOrWhiteSpace(loginBody!.Token));

        return loginBody.Token!;
    }
}
