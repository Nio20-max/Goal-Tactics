using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Behaviors;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Humanization;
using GoalTactics.Bots.Client.Neural;
using GoalTactics.Bots.Client.Scheduling;
using GoalTactics.Bots.Client.Telemetry;
using System.Text;

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
    private readonly BotActionNeuralPolicy _actionPolicy;
    private SimulationAuditWriter? _simulationAudit;

    // Behaviors
    private readonly TransferMarketBehavior _transferMarket;
    private readonly StadiumBehavior _stadium;
    private readonly TrainingBehavior _training;
    private readonly SocialBehavior _social;
    private readonly DailyRoutineBehavior _dailyRoutine;
    private readonly LineupBehavior _lineup;
    private readonly SkillCardBehavior _skillCard;

    // Rate-limit tracking ((botId:action) → last execution UTC)
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
        _actionPolicy = new BotActionNeuralPolicy(_db);

        _social = new SocialBehavior(_db, config, _human, _neural);
        _transferMarket = new TransferMarketBehavior(_db, _social, _neural, _human, _actionPolicy, _config);
        _stadium = new StadiumBehavior();
        _training = new TrainingBehavior(_db, _actionPolicy);
        _dailyRoutine = new DailyRoutineBehavior();
        _lineup = new LineupBehavior();
        _skillCard = new SkillCardBehavior();
    }

    public void Dispose()
    {
        _simulationAudit?.Dispose();
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

        if (_config.SimulateSeasons > 0)
        {
            await RunSeasonSimulationAsync(ct);
            return;
        }

        Console.WriteLine("[BotRunner] Entering main loop...");
        await MainLoopAsync(ct);
    }

    private async Task RunSeasonSimulationAsync(CancellationToken ct)
    {
        string runDir = Path.Combine(_config.SimulationOutputRoot, $"bots_client_sim_{DateTime.UtcNow:yyyyMMdd_HHmmss}");
        Directory.CreateDirectory(runDir);
        var simulationModelKey = Path.GetFileName(runDir);

        foreach (var bot in _db.GetAllBots())
        {
            _actionPolicy.EnsureBotModels(bot, simulationModelKey, forceReset: true);
        }

        _simulationAudit?.Dispose();
        _simulationAudit = _config.EnableSimulationAudit ? new SimulationAuditWriter(runDir) : null;
        _api.ConfigureAuditWriter(_simulationAudit);
        _api.SetAuditContext(null, null, null, "simulation-bootstrap");

        var seasonLines = new List<string>
        {
            "season,matchday,sessions,successes,auth_failures,night_sessions"
        };

        var reasonSamples = new List<string>();
        var actionCounts = new Dictionary<string, int>(StringComparer.OrdinalIgnoreCase);
        int totalSessions = 0;
        int totalSuccess = 0;
        int totalAuthFailures = 0;
        int totalNightSessions = 0;

        Console.WriteLine($"[BotRunner] Starting virtual simulation: seasons={_config.SimulateSeasons}, matchdays={_config.SimulateMatchdaysPerSeason}");
        Console.WriteLine($"[BotRunner] Simulation output: {runDir}");

        for (int season = 1; season <= _config.SimulateSeasons && !ct.IsCancellationRequested; season++)
        {
            for (int matchday = 1; matchday <= _config.SimulateMatchdaysPerSeason && !ct.IsCancellationRequested; matchday++)
            {
                var bots = _db.GetAllBots();
                int daySessions = 0;
                int daySuccess = 0;
                int dayAuthFailures = 0;
                int dayNightSessions = 0;

                foreach (var bot in bots)
                {
                    if (ct.IsCancellationRequested)
                    {
                        break;
                    }

                    _api.SetAuditContext(bot.BotId, season, matchday, "session");
                    BotSessionResult result;
                    try
                    {
                        result = await ExecuteBotSessionAsync(bot);
                    }
                    catch (Exception ex)
                    {
                        Console.Error.WriteLine($"[Sim] Bot session crashed for {bot.BotId}: {ex.Message}");
                        result = new BotSessionResult
                        {
                            Success = false,
                            DecisionReason = $"session-crash:{ex.GetType().Name}"
                        };
                        _simulationAudit?.LogError(bot.BotId, season, matchday, "session", ex.Message);
                    }
                    daySessions++;

                    if (result.Success)
                    {
                        daySuccess++;
                    }
                    else if (result.AuthFailed)
                    {
                        dayAuthFailures++;
                    }

                    if (result.NightSession)
                    {
                        dayNightSessions++;
                    }

                    foreach (var action in result.ActionsExecuted)
                    {
                        actionCounts.TryGetValue(action, out int count);
                        actionCounts[action] = count + 1;
                    }

                    _simulationAudit?.LogSessionResult(
                        bot.BotId,
                        bot.TeamName,
                        season,
                        matchday,
                        result.Success,
                        result.AuthFailed,
                        result.NightSession,
                        result.DecisionReason,
                        result.ActionsExecuted);

                    if (_config.CaptureSimulationSnapshots && matchday % _config.SimulationSnapshotStride == 0)
                    {
                        await CaptureSimulationSnapshotAsync(bot, season, matchday);
                    }

                    if (reasonSamples.Count < 200)
                    {
                        reasonSamples.Add($"season={season},matchday={matchday},bot={bot.BotId},team={bot.TeamName},reason={result.DecisionReason}");
                    }

                    // Light pacing to avoid bursting the API under higher bot counts.
                    await Task.Delay(75, ct);
                }

                totalSessions += daySessions;
                totalSuccess += daySuccess;
                totalAuthFailures += dayAuthFailures;
                totalNightSessions += dayNightSessions;

                seasonLines.Add($"{season},{matchday},{daySessions},{daySuccess},{dayAuthFailures},{dayNightSessions}");
                Console.WriteLine($"[Sim] season={season} matchday={matchday} sessions={daySessions} success={daySuccess} auth_fail={dayAuthFailures} night={dayNightSessions}");
            }
        }

        await File.WriteAllLinesAsync(Path.Combine(runDir, "season-simulation.csv"), seasonLines, ct);

        var actionsCsv = new List<string> { "action,count" };
        actionsCsv.AddRange(actionCounts.OrderByDescending(x => x.Value).Select(x => $"{x.Key},{x.Value}"));
        await File.WriteAllLinesAsync(Path.Combine(runDir, "action-counts.csv"), actionsCsv, ct);

        var groups = _db.GetAllGroups();
        var report = new StringBuilder();
        report.AppendLine("# Bots Client Virtual Season Simulation Report");
        report.AppendLine();
        report.AppendLine($"- Simulated seasons: {_config.SimulateSeasons}");
        report.AppendLine($"- Matchdays per season: {_config.SimulateMatchdaysPerSeason}");
        report.AppendLine($"- Total sessions: {totalSessions}");
        report.AppendLine($"- Successful sessions: {totalSuccess}");
        report.AppendLine($"- Auth failures: {totalAuthFailures}");
        report.AppendLine($"- Night sessions: {totalNightSessions}");
        report.AppendLine($"- Groups observed: {groups.Count}");
        report.AppendLine($"- Action NN pretraining: {_actionPolicy.TrainingReport}");
        report.AppendLine();

        report.AppendLine("## Top Executed Actions");
        foreach (var row in actionCounts.OrderByDescending(x => x.Value).Take(20))
        {
            report.AppendLine($"- {row.Key}: {row.Value}");
        }
        report.AppendLine();

        report.AppendLine("## Decision Reason Samples");
        foreach (var sample in reasonSamples.Take(80))
        {
            report.AppendLine($"- {sample}");
        }
        report.AppendLine();

        report.AppendLine("## Group Behavior Snapshot");
        foreach (var group in groups.OrderBy(g => g.GroupId))
        {
            var bots = _db.GetBotsInGroup(group.GroupId);
            var recentMessages = _db.GetRecentGroupChatMessages(group.GroupId, 50);
            report.AppendLine($"- Group {group.GroupId} ({group.Name}): bots={bots.Count}, recent_messages={recentMessages.Count}");
        }
        report.AppendLine();

        report.AppendLine("## Deep Error/Mistake Findings");
        report.AppendLine("1. Virtual-season simulation currently maps one bot online session to one simulated matchday step. This is fast but still a proxy for real season pacing.");
        report.AppendLine("2. Session behavior can be skipped by confidence/rollback guardrails, which can make low-confidence bots look less active than expected during simulation windows.");
        report.AppendLine("3. Group behavior visibility depends on recent chat writes and group formation timing; groups with low social coordination can appear underactive in short windows.");
        report.AppendLine("4. API-dependent outcomes (auction timing, ladder challenges, sponsor responses) still rely on live backend state, so deterministic replay is limited.");

        await File.WriteAllTextAsync(Path.Combine(runDir, "simulation-report.md"), report.ToString(), ct);
        Console.WriteLine($"[BotRunner] Virtual simulation finished. Report written to {runDir}");
    }

    private async Task CaptureSimulationSnapshotAsync(BotRecord bot, int season, int matchday)
    {
        if (_simulationAudit is null)
        {
            return;
        }

        _api.SetAuditContext(bot.BotId, season, matchday, "snapshot");

        try
        {
            if (!await EnsureAuthenticatedAsync(bot))
            {
                _simulationAudit.LogError(bot.BotId, season, matchday, "snapshot", "authentication-failed");
                return;
            }

            _api.SetToken(bot.ValidationToken);
            var teamInfo = await _api.ExecuteForBotAsync("GetMyTeamExtendedInfo");
            var resources = await _api.ExecuteForBotAsync("GetMyResources");
            var squad = await _api.ExecuteForBotAsync("GetSquad");
            var stadium = await _api.ExecuteForBotAsync("GetStadium");
            var training = await _api.ExecuteForBotAsync("GetTeamTraining");
            var transferMarket = await _api.ExecuteForBotAsync("SearchTransfermarket", new SearchTransfermarketRequest());

            _simulationAudit.LogTeamSnapshot(
                bot.BotId,
                bot.TeamName,
                season,
                matchday,
                teamInfo.Output,
                resources.Output,
                stadium.Output,
                training.Output,
                transferMarket.Output);
            _simulationAudit.LogSquadSnapshot(
                bot.BotId,
                bot.TeamName,
                season,
                matchday,
                BotApiTranslationReader.GetObjectList(squad, "players"),
                BotApiTranslationReader.GetObjectList(squad, "playersOnTransfermarket"));
        }
        catch (Exception ex)
        {
            _simulationAudit.LogError(bot.BotId, season, matchday, "snapshot", ex.Message);
        }
        finally
        {
            _api.ClearToken();
        }
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
                _actionPolicy.EnsureBotModels(bot);
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

                _actionPolicy.EnsureBotModels(bot);

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
    private async Task<BotSessionResult> ExecuteBotSessionAsync(BotRecord bot)
    {
        Console.WriteLine($"[Bot {bot.BotId}] Waking up ({bot.TeamName})...");
        var result = new BotSessionResult();
        _actionPolicy.EnsureBotModels(bot);

        var sessionPlan = _human.BuildSessionPlan(bot);
        var emotion = _human.GetEmotionalState(bot);

        // Authenticate: reuse token or re-login
        if (!await EnsureAuthenticatedAsync(bot))
        {
            Console.Error.WriteLine($"[Bot {bot.BotId}] Authentication failed, skipping session.");
            result.AuthFailed = true;
            result.DecisionReason = "authentication-failed";
            _human.UpdateLearningAfterSession(bot, success: false, nightSession: false, interrupted: false, executedActions: 0, authFailed: true);
            return result;
        }

        _api.SetToken(bot.ValidationToken);

        if (_human.ShouldRollbackToSafeMode(bot))
        {
            await ExecuteWithRateLimit(bot.BotId, "lineup", () => _lineup.ExecuteAsync(_api, bot, null));
            await ExecuteWithRateLimit(bot.BotId, "daily", () => _dailyRoutine.ExecuteAsync(_api, bot, null));
            _db.AddActionLog(bot.BotId, "rollback", "Safe mode active after repeated neural failures", true, bot.Risk);
            _api.ClearToken();
            Console.WriteLine($"[Bot {bot.BotId}] Safe-mode session complete.");
            result.Success = true;
            result.ActionsExecuted.Add("lineup");
            result.ActionsExecuted.Add("daily");
            result.DecisionReason = "rollback-safe-mode";
            _human.UpdateLearningAfterSession(bot, success: true, nightSession: false, interrupted: false, executedActions: result.ActionsExecuted.Count, authFailed: false);
            return result;
        }

        var nightPlan = await _neural.GetOrCreateNightPlanAsync(_api, bot);
        double confidence = (nightPlan.BidAggression + nightPlan.ScoutIntensity + emotion.Confidence) / 300.0;

        if (IsNightTime(bot))
        {
            await ExecuteNightCycleIfDueAsync(bot, nightPlan);
            _api.ClearToken();
            Console.WriteLine($"[Bot {bot.BotId}] Night session complete.");
            result.Success = true;
            result.NightSession = true;
            result.ActionsExecuted.AddRange(["night-lineup", "night-training", "night-skillcard", "night-transfer", "night-social"]);
            result.DecisionReason = "night-cycle";
            _human.UpdateLearningAfterSession(bot, success: true, nightSession: true, interrupted: false, executedActions: result.ActionsExecuted.Count, authFailed: false);
            return result;
        }

        if (!_human.ShouldExecuteByConfidence(bot, "session", confidence))
        {
            _api.ClearToken();
            result.DecisionReason = $"skipped-low-confidence-{confidence:F2}";
            _human.UpdateLearningAfterSession(bot, success: false, nightSession: false, interrupted: false, executedActions: 0, authFailed: false);
            return result;
        }

        if (_human.ShouldRunSelfAudit(bot))
        {
            _db.AddActionLog(bot.BotId, "self-audit", $"Session plan={sessionPlan.DurationMinutes}m interrupted={sessionPlan.Interrupted}", true, bot.Risk);
        }

        BotApiTranslation? resources = null;
        BotApiTranslation? squad = null;
        try
        {
            resources = await _api.ExecuteForBotAsync("GetMyResources");
            squad = await _api.ExecuteForBotAsync("GetSquad");
        }
        catch (HttpRequestException ex)
        {
            Console.Error.WriteLine($"[ActionError] bootstrap: {ex.Message}");
        }

        if (resources is not null && resources.Success && squad is not null)
        {
            var money = BotApiTranslationReader.GetDecimal(resources.Output, "money");
            var stars = BotApiTranslationReader.GetDecimal(resources.Output, "gtStars");
            int squadSize = BotApiTranslationReader.GetObjectList(squad, "players").Count;
            _human.UpdateKpisAndScenario(bot, money, stars, squadSize);
        }

        // Execute behaviors in priority order with rate-limit checks
        await ExecuteWithRateLimit(bot.BotId, "daily", () => _dailyRoutine.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("daily");
        await ExecuteWithRateLimit(bot.BotId, "lineup", () => _lineup.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("lineup");
        await ExecuteWithRateLimit(bot.BotId, "training", () => _training.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("training");
        await ExecuteWithRateLimit(bot.BotId, "skillcard", () => _skillCard.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("skillcard");
        if (_config.SimulateSeasons <= 0)
        {
            await ExecuteWithRateLimit(bot.BotId, "stadium", () => _stadium.ExecuteAsync(_api, bot, nightPlan));
            result.ActionsExecuted.Add("stadium");
        }
        await ExecuteWithRateLimit(bot.BotId, "transfer", () => _transferMarket.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("transfer");
        await ExecuteWithRateLimit(bot.BotId, "social", () => _social.ExecuteAsync(_api, bot, nightPlan));
        result.ActionsExecuted.Add("social");

        if (sessionPlan.Interrupted)
        {
            _db.AddActionLog(bot.BotId, "session", "Interrupted naturally to simulate human behavior", true, bot.Risk);
        }

        _api.ClearToken();
        Console.WriteLine($"[Bot {bot.BotId}] Session complete.");
        result.Success = true;
        result.DecisionReason = $"confidence={confidence:F2};interrupted={sessionPlan.Interrupted}";
        _human.UpdateLearningAfterSession(bot, success: true, nightSession: false, interrupted: sessionPlan.Interrupted, executedActions: result.ActionsExecuted.Count, authFailed: false);
        return result;
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
        await ExecuteWithRateLimit(bot.BotId, "night-lineup", () => _lineup.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit(bot.BotId, "night-training", () => _training.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit(bot.BotId, "night-skillcard", () => _skillCard.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit(bot.BotId, "night-transfer", () => _transferMarket.ExecuteAsync(_api, bot, nightPlan));
        await ExecuteWithRateLimit(bot.BotId, "night-social", () => _social.ExecuteAsync(_api, bot, nightPlan));

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
            catch (HttpRequestException ex) when (ex.Message.Contains("429 Too Many Requests", StringComparison.OrdinalIgnoreCase))
            {
                // Under temporary throttling, keep using the known token instead of forcing re-login.
                return true;
            }
            catch
            {
                // Token expired — re-login below
            }
        }

        // Re-login
        string email = BotFactory.SanitizeEmail(bot.TeamName);
        BotApiTranslation loginResult;
        try
        {
            loginResult = await _api.ExecuteForBotAsync("Login", new LoginRequest
            {
                Email = email,
                Password = bot.Password
            });
        }
        catch (HttpRequestException ex)
        {
            Console.Error.WriteLine($"[Auth] Re-login failed for {bot.BotId}: {ex.Message}");
            return false;
        }

        if (!loginResult.Success)
            return false;

        var token = BotApiTranslationReader.GetString(loginResult.Output, "token");
        if (string.IsNullOrWhiteSpace(token))
            return false;

        _db.UpdateBotToken(bot.BotId, token);
        bot.ValidationToken = token;
        return true;
    }

    private async Task ExecuteWithRateLimit(string botId, string action, Func<Task> execute)
    {
        var rateLimitKey = $"{botId}:{action}";
        int cooldown = action switch
        {
            "transfer" => _config.Rates.BidCooldownSeconds,
            "social" => _config.Rates.ChatCooldownSeconds,
            _ => _config.Rates.DefaultCooldownSeconds
        };

        if (_rateLimits.TryGetValue(rateLimitKey, out var lastRun))
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
        catch (HttpRequestException ex)
        {
            Console.Error.WriteLine($"[ActionError] {action}: {ex.Message}");
        }
        catch (Exception ex)
        {
            Console.Error.WriteLine($"[ActionError] {action}: {ex.Message}");
        }

        _rateLimits[rateLimitKey] = DateTime.UtcNow;
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

    private sealed class BotSessionResult
    {
        public bool Success { get; set; }
        public bool AuthFailed { get; set; }
        public bool NightSession { get; set; }
        public string DecisionReason { get; set; } = "";
        public List<string> ActionsExecuted { get; } = [];
    }
}
