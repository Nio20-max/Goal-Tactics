using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Behaviors;
using GoalTactics.Bots.Client.Database;
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

    // Behaviors
    private readonly TransferMarketBehavior _transferMarket;
    private readonly StadiumBehavior _stadium;
    private readonly TrainingBehavior _training;
    private readonly SocialBehavior _social;
    private readonly DailyRoutineBehavior _dailyRoutine;
    private readonly LineupBehavior _lineup;

    // Rate-limit tracking (action type → last execution UTC)
    private readonly Dictionary<string, DateTime> _rateLimits = new(StringComparer.Ordinal);

    public BotRunner(BotConfig config)
    {
        _config = config;
        _db = new BotDatabase(config.DatabasePath);
        _api = new GoalTacticsApiClient(config.ApiBaseUrl);
        _scheduler = new BotScheduler(_db);
        _factory = new BotFactory(config, _db, _api);

        _transferMarket = new TransferMarketBehavior(_db);
        _stadium = new StadiumBehavior();
        _training = new TrainingBehavior();
        _social = new SocialBehavior(_db, config);
        _dailyRoutine = new DailyRoutineBehavior();
        _lineup = new LineupBehavior();
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
        var ping = await _api.PingAsync();
        if (ping is null || !ping.Success)
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

            foreach (long botId in dueBotIds)
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

        // Authenticate: reuse token or re-login
        if (!await EnsureAuthenticatedAsync(bot))
        {
            Console.Error.WriteLine($"[Bot {bot.BotId}] Authentication failed, skipping session.");
            return;
        }

        _api.SetToken(bot.ValidationToken);

        // Execute behaviors in priority order with rate-limit checks
        await ExecuteWithRateLimit("daily", () => _dailyRoutine.ExecuteAsync(_api, bot));
        await ExecuteWithRateLimit("lineup", () => _lineup.ExecuteAsync(_api, bot));
        await ExecuteWithRateLimit("training", () => _training.ExecuteAsync(_api, bot));
        await ExecuteWithRateLimit("stadium", () => _stadium.ExecuteAsync(_api, bot));
        await ExecuteWithRateLimit("transfer", () => _transferMarket.ExecuteAsync(_api, bot));
        await ExecuteWithRateLimit("social", () => _social.ExecuteAsync(_api, bot));

        _api.ClearToken();
        Console.WriteLine($"[Bot {bot.BotId}] Session complete.");
    }

    private async Task<bool> EnsureAuthenticatedAsync(BotRecord bot)
    {
        // Try existing token first
        if (!string.IsNullOrEmpty(bot.ValidationToken))
        {
            _api.SetToken(bot.ValidationToken);
            try
            {
                var resources = await _api.GetMyResourcesAsync();
                if (resources is not null) return true;
            }
            catch
            {
                // Token expired — re-login below
            }
        }

        // Re-login
        string email = $"bot_{bot.TeamName.Replace(" ", "_").ToLowerInvariant()}@goaltactics.bot";
        var loginResult = await _api.LoginAsync(new LoginRequest
        {
            Email = email,
            Password = bot.Password
        });

        if (loginResult is null || !loginResult.Success)
            return false;

        _db.UpdateBotToken(bot.BotId, loginResult.Token);
        bot.ValidationToken = loginResult.Token;
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
}
