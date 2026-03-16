using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Behaviors;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Humanization;
using GoalTactics.Bots.Client.Neural;
using GoalTactics.Bots.Client.Scheduling;

namespace GoalTactics.Bots.Client;

/// <summary>
/// Main bot execution loop: initializes the database, registers bots,
/// and runs the scheduler → wake → behave → reschedule cycle.
/// </summary>
public sealed class BotRunner : IDisposable
{
    private readonly BotConfig _config;
    private readonly BotDatabase _db;
    private readonly GoalTacticsApiClient _api;
    private readonly BotScheduler _scheduler;
    private readonly BotFactory _factory;
    private readonly BotNeuralDecisionEngine _neural;
    private readonly BotHumanizationService _human;

    // Behaviors
    private readonly TransferMarketBehavior _transferMarket;
    private readonly StadiumBehavior _stadium;
    private readonly TrainingBehavior _training;
    private readonly SocialBehavior _social;
    private readonly DailyRoutineBehavior _dailyRoutine;
    private readonly LineupBehavior _lineup;
    private readonly SkillCardBehavior _skillCard;

    // Rate-limit tracking (action type → last execution UTC)
    private readonly Dictionary<string, DateTime> _rateLimits = new(StringComparer.Ordinal);

    public BotRunner(BotConfig config)
    {
        _config = config;
        _db = new BotDatabase(config.DatabasePath);
        _api = new GoalTacticsApiClient(config.ApiBaseUrl);
        _scheduler = new BotScheduler(_db);
        _factory = new BotFactory(config, _db, _api);
        _neural = new BotNeuralDecisionEngine(config, _db);
        _human = new BotHumanizationService(config, _db);

        _social = new SocialBehavior(_db, config, _human);
        _transferMarket = new TransferMarketBehavior(_db, _social, _neural, _human, _config);
        _stadium = new StadiumBehavior();
        _training = new TrainingBehavior();
        _dailyRoutine = new DailyRoutineBehavior();
        _lineup = new LineupBehavior();
        _skillCard = new SkillCardBehavior();
    }

    public void Dispose()
    {
        _api.Dispose();
        _db.Dispose();
    }

    /// <summary>
    /// Entry point: ensure bots are registered, then loop forever.
    /// </summary>
    public async Task RunAsync(CancellationToken ct)
    {
        Console.WriteLine($"[BotRunner] Starting with {_config.BotCount} target bots...");

        // Verify API is reachable
        var ping = await _api.ExecuteForBotAsync("Ping");
        if (!ping.Success)
        {
            Console.Error.WriteLine("[BotRunner] API ping failed. Aborting.");
            return;
        }
        Console.WriteLine("[BotRunner] API is reachable.");

        // Ensure we have enough bots registered
        await EnsureBotsRegisteredAsync(ct);

        Console.WriteLine("[BotRunner] Entering main loop...");
        await MainLoopAsync(ct);
    }

    private async Task EnsureBotsRegisteredAsync(CancellationToken ct)
    {
        int existing = _db.GetBotCount();
        int needed = _config.BotCount - existing;

        if (needed <= 0)
        {
            Console.WriteLine($"[BotRunner] {existing} bots already registered (target: {_config.BotCount}).");
            return;
        }

        Console.WriteLine($"[BotRunner] Registering {needed} new bots...");
        for (int i = 0; i < needed && !ct.IsCancellationRequested; i++)
        {
            var bot = await _factory.CreateBotAsync();
            if (bot is not null)
            {
                // Schedule the bot's first online time (shortly in the future)
                _scheduler.ScheduleNextOnline(bot);
            }

            // Brief pause to avoid hammering the API
            await Task.Delay(200, ct);
        }
    }

    /// <summary>
    /// Main loop: poll scheduler → wake bots → execute behaviors → reschedule.
    /// </summary>
    private async Task MainLoopAsync(CancellationToken ct)
    {
        while (!ct.IsCancellationRequested)
        {
            var dueBotIds = _scheduler.GetDueBots(_config.SchedulerBatchSize);

            if (dueBotIds.Count == 0)
            {
                await Task.Delay(_config.SchedulerPollIntervalSeconds * 1000, ct);
                continue;
            }

            foreach (string botId in dueBotIds)
            {
                if (ct.IsCancellationRequested) break;

                var bot = _db.GetBot(botId);
                if (bot is null) continue;

                try
                {
                    await ExecuteBotSessionAsync(bot);
                }
                catch (HttpRequestException ex)
                {
                    Console.Error.WriteLine($"[BotRunner] HTTP error for bot {bot.BotId}: {ex.Message}");
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine($"[BotRunner] Error for bot {bot.BotId}: {ex.Message}");
                }
                finally
                {
                    // Always reschedule
                    _scheduler.ScheduleNextOnline(bot);
                }
            }
        }
    }

    /// <summary>
    /// Execute a single bot's online session: authenticate, run all behaviors, log off.
    /// </summary>
    private async Task ExecuteBotSessionAsync(BotRecord bot)
    {
        Console.WriteLine($"[Bot {bot.BotId}] Waking up ({bot.TeamName})...");

        var sessionPlan = _human.BuildSessionPlan(bot);
        var emotion = _human.GetEmotionalState(bot);

        // Authenticate: reuse token or re-login
        if (!await EnsureAuthenticatedAsync(bot))
        {
            Console.Error.WriteLine($"[Bot {bot.BotId}] Authentication failed, skipping session.");
            return;
        }

        _api.SetToken(bot.ValidationToken);

        if (_human.ShouldRollbackToSafeMode(bot))
        {
            await ExecuteWithRateLimit("lineup", () => _lineup.ExecuteAsync(_api, bot, null));
            await ExecuteWithRateLimit("daily", () => _dailyRoutine.ExecuteAsync(_api, bot, null));
            _db.AddActionLog(bot.BotId, "rollback", "Safe mode active after repeated neural failures", true, bot.Risk);
            _api.ClearToken();
            Console.WriteLine($"[Bot {bot.BotId}] Safe-mode session complete.");
            return;
        }

        var nightPlan = await _neural.GetOrCreateNightPlanAsync(_api, bot);
        double confidence = (nightPlan.BidAggression + nightPlan.ScoutIntensity + emotion.Confidence) / 300.0;

        if (IsNightTime(bot))
        {
            await ExecuteNightCycleIfDueAsync(bot, nightPlan);
            _api.ClearToken();
            Console.WriteLine($"[Bot {bot.BotId}] Night session complete.");
            return;
        }

        if (!_human.ShouldExecuteByConfidence(bot, "session", confidence))
        {
            _api.ClearToken();
            return;
        }

        if (_human.ShouldRunSelfAudit(bot))
        {
            _db.AddActionLog(bot.BotId, "self-audit", $"Session plan={sessionPlan.DurationMinutes}m interrupted={sessionPlan.Interrupted}", true, bot.Risk);
        }

        var resources = await _api.ExecuteForBotAsync("GetMyResources");
        var squad = await _api.ExecuteForBotAsync("GetSquad");
        if (resources.Success)
        {
            var money = BotApiTranslationReader.GetDecimal(resources.Output, "money");
            var stars = BotApiTranslationReader.GetDecimal(resources.Output, "gtStars");
            int squadSize = BotApiTranslationReader.GetObjectList(squad, "players").Count;
            _human.UpdateKpisAndScenario(bot, money, stars, squadSize);
        }

        // Execute behaviors in priority order with rate-limit checks
        await ExecuteWithRateLimit("daily", () => _dailyRoutine.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("lineup", () => _lineup.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("training", () => _training.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("skillcard", () => _skillCard.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("stadium", () => _stadium.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("transfer", () => _transferMarket.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("social", () => _social.ExecuteAsync(_api, bot, nightPlan));

        if (sessionPlan.Interrupted)
        {
            _db.AddActionLog(bot.BotId, "session", "Interrupted naturally to simulate human behavior", true, bot.Risk);
        }

        _api.ClearToken();
        Console.WriteLine($"[Bot {bot.BotId}] Session complete.");
    }

    private async Task ExecuteNightCycleIfDueAsync(BotRecord bot, BotNightPlan nightPlan)
    {
        string localDate = GetLocalDate(bot);
        if (_db.HasNightCycleRun(bot.BotId, localDate))
        {
            return;
        }

        Console.WriteLine($"[Bot {bot.BotId}] Running night cycle ({localDate})...");

        // Night cycle focuses on strategic actions decided by the nightly plan.
        await ExecuteWithRateLimit("night-lineup", () => _lineup.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("night-training", () => _training.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("night-skillcard", () => _skillCard.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("night-transfer", () => _transferMarket.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit("night-social", () => _social.ExecuteAsync(_api, bot, nightPlan));

        _db.MarkNightCycleRun(bot.BotId, localDate);
    }

    private async Task<bool> EnsureAuthenticatedAsync(BotRecord bot)
    {
        // Try existing token first
        if (!string.IsNullOrEmpty(bot.ValidationToken))
        {
            _api.SetToken(bot.ValidationToken);
            try
            {
                var resources = await _api.ExecuteForBotAsync("GetMyResources");
                if (resources.Success) return true;
            }
            catch
            {
                // Token expired — re-login below
            }
        }

        // Re-login
        string email = BotFactory.SanitizeEmail(bot.TeamName);
        var loginResult = await _api.ExecuteForBotAsync("Login", new LoginRequest
        {
            Email = email,
            Password = bot.Password
        });

        if (!loginResult.Success)
            return false;

        var token = BotApiTranslationReader.GetString(loginResult.Output, "token");
        if (string.IsNullOrWhiteSpace(token))
            return false;

        _db.UpdateBotToken(bot.BotId, token);
        bot.ValidationToken = token;
        return true;
    }

    private async Task ExecuteWithRateLimit(string action, Func<Task> execute)
    {
        int cooldown = action switch
        {
            "transfer" => _config.Rates.BidCooldownSeconds,
            "social" => _config.Rates.ChatCooldownSeconds,
            _ => _config.Rates.DefaultCooldownSeconds
        };

        if (_rateLimits.TryGetValue(action, out var lastRun))
        {
            double elapsed = (DateTime.UtcNow - lastRun).TotalSeconds;
            if (elapsed < cooldown) return;
        }

        try
        {
            await execute();
        }
        catch (HttpRequestException ex) when (ex.StatusCode == System.Net.HttpStatusCode.TooManyRequests)
        {
            Console.Error.WriteLine($"[RateLimit] {action}: rate limited, backing off.");
        }

        _rateLimits[action] = DateTime.UtcNow;
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
