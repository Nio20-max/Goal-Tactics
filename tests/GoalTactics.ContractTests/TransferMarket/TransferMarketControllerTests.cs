using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.TransferMarket;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.TransferMarket;

public sealed class TransferMarketControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient _client;

    public TransferMarketControllerTests(WebApplicationFactory<Program> factory)
    {
        _client = factory.CreateClient();
    }

    [Fact]
    public async Task Search_And_SearchTransfermarket_Return_LegacySafe_Payload()
    {
        var token = await RegisterAndLoginAsync();
        _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        foreach (var endpoint in new[] { "/api/Transfermarket/Search", "/api/Transfermarket/SearchTransfermarket" })
        {
            var response = await _client.PostAsJsonAsync(endpoint, new TransferSearchRequest());
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);

            var body = await response.Content.ReadFromJsonAsync<TransferSearchResponse>();
            Assert.NotNull(body);
            Assert.True(body!.Success);
            Assert.NotNull(body.Players);
            Assert.NotNull(body.Favorites);
            Assert.NotNull(body.Sellings);

            var raw = await response.Content.ReadAsStringAsync();
            using var json = JsonDocument.Parse(raw);
            Assert.True(json.RootElement.TryGetProperty("Players", out _));
            Assert.True(json.RootElement.TryGetProperty("Favorites", out _));
            Assert.True(json.RootElement.TryGetProperty("Sellings", out _));
            Assert.True(json.RootElement.TryGetProperty("MyTeamId", out _));
        }
    }

    [Fact]
    public async Task GetDetails_And_GetBid_Return_LegacyCompatible_Structures()
    {
        var token = await RegisterAndLoginAsync();
        _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var searchResponse = await _client.PostAsJsonAsync("/api/Transfermarket/Search", new TransferSearchRequest());
        Assert.Equal(HttpStatusCode.OK, searchResponse.StatusCode);
        var searchBody = await searchResponse.Content.ReadFromJsonAsync<TransferSearchResponse>();
        Assert.NotNull(searchBody);
        Assert.NotEmpty(searchBody!.Players);

        var auctionId = searchBody.Players[0].AuctionId;

        var detailsResponse = await _client.PostAsJsonAsync("/api/Transfermarket/GetDetails", new TransferDetailsRequest { AuctionId = auctionId });
        Assert.Equal(HttpStatusCode.OK, detailsResponse.StatusCode);
        var detailsBody = await detailsResponse.Content.ReadFromJsonAsync<TransferDetailsResponse>();
        Assert.NotNull(detailsBody);
        Assert.True(detailsBody!.Success);
        Assert.NotNull(detailsBody.Player);
        Assert.NotNull(detailsBody.AuctionPlayer);
        Assert.Equal(14, detailsBody.AuctionPlayer.Skills.Length);

        var getBidResponse = await _client.PostAsJsonAsync("/api/Transfermarket/GetBid", new TransferDetailsRequest { AuctionId = auctionId });
        Assert.Equal(HttpStatusCode.OK, getBidResponse.StatusCode);

        var getBidRaw = await getBidResponse.Content.ReadAsStringAsync();
        using var getBidJson = JsonDocument.Parse(getBidRaw);
        Assert.True(getBidJson.RootElement.TryGetProperty("ID", out var id));
        Assert.True(getBidJson.RootElement.TryGetProperty("Player", out var player));
        Assert.Equal(auctionId, id.GetGuid());
        Assert.Equal(auctionId, player.GetProperty("AuctionId").GetGuid());
    }

    [Fact]
    public async Task UpdateTransfermarketFavourites_Returns_FavoritesPayload_Not_GenericAck()
    {
        var token = await RegisterAndLoginAsync();
        _client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);

        var searchResponse = await _client.PostAsJsonAsync("/api/Transfermarket/Search", new TransferSearchRequest());
        var searchBody = await searchResponse.Content.ReadFromJsonAsync<TransferSearchResponse>();
        Assert.NotNull(searchBody);
        Assert.NotEmpty(searchBody!.Players);

        var response = await _client.PostAsJsonAsync("/api/Transfermarket/UpdateTransfermarketFavourites", new IdRequest { Id = searchBody.Players[0].AuctionId });
        Assert.Equal(HttpStatusCode.OK, response.StatusCode);

        var raw = await response.Content.ReadAsStringAsync();
        using var json = JsonDocument.Parse(raw);
        Assert.True(json.RootElement.TryGetProperty("Favorites", out _));
        Assert.True(json.RootElement.TryGetProperty("Players", out _));
        Assert.True(json.RootElement.TryGetProperty("Sellings", out _));
    }

    private async Task<string> RegisterAndLoginAsync()
    {
        var email = $"transfer_{Guid.NewGuid():N}@example.com";

        var registerResponse = await _client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = "TransferManager"
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
        return loginBody.Token;
    }
}
