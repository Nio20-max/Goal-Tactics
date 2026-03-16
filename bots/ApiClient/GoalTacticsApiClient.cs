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
    private readonly BotApiTranslator _botTranslator = new();
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
        await EnsureSuccessWithDetailsAsync(response, endpoint);
        return await response.Content.ReadFromJsonAsync<T>(JsonOptions);
    }

    private async Task PostAsync(string endpoint, object? body = null)
    {
        body ??= new RequestObject();
        var response = await _http.PostAsJsonAsync(endpoint, body, JsonOptions);
        await EnsureSuccessWithDetailsAsync(response, endpoint);
    }

    private async Task<T?> GetAsync<T>(string endpoint)
    {
        var response = await _http.GetAsync(endpoint);
        await EnsureSuccessWithDetailsAsync(response, endpoint);
        return await response.Content.ReadFromJsonAsync<T>(JsonOptions);
    }

    private static async Task EnsureSuccessWithDetailsAsync(HttpResponseMessage response, string endpoint)
    {
        if (response.IsSuccessStatusCode)
        {
            return;
        }

        var body = response.Content is null ? string.Empty : await response.Content.ReadAsStringAsync();
        if (body.Length > 800)
        {
            body = body[..800] + "...";
        }

        throw new HttpRequestException(
            $"Request failed: {(int)response.StatusCode} {response.ReasonPhrase} at {endpoint}. Body: {body}");
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

    public Task<SkillCardsResponse?> GetSkillCardsAsync()
        => PostAsync<SkillCardsResponse>("/api/GetSkillCards");

    public Task UseSkillCardAsync(string playerId)
        => PostAsync("/api/UseSkillCard", new IdRequest { Id = playerId });

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

    // ── Bot-friendly translation layer ─────────────────────────

    /// <summary>
    /// Executes any known bot API endpoint and returns a compact, bot-friendly translation
    /// of the request + response payload.
    /// </summary>
    public async Task<BotApiTranslation> ExecuteForBotAsync(string endpoint, object? request = null)
    {
        var normalized = BotApiTranslator.NormalizeEndpoint(endpoint);

        return normalized switch
        {
            "Register" => _botTranslator.Translate(normalized, request, await RegisterAsync(AsRequest<RegisterRequest>(request, normalized))),
            "Login" => _botTranslator.Translate(normalized, request, await LoginAsync(AsRequest<LoginRequest>(request, normalized))),
            "Ping" => _botTranslator.Translate(normalized, request, await PingAsync()),
            "GetCountries" => _botTranslator.Translate(normalized, request, await GetCountriesAsync()),
            "GetMyResources" => _botTranslator.Translate(normalized, request, await GetMyResourcesAsync()),
            "GetMyTeamExtendedInfo" => _botTranslator.Translate(normalized, request, await GetMyTeamExtendedInfoAsync()),
            "GetSquad" => _botTranslator.Translate(normalized, request, await GetSquadAsync()),
            "GetSkillCards" => _botTranslator.Translate(normalized, request, await GetSkillCardsAsync()),

            "UseSkillCard" => await ExecuteNoResultAsync<IdRequest>(normalized, request, r => UseSkillCardAsync(r.Id)),
            "GetLineups" => _botTranslator.Translate(normalized, request, await GetLineupsAsync()),
            "SaveLineup" => await ExecuteNoResultAsync(normalized, request, r => SaveLineupAsync(r), AsRequest<SaveLineupRequest>(request, normalized)),

            "SearchTransfermarket" => _botTranslator.Translate(normalized, request, await SearchTransfermarketAsync(AsRequest<SearchTransfermarketRequest>(request, normalized))),
            "BidPlayer" => _botTranslator.Translate(normalized, request, await BidPlayerAsync(AsRequest<BidRequest>(request, normalized))),
            "GetTransfermarketFavourites" => _botTranslator.Translate(normalized, request, await GetTransfermarketFavouritesAsync()),
            "UpdateTransfermarketFavourites" => await ExecuteNoResultAsync<IdRequest>(normalized, request, r => UpdateTransfermarketFavouritesAsync(r.Id)),

            "GetTeamTraining" => _botTranslator.Translate(normalized, request, await GetTeamTrainingAsync()),
            "SaveTeamTraining" => await ExecuteNoResultAsync(normalized, request, r => SaveTeamTrainingAsync(r), AsRequest<SaveTrainingRequest>(request, normalized)),
            "SaveIndividualTraining" => await ExecuteNoResultAsync<IdRequest>(normalized, request, r => SaveIndividualTrainingAsync(r.Id)),
            "BookTrainingCamp" => await ExecuteNoResultAsync(normalized, request, r => BookTrainingCampAsync(r), AsRequest<BookTrainingCampRequest>(request, normalized)),

            "GetScoutedPlayers" => _botTranslator.Translate(normalized, request, await GetScoutedPlayersAsync()),
            "InstructScout" => await ExecuteNoResultAsync(normalized, request, r => InstructScoutAsync(r), AsRequest<InstructScoutRequest>(request, normalized)),
            "RecruitScoutedPlayer" => await ExecuteNoResultAsync<IdRequest>(normalized, request, r => RecruitScoutedPlayerAsync(r.Id)),

            "GetSponsorOffers" => _botTranslator.Translate(normalized, request, await GetSponsorOffersAsync()),
            "AcceptSponsor" => await ExecuteNoResultAsync<IdRequest>(normalized, request, r => AcceptSponsorAsync(r.Id)),

            "GetStadium" => _botTranslator.Translate(normalized, request, await GetStadiumAsync()),
            "BuildStadium" => await ExecuteNoResultAsync<IdRequest>(normalized, request, r => BuildStadiumAsync(r.Id)),
            "BuildPlaces" => await ExecuteNoResultAsync(normalized, request, r => BuildPlacesAsync(r), AsRequest<BuildPlacesRequest>(request, normalized)),

            "GetFriends" => _botTranslator.Translate(normalized, request, await GetFriendsAsync(AsRequest<TextRequest>(request, normalized).Text)),
            "Like" => await ExecuteNoResultAsync<IdRequest>(normalized, request, r => LikeAsync(r.Id)),
            "Accept" => await ExecuteNoResultAsync<IdRequest>(normalized, request, r => AcceptFriendAsync(r.Id)),
            "SendChallenge" => await ExecuteNoResultAsync<IdRequest>(normalized, request, r => SendChallengeAsync(r.Id)),

            "PostChatMessage" => await ExecuteNoResultAsync(normalized, request, r => PostChatMessageAsync(r.Message), AsRequest<PostChatMessageRequest>(request, normalized)),
            "GetChatHistory" => _botTranslator.Translate(normalized, request, await GetChatHistoryAsync()),

            "GetLadder" => _botTranslator.Translate(normalized, request, await GetLadderAsync()),
            "RunMatch" => await ExecuteNoResultAsync(normalized, request, r => RunMatchAsync(r.TeamId), AsRequest<RunMatchRequest>(request, normalized)),
            "RestoreStamina" => await ExecuteNoResultAsync(normalized, request, _ => RestoreStaminaAsync(), new RequestObject()),

            "WatchAd" => _botTranslator.Translate(normalized, request, await WatchAdAsync()),
            "ClaimDailyReward" => _botTranslator.Translate(normalized, request, await ClaimDailyRewardAsync()),
            _ => throw new ArgumentOutOfRangeException(nameof(endpoint), endpoint, "Unsupported bot endpoint for translation.")
        };
    }

    private async Task<BotApiTranslation> ExecuteNoResultAsync<TRequest>(
        string endpoint,
        object? originalRequest,
        Func<TRequest, Task> operation,
        TRequest? typedRequest = default)
        where TRequest : class, new()
    {
        var request = typedRequest ?? AsRequest<TRequest>(originalRequest, endpoint);
        await operation(request);
        return _botTranslator.Translate(endpoint, request, null);
    }

    private static TRequest AsRequest<TRequest>(object? request, string endpoint)
        where TRequest : class, new()
    {
        if (request is null)
        {
            return new TRequest();
        }

        if (request is TRequest typed)
        {
            return typed;
        }

        throw new ArgumentException(
            $"Endpoint '{endpoint}' expects request type {typeof(TRequest).Name}, but got {request.GetType().Name}.",
            nameof(request));
    }
}
