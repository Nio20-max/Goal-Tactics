using System.Net.Http.Headers;
using System.Net.Http.Json;
using System.Text.Json;

namespace GoalTactics.Bots.Client.ApiClient;

/// <summary>
/// HTTP client wrapper that calls all confirmed GoalTactics API endpoints.
/// Each bot instance holds its own JWT token set via <see cref="SetToken"/>.
/// </summary>
public sealed class GoalTacticsApiClient : IDisposable
{
    private readonly HttpClient _http;
    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };

    public GoalTacticsApiClient(string baseUrl)
    {
        _http = new HttpClient { BaseAddress = new Uri(baseUrl) };
    }

    public void SetToken(string jwt)
    {
        _http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", jwt);
    }

    public void ClearToken()
    {
        _http.DefaultRequestHeaders.Authorization = null;
    }

    public void Dispose() => _http.Dispose();

    // ── Helpers ──────────────────────────────────────────────────

    private async Task<T?> PostAsync<T>(string endpoint, object? body = null)
    {
        body ??= new RequestObject();
        var response = await _http.PostAsJsonAsync(endpoint, body, JsonOptions);
        response.EnsureSuccessStatusCode();
        return await response.Content.ReadFromJsonAsync<T>(JsonOptions);
    }

    private async Task PostAsync(string endpoint, object? body = null)
    {
        body ??= new RequestObject();
        var response = await _http.PostAsJsonAsync(endpoint, body, JsonOptions);
        response.EnsureSuccessStatusCode();
    }

    private async Task<T?> GetAsync<T>(string endpoint)
    {
        var response = await _http.GetAsync(endpoint);
        response.EnsureSuccessStatusCode();
        return await response.Content.ReadFromJsonAsync<T>(JsonOptions);
    }

    // ── Authentication (no auth required) ───────────────────────

    public Task<RegisterResponse?> RegisterAsync(RegisterRequest request)
        => PostAsync<RegisterResponse>("/api/Register", request);

    public Task<LoginResponse?> LoginAsync(LoginRequest request)
        => PostAsync<LoginResponse>("/api/Login", request);

    // ── Common (no auth required) ───────────────────────────────

    public Task<PingResponse?> PingAsync()
        => GetAsync<PingResponse>("/api/Ping");

    public Task<CountriesResponse?> GetCountriesAsync()
        => PostAsync<CountriesResponse>("/api/GetCountries");

    // ── Team / Resources ────────────────────────────────────────

    public Task<ResourcesResponse?> GetMyResourcesAsync()
        => PostAsync<ResourcesResponse>("/api/GetMyResources");

    public Task<TeamExtendedInfoResponse?> GetMyTeamExtendedInfoAsync()
        => PostAsync<TeamExtendedInfoResponse>("/api/GetMyTeamExtendedInfo");

    // ── Squad ───────────────────────────────────────────────────

    public Task<SquadResponse?> GetSquadAsync()
        => PostAsync<SquadResponse>("/api/GetSquad");

    // ── Lineup ──────────────────────────────────────────────────

    public Task<LineupsResponse?> GetLineupsAsync()
        => PostAsync<LineupsResponse>("/api/GetLineups");

    public Task SaveLineupAsync(SaveLineupRequest request)
        => PostAsync("/api/SaveLineup", request);

    // ── Transfer Market ─────────────────────────────────────────

    public Task<TransfermarketResponse?> SearchTransfermarketAsync(SearchTransfermarketRequest request)
        => PostAsync<TransfermarketResponse>("/api/SearchTransfermarket", request);

    public Task<BidResponse?> BidPlayerAsync(BidRequest request)
        => PostAsync<BidResponse>("/api/BidPlayer", request);

    public Task<FavouritesResponse?> GetTransfermarketFavouritesAsync()
        => PostAsync<FavouritesResponse>("/api/GetTransfermarketFavourites");

    public Task UpdateTransfermarketFavouritesAsync(string auctionId)
        => PostAsync("/api/UpdateTransfermarketFavourites", new IdRequest { Id = auctionId });

    // ── Training ────────────────────────────────────────────────

    public Task<TrainingResponse?> GetTeamTrainingAsync()
        => PostAsync<TrainingResponse>("/api/GetTeamTraining");

    public Task SaveTeamTrainingAsync(SaveTrainingRequest request)
        => PostAsync("/api/SaveTeamTraining", request);

    public Task SaveIndividualTrainingAsync(string playerId)
        => PostAsync("/api/SaveIndividualTraining", new IndividualTrainingRequest { Id = playerId });

    public Task BookTrainingCampAsync(BookTrainingCampRequest request)
        => PostAsync("/api/BookTrainingCamp", request);

    // ── Scouting ────────────────────────────────────────────────

    public Task<ScoutedPlayersResponse?> GetScoutedPlayersAsync()
        => PostAsync<ScoutedPlayersResponse>("/api/GetScoutedPlayers");

    public Task InstructScoutAsync(InstructScoutRequest request)
        => PostAsync("/api/InstructScout", request);

    public Task RecruitScoutedPlayerAsync(string playerId)
        => PostAsync("/api/RecruitScoutedPlayer", new RecruitScoutedPlayerRequest { Id = playerId });

    // ── Sponsors ────────────────────────────────────────────────

    public Task<SponsorOffersResponse?> GetSponsorOffersAsync()
        => PostAsync<SponsorOffersResponse>("/api/GetSponsorOffers");

    public Task AcceptSponsorAsync(string sponsorId)
        => PostAsync("/api/AcceptSponsor", new IdRequest { Id = sponsorId });

    // ── Stadium ─────────────────────────────────────────────────

    public Task<StadiumResponse?> GetStadiumAsync()
        => PostAsync<StadiumResponse>("/api/GetStadium");

    public Task BuildStadiumAsync(string buildingId)
        => PostAsync("/api/BuildStadium", new BuildStadiumRequest { Id = buildingId });

    public Task BuildPlacesAsync(BuildPlacesRequest request)
        => PostAsync("/api/BuildPlaces", request);

    // ── Friends / Social ────────────────────────────────────────

    public Task<FriendsResponse?> GetFriendsAsync(string searchText = "")
        => PostAsync<FriendsResponse>("/api/GetFriends", new TextRequest { Text = searchText });

    public Task LikeAsync(string userId)
        => PostAsync("/api/Like", new IdRequest { Id = userId });

    public Task AcceptFriendAsync(string userId)
        => PostAsync("/api/Accept", new IdRequest { Id = userId });

    public Task SendChallengeAsync(string userId)
        => PostAsync("/api/SendChallenge", new SendChallengeRequest { Id = userId });

    // ── Chat ────────────────────────────────────────────────────

    public Task PostChatMessageAsync(string message)
        => PostAsync("/api/PostChatMessage", new PostChatMessageRequest
        {
            Message = message
        });

    public Task<ChatHistoryResponse?> GetChatHistoryAsync()
        => PostAsync<ChatHistoryResponse>("/api/GetChatHistory");

    // ── Ladder / Match ──────────────────────────────────────────

    public Task<LadderResponse?> GetLadderAsync()
        => PostAsync<LadderResponse>("/api/GetLadder");

    public Task RunMatchAsync(string teamId)
        => PostAsync("/api/RunMatch", new RunMatchRequest { TeamId = teamId });

    public Task RestoreStaminaAsync()
        => PostAsync("/api/RestoreStamina");

    // ── Shop / Rewards ──────────────────────────────────────────

    public Task<WatchAdResponse?> WatchAdAsync()
        => PostAsync<WatchAdResponse>("/api/WatchAd");

    public Task<GenericSuccessResponse?> ClaimDailyRewardAsync()
        => PostAsync<GenericSuccessResponse>("/api/ClaimDailyReward");
}
