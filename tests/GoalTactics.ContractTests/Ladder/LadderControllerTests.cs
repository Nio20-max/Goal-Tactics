using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Ladder;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Ladder;

public sealed class LadderControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public LadderControllerTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task Ladder_Challenge_RunMatch_And_RestoreStamina_Work()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var ladderResponse = await client.PostAsJsonAsync("/api/GetLadder", new IdRequest { Id = Guid.Empty });
        Assert.Equal(HttpStatusCode.OK, ladderResponse.StatusCode);
        var ladderBody = await ladderResponse.Content.ReadFromJsonAsync<LadderResponse>();
        Assert.NotNull(ladderBody);
        Assert.True(ladderBody!.Success);
        Assert.NotEqual(Guid.Empty, ladderBody.LadderId);
        Assert.NotEmpty(ladderBody.Teams);

        var mine = ladderBody.Teams.First(x => x.IsMine);
        var opponent = ladderBody.Teams.First(x => !x.IsMine);

        var challengeResponse = await client.PostAsJsonAsync("/api/GetLadderChallenge", new LadderChallengeRequest { TeamId = opponent.TeamId });
        Assert.Equal(HttpStatusCode.OK, challengeResponse.StatusCode);
        var challengeBody = await challengeResponse.Content.ReadFromJsonAsync<LadderChallengeResponse>();
        Assert.NotNull(challengeBody);
        Assert.True(challengeBody!.Success);
        Assert.NotNull(challengeBody.HomeTeam);
        Assert.NotNull(challengeBody.AwayTeam);
        Assert.Equal(25, challengeBody.StaminaCost);
        Assert.Equal(mine.TeamId, challengeBody.HomeTeam!.TeamId);

        var runMatchResponse = await client.PostAsJsonAsync("/api/RunMatch", new LadderChallengeRequest { TeamId = opponent.TeamId });
        Assert.Equal(HttpStatusCode.OK, runMatchResponse.StatusCode);
        var runMatchBody = await runMatchResponse.Content.ReadFromJsonAsync<LadderMatchResponse>();
        Assert.NotNull(runMatchBody);
        Assert.True(runMatchBody!.Success);
        Assert.NotNull(runMatchBody.MatchReport);
        Assert.True(int.TryParse(runMatchBody.Stamina, out var staminaAfter) && staminaAfter <= challengeBody.Stamina - 25);

        var restoreResponse = await client.PostAsJsonAsync("/api/RestoreStamina", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, restoreResponse.StatusCode);

        var challengeAfterRestoreResponse = await client.PostAsJsonAsync("/api/GetLadderChallenge", new LadderChallengeRequest { TeamId = opponent.TeamId });
        Assert.Equal(HttpStatusCode.OK, challengeAfterRestoreResponse.StatusCode);
        var challengeAfterRestoreBody = await challengeAfterRestoreResponse.Content.ReadFromJsonAsync<LadderChallengeResponse>();
        Assert.NotNull(challengeAfterRestoreBody);
        Assert.Equal(100, challengeAfterRestoreBody!.Stamina);
    }

    private async Task<string> RegisterAndLoginAsync()
    {
        var email = $"ladder_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "LadderManager"
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
