using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Training;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Training;

public sealed class TrainingControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public TrainingControllerTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task Legacy_Training_Endpoints_Return_Legacy_Shaped_Data()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var trainingResponse = await client.PostAsJsonAsync("/api/GetTraining", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, trainingResponse.StatusCode);

        var trainingBody = await trainingResponse.Content.ReadFromJsonAsync<TeamTrainingResponse>();
        Assert.NotNull(trainingBody);
        Assert.True(trainingBody!.Success);
        Assert.NotNull(trainingBody.TrainingCamp);
        Assert.NotNull(trainingBody.IndividualTraining);

        var playerId = trainingBody.IndividualTraining!.Players!.First().Id;

        var startResponse = await client.PostAsJsonAsync("/api/StartIndividualTraining", new IndividualTrainingRequest
        {
            Id = playerId,
            SkillType = "Finishing"
        });
        Assert.Equal(HttpStatusCode.OK, startResponse.StatusCode);

        var startBody = await startResponse.Content.ReadFromJsonAsync<IndividualTrainingData>();
        Assert.NotNull(startBody);
        Assert.True(startBody!.Success);
        Assert.Contains(startBody.Players!, player => player.Id == playerId && player.HasIndividualTraining);

        var cancelResponse = await client.PostAsJsonAsync("/api/CancelIndividualTraining", new IndividualTrainingRequest { Id = playerId });
        Assert.Equal(HttpStatusCode.OK, cancelResponse.StatusCode);

        var cancelBody = await cancelResponse.Content.ReadFromJsonAsync<IndividualTrainingData>();
        Assert.NotNull(cancelBody);
        Assert.True(cancelBody!.Success);
        Assert.Contains(cancelBody.Players!, player => player.Id == playerId && !player.HasIndividualTraining);

        var campsResponse = await client.PostAsJsonAsync("/api/UpdateCamps", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, campsResponse.StatusCode);

        var campsBody = await campsResponse.Content.ReadFromJsonAsync<TrainingCampData>();
        Assert.NotNull(campsBody);
        Assert.True(campsBody!.Success);
        Assert.Equal(1000, campsBody.UpdateCampsCost);
        Assert.NotEmpty(campsBody.CampItems!);
    }

    private async Task<string> RegisterAndLoginAsync()
    {
        var email = $"training_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "TrainingManager"
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