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

    private async Task<(string Token, Guid UserId)> RegisterAndLoginAsync(string managerName)
    {
        var email = $"chat_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = managerName
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
        Assert.True(loginBody!.Success);
        Assert.False(string.IsNullOrWhiteSpace(loginBody.Token));

        return (loginBody.Token!, loginBody.UserId);
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
    public async Task Post_PrivateAndGroupChat_WorkAsExpected()
    {
        var userA = await RegisterAndLoginAsync("ChatA");
        var userB = await RegisterAndLoginAsync("ChatB");

        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userA.Token);

        var privateMessage = "Hey privately";
        var privatePost = await client.PostAsJsonAsync("/api/PostChatMessage", new ChatPostRequest
        {
            Message = privateMessage,
            Channel = "private",
            TargetUserId = userB.UserId
        });

        Assert.Equal(HttpStatusCode.OK, privatePost.StatusCode);

        var privateHistoryResponse = await client.PostAsJsonAsync("/api/GetChatHistory", new ChatHistoryRequest
        {
            Channel = "private",
            TargetUserId = userB.UserId
        });
        Assert.Equal(HttpStatusCode.OK, privateHistoryResponse.StatusCode);

        var privateHistory = await privateHistoryResponse.Content.ReadFromJsonAsync<ChatHistoryResponse>();
        Assert.NotNull(privateHistory);
        Assert.True(privateHistory!.Success);
        Assert.Contains(privateHistory.Messages, m => m.Message == privateMessage);

        // Group chat requires a group key; for existing fixture users we expect it to be available.
        var contactsResp = await client.PostAsJsonAsync("/api/GetChatContacts", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, contactsResp.StatusCode);

        var contactsBody = await contactsResp.Content.ReadFromJsonAsync<ChatContactsResponse>();
        Assert.NotNull(contactsBody);

        // If group key exists, we can post and read group messages.
        if (!string.IsNullOrWhiteSpace(contactsBody!.GroupKey))
        {
            var groupMessage = "Hello group";
            var groupPost = await client.PostAsJsonAsync("/api/PostChatMessage", new ChatPostRequest
            {
                Message = groupMessage,
                Channel = "group"
            });
            Assert.Equal(HttpStatusCode.OK, groupPost.StatusCode);

            var groupHistoryResponse = await client.PostAsJsonAsync("/api/GetChatHistory", new ChatHistoryRequest
            {
                Channel = "group"
            });
            Assert.Equal(HttpStatusCode.OK, groupHistoryResponse.StatusCode);

            var groupHistory = await groupHistoryResponse.Content.ReadFromJsonAsync<ChatHistoryResponse>();
            Assert.NotNull(groupHistory);
            Assert.True(groupHistory!.Success);
            Assert.Contains(groupHistory.Messages, m => m.Message == groupMessage);
        }
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
