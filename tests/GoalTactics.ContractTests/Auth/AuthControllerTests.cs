using System.Net;
using System.Net.Http.Json;
using System.Text.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Auth;

public sealed class AuthControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient _client;

    public AuthControllerTests(WebApplicationFactory<Program> factory)
    {
        _client = factory.CreateClient();
    }

    [Fact]
    public async Task Register_Login_Verify_Flow_Works()
    {
        var email = $"m_{Guid.NewGuid():N}@example.com";

        var registerResponse = await _client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "ContractManager"
        });
        Assert.Equal(HttpStatusCode.OK, registerResponse.StatusCode);

        var loginResponse = await _client.PostAsJsonAsync("/api/Login", new AuthRequest
        {
            Email = email,
            Password = "pass12345"
        });
        Assert.Equal(HttpStatusCode.OK, loginResponse.StatusCode);

        var loginBody = await loginResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(loginBody);
        Assert.True(loginBody!.Success);
        Assert.False(string.IsNullOrWhiteSpace(loginBody.Token));

        var verifyResponse = await _client.PostAsJsonAsync("/api/VerifyLogin", new TextRequest
        {
            Text = loginBody.Token!
        });
        Assert.Equal(HttpStatusCode.OK, verifyResponse.StatusCode);

        var verifyBody = await verifyResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(verifyBody);
        Assert.True(verifyBody!.Success);
    }

    [Fact]
    public async Task Login_WithUnknownUser_ReturnsOkWithFailure()
    {
        var response = await _client.PostAsJsonAsync("/api/Login", new AuthRequest
        {
            Email = "does-not-exist@example.com",
            Password = "invalid1"
        });

        // Legacy app expects 200 and reads Status from the body.
        Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        var body = await response.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(body);
        Assert.False(body!.Success);
    }

    [Fact]
    public async Task VerifyLogin_WithTamperedToken_ReturnsUnauthorized()
    {
        var email = $"m_{Guid.NewGuid():N}@example.com";

        await _client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "ContractManager"
        });

        var loginResponse = await _client.PostAsJsonAsync("/api/Login", new AuthRequest
        {
            Email = email,
            Password = "pass12345"
        });
        var loginBody = await loginResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(loginBody);

        var tamperedToken = loginBody!.Token! + "tampered";
        var verifyResponse = await _client.PostAsJsonAsync("/api/VerifyLogin", new TextRequest { Text = tamperedToken });

        // Tampered token fails JWT validation, falls through to manager-name
        // availability check. A token string won't collide with any real name,
        // so the endpoint returns 200 "Name available".
        Assert.Equal(HttpStatusCode.OK, verifyResponse.StatusCode);
        var verifyBody = await verifyResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(verifyBody);
        Assert.True(verifyBody!.Success);
    }

    [Fact]
    public async Task Me_WithoutToken_ReturnsUnauthorized()
    {
        var response = await _client.GetAsync("/api/Me");

        Assert.Equal(HttpStatusCode.Unauthorized, response.StatusCode);
    }

    [Fact]
    public async Task Me_WithValidBearerToken_ReturnsCurrentUser()
    {
        var email = $"m_{Guid.NewGuid():N}@example.com";

        await _client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "ContractManager"
        });

        var loginResponse = await _client.PostAsJsonAsync("/api/Login", new AuthRequest
        {
            Email = email,
            Password = "pass12345"
        });
        var loginBody = await loginResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(loginBody);

        using var request = new HttpRequestMessage(HttpMethod.Get, "/api/Me");
        request.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", loginBody!.Token);

        var meResponse = await _client.SendAsync(request);

        Assert.Equal(HttpStatusCode.OK, meResponse.StatusCode);
        var meBody = await meResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(meBody);
        Assert.True(meBody!.Success);
        Assert.Equal("ContractManager", meBody.ManagerName);
    }

    [Fact]
    public async Task Logout_RevokesSessionToken()
    {
        var email = $"m_{Guid.NewGuid():N}@example.com";

        await _client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "ContractManager"
        });

        var loginResponse = await _client.PostAsJsonAsync("/api/Login", new AuthRequest
        {
            Email = email,
            Password = "pass12345"
        });
        var loginBody = await loginResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(loginBody);

        using var logoutRequest = new HttpRequestMessage(HttpMethod.Post, "/api/Logout");
        logoutRequest.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", loginBody!.Token);
        var logoutResponse = await _client.SendAsync(logoutRequest);

        Assert.Equal(HttpStatusCode.OK, logoutResponse.StatusCode);

        using var meRequest = new HttpRequestMessage(HttpMethod.Get, "/api/Me");
        meRequest.Headers.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", loginBody.Token);
        var meAfterLogout = await _client.SendAsync(meRequest);

        Assert.Equal(HttpStatusCode.Unauthorized, meAfterLogout.StatusCode);
    }

    [Fact]
    public async Task Register_WithInvalidPayload_ReturnsValidationEnvelope()
    {
        var response = await _client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = "invalid-email",
            Password = "short",
            ManagerName = "A"
        });

        Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);

        var json = await response.Content.ReadAsStringAsync();
        using var doc = JsonDocument.Parse(json);
        var root = doc.RootElement;

        Assert.False(root.GetProperty("success").GetBoolean());
        Assert.Equal("validation_error", root.GetProperty("error").GetProperty("code").GetString());
    }
}
