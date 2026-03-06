using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Chat;
using GoalTactics.Contracts.Common;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Chat;

public sealed class ChatControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public ChatControllerTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task Post_ThenHistory_ReturnsPersistedMessage()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var marker = $"chat-{Guid.NewGuid():N}";
        var postResponse = await client.PostAsJsonAsync("/api/Post", new ChatPostRequest { Message = marker });
        Assert.Equal(HttpStatusCode.OK, postResponse.StatusCode);

        var historyResponse = await client.PostAsJsonAsync("/api/GetChatHistory", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, historyResponse.StatusCode);

        var body = await historyResponse.Content.ReadFromJsonAsync<ChatHistoryResponse>();
        Assert.NotNull(body);
        Assert.True(body!.Success);
        Assert.Contains(body.Messages, x => x.Message == marker);
    }

    [Fact]
    public async Task Post_WithTooLongMessage_ReturnsBadRequest()
    {
        var token = await RegisterAndLoginAsync();
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var tooLong = new string('x', 513);
        var response = await client.PostAsJsonAsync("/api/Post", new ChatPostRequest { Message = tooLong });

        Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
        var body = await response.Content.ReadFromJsonAsync<ResponseObject>();
        Assert.NotNull(body);
        Assert.False(body!.Success);
    }

    private async Task<string> RegisterAndLoginAsync()
    {
        var email = $"chat_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "ChatTester"
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
