using System.Net.Http.Json;
using System.Text;
using System.Text.Json;
using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;

namespace GoalTactics.Bots.Client.Neural;

public sealed class BotNeuralDecisionEngine
{
    private readonly BotConfig _config;
    private readonly BotDatabase _db;
    private readonly HttpClient _http;
    private readonly SemaphoreSlim _gate;

    public BotNeuralDecisionEngine(BotConfig config, BotDatabase db)
    {
        _config = config;
        _db = db;
        _http = new HttpClient
        {
            BaseAddress = new Uri(config.NeuralApiUrl.TrimEnd('/')),
            Timeout = TimeSpan.FromSeconds(Math.Max(5, config.NeuralRequestTimeoutSeconds))
        };
        _gate = new SemaphoreSlim(Math.Max(1, config.NeuralMaxConcurrentRequests));
    }

    public async Task<BotNightPlan> GetOrCreateNightPlanAsync(GoalTacticsApiClient api, BotRecord bot, CancellationToken ct = default)
    {
        string localDate = GetLocalDate(bot);

        var existing = _db.GetNightPlan(bot.BotId, localDate);
        var existingPlan = BotNightPlan.FromJson(existing?.PlanJson);
        if (existingPlan is not null)
        {
            return existingPlan;
        }

        var fallback = BotNightPlan.CreateFallback(bot);

        if (!_config.NeuralEnabled || !IsNightTime(bot))
        {
            _db.UpsertNightPlan(bot.BotId, localDate, fallback.ToJson(), _config.NeuralEnabled ? "fallback-daytime" : "fallback-disabled");
            return fallback;
        }

        var snapshot = await BuildNightSnapshotAsync(api, bot);
        var plan = await RequestNightPlanAsync(bot, snapshot, fallback, ct);

        _db.UpsertNightPlan(bot.BotId, localDate, plan.ToJson(), _config.NeuralEnabled ? "model" : "fallback");
        return plan;
    }

    public async Task<string> BuildGroupTransferMessageAsync(
        BotRecord bot,
        BotNightPlan plan,
        IReadOnlyList<string> desiredPlayers,
        IReadOnlyList<BotGroupChatMessageRecord> recentMessages,
        CancellationToken ct = default)
    {
        if (desiredPlayers.Count == 0)
        {
            return "No transfer targets this cycle.";
        }

        if (!_config.NeuralEnabled)
        {
            return BuildFallbackGroupMessage(plan, desiredPlayers);
        }

        var systemPrompt = """
            You write concise football manager group chat updates for autonomous bots.
            Keep style natural and short.
            Mention desired transfer targets and budget posture.
            Output plain text only, no markdown, <= 220 chars.
            """;

        var recent = recentMessages
            .TakeLast(5)
            .Select(m => $"[{m.CreatedAt}] {m.BotId}: {m.Message}");

        var userPrompt = $"""
            GroupId: {bot.GroupId}
            Team: {bot.TeamName}
            Manager: {bot.ManagerName}
            ChatTone: {plan.ChatTone}
            CoordinationLevel: {plan.CoordinationLevel}
            TransferProfile: {plan.TransferTargetProfile}
            DesiredPlayers: {string.Join(", ", desiredPlayers.Take(5))}
            RecentGroupMessages:
            {string.Join("\n", recent)}
            """;

        try
        {
            var text = await RequestTextCompletionAsync(systemPrompt, userPrompt, 120, 0.35, ct);
            if (!string.IsNullOrWhiteSpace(text))
            {
                return text.Trim();
            }
        }
        catch
        {
            // Fall back to deterministic text when model/API is unavailable.
        }

        return BuildFallbackGroupMessage(plan, desiredPlayers);
    }

    public async Task<string> BuildSocialMessageAsync(
        BotRecord bot,
        BotNightPlan plan,
        IReadOnlyList<string> closeContacts,
        IReadOnlyList<string> recentGlobalMessages,
        CancellationToken ct = default)
    {
        if (!_config.NeuralEnabled)
        {
            return BuildFallbackSocialMessage(plan, closeContacts);
        }

        var systemPrompt = """
            You write concise football manager global chat messages for autonomous bots.
            Keep style natural and short, not robotic.
            Mention social cooperation and one concrete intent for the next matchday.
            Output plain text only, no markdown, <= 220 chars.
            """;

        var userPrompt = $"""
            Team: {bot.TeamName}
            Manager: {bot.ManagerName}
            ChatTone: {plan.ChatTone}
            CoordinationLevel: {plan.CoordinationLevel}
            GroupId: {bot.GroupId}
            CloseContacts: {string.Join(", ", closeContacts.Take(5))}
            RecentGlobalMessages:
            {string.Join("\n", recentGlobalMessages.TakeLast(4))}
            """;

        try
        {
            var text = await RequestTextCompletionAsync(systemPrompt, userPrompt, 120, 0.45, ct);
            if (!string.IsNullOrWhiteSpace(text))
            {
                return text.Trim();
            }
        }
        catch
        {
            // Fall back when model/API is unavailable.
        }

        return BuildFallbackSocialMessage(plan, closeContacts);
    }

    private static string BuildFallbackGroupMessage(BotNightPlan plan, IReadOnlyList<string> desiredPlayers)
    {
        string tone = plan.ChatTone switch
        {
            "supportive" => "Team update",
            "competitive" => "Priority targets",
            _ => "Transfer watch"
        };

        return $"{tone}: targeting {string.Join(", ", desiredPlayers.Take(3))}. Profile={plan.TransferTargetProfile}.";
    }

    private static string BuildFallbackSocialMessage(BotNightPlan plan, IReadOnlyList<string> closeContacts)
    {
        var tone = plan.ChatTone switch
        {
            "competitive" => "Pushing hard for the next matchday",
            "supportive" => "Building momentum together",
            _ => "Preparing for the next fixtures"
        };

        var contact = closeContacts.FirstOrDefault();
        return string.IsNullOrWhiteSpace(contact)
            ? $"{tone}. Friendly challenge window open." 
            : $"{tone}. Coordinating with {contact} and scouting challenge opportunities.";
    }

    private async Task<Dictionary<string, object?>> BuildNightSnapshotAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        var resources = await api.ExecuteForBotAsync("GetMyResources");
        var squad = await api.ExecuteForBotAsync("GetSquad");
        var ladder = await api.ExecuteForBotAsync("GetLadder");
        var market = await api.ExecuteForBotAsync("SearchTransfermarket", new SearchTransfermarketRequest
        {
            Talent = new RangeFilter { Min = bot.YouthFocus >= 60 ? 65 : 40, Max = 100 },
            Age = new RangeFilter { Min = 16, Max = bot.YouthFocus >= 60 ? 24 : 30 }
        });

        var topMarket = BotApiTranslationReader.GetObjectList(market, "players")
            .Take(8)
            .Select(p => new Dictionary<string, object?>
            {
                ["name"] = BotApiTranslationReader.GetString(p, "name"),
                ["age"] = BotApiTranslationReader.GetInt(p, "age"),
                ["talent"] = BotApiTranslationReader.GetInt(p, "talent"),
                ["strength"] = BotApiTranslationReader.GetDecimal(p, "strength"),
                ["bid"] = BotApiTranslationReader.GetLong(p, "bid")
            })
            .ToList();

        return new Dictionary<string, object?>
        {
            ["resources"] = resources.Output,
            ["squadPlayers"] = BotApiTranslationReader.GetObjectList(squad, "players"),
            ["ladderTeams"] = BotApiTranslationReader.GetObjectList(ladder, "teams"),
            ["marketTop"] = topMarket
        };
    }

    private async Task<BotNightPlan> RequestNightPlanAsync(
        BotRecord bot,
        Dictionary<string, object?> snapshot,
        BotNightPlan fallback,
        CancellationToken ct)
    {
        var systemPrompt = """
            You are a night strategy planner for autonomous football manager bots.
            Output ONLY valid JSON with this schema:
            {
              "ShouldBid": boolean,
              "BidAggression": integer 0-100,
              "ConsiderSelling": boolean,
              "ScoutEnabled": boolean,
              "ScoutIntensity": integer 0-100,
              "IndividualTrainingSlots": integer 0-3,
              "ChatTone": "supportive"|"neutral"|"competitive",
              "CoordinationLevel": integer 0-100,
              "TransferTargetProfile": string
            }
            No markdown, no extra keys.
            """;

        var userPrompt = BuildNightUserPrompt(bot, snapshot, fallback);

        try
        {
            var text = await RequestTextCompletionAsync(systemPrompt, userPrompt, 280, 0.2, ct);
            var parsed = TryParseJsonPlan(text);
            if (parsed is not null)
            {
                NormalizePlan(parsed);
                return parsed;
            }
        }
        catch
        {
            // Fall back when model or local API is unavailable.
        }

        return fallback;
    }

    private static string BuildNightUserPrompt(BotRecord bot, Dictionary<string, object?> snapshot, BotNightPlan fallback)
    {
        var payload = new
        {
            bot = new
            {
                bot.BotId,
                bot.TeamName,
                bot.ManagerName,
                bot.Activity,
                bot.Risk,
                bot.YouthFocus,
                bot.SocialScore,
                bot.StarsDaily,
                bot.GroupId,
                bot.Timezone
            },
            fallback,
            snapshot
        };

        return JsonSerializer.Serialize(payload);
    }

    private async Task<string> RequestTextCompletionAsync(
        string systemPrompt,
        string userPrompt,
        int maxTokens,
        double temperature,
        CancellationToken ct)
    {
        await _gate.WaitAsync(ct);
        try
        {
            var request = new
            {
                model = "lfm25-local",
                messages = new[]
                {
                    new { role = "system", content = systemPrompt },
                    new { role = "user", content = userPrompt }
                },
                max_tokens = maxTokens,
                temperature
            };

            using var response = await _http.PostAsJsonAsync("/v1/chat/completions", request, ct);
            response.EnsureSuccessStatusCode();

            using var stream = await response.Content.ReadAsStreamAsync(ct);
            using var document = await JsonDocument.ParseAsync(stream, cancellationToken: ct);

            if (document.RootElement.TryGetProperty("choices", out var choices) &&
                choices.ValueKind == JsonValueKind.Array &&
                choices.GetArrayLength() > 0)
            {
                var first = choices[0];
                if (first.TryGetProperty("message", out var message) &&
                    message.TryGetProperty("content", out var content))
                {
                    return content.GetString() ?? string.Empty;
                }
            }

            return string.Empty;
        }
        finally
        {
            _gate.Release();
        }
    }

    private static BotNightPlan? TryParseJsonPlan(string text)
    {
        if (string.IsNullOrWhiteSpace(text))
        {
            return null;
        }

        string candidate = text.Trim();
        int start = candidate.IndexOf('{');
        int end = candidate.LastIndexOf('}');
        if (start >= 0 && end > start)
        {
            candidate = candidate[start..(end + 1)];
        }

        try
        {
            return JsonSerializer.Deserialize<BotNightPlan>(candidate);
        }
        catch (JsonException)
        {
            return null;
        }
    }

    private static void NormalizePlan(BotNightPlan plan)
    {
        plan.BidAggression = Math.Clamp(plan.BidAggression, 0, 100);
        plan.ScoutIntensity = Math.Clamp(plan.ScoutIntensity, 0, 100);
        plan.IndividualTrainingSlots = Math.Clamp(plan.IndividualTrainingSlots, 0, 3);
        plan.CoordinationLevel = Math.Clamp(plan.CoordinationLevel, 0, 100);

        if (string.IsNullOrWhiteSpace(plan.ChatTone))
        {
            plan.ChatTone = "neutral";
        }

        if (string.IsNullOrWhiteSpace(plan.TransferTargetProfile))
        {
            plan.TransferTargetProfile = "balanced";
        }
    }

    private bool IsNightTime(BotRecord bot)
    {
        var localHour = GetLocalHour(bot);
        int start = _config.NightPlanningStartHourLocal;
        int end = _config.NightPlanningEndHourLocal;

        if (start == end)
        {
            return true;
        }

        if (start < end)
        {
            return localHour >= start && localHour < end;
        }

        return localHour >= start || localHour < end;
    }

    private static int GetLocalHour(BotRecord bot)
    {
        var utcNow = DateTime.UtcNow;
        try
        {
            var tz = TimeZoneInfo.FindSystemTimeZoneById(bot.Timezone);
            return TimeZoneInfo.ConvertTimeFromUtc(utcNow, tz).Hour;
        }
        catch
        {
            return utcNow.Hour;
        }
    }

    private static string GetLocalDate(BotRecord bot)
    {
        var utcNow = DateTime.UtcNow;
        try
        {
            var tz = TimeZoneInfo.FindSystemTimeZoneById(bot.Timezone);
            return TimeZoneInfo.ConvertTimeFromUtc(utcNow, tz).ToString("yyyy-MM-dd");
        }
        catch
        {
            return utcNow.ToString("yyyy-MM-dd");
        }
    }
}
