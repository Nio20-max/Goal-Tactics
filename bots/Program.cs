using GoalTactics.Bots.Client;

// ── Parse CLI arguments ─────────────────────────────────────────
var config = ParseConfig(args);

Console.WriteLine($"GoalTactics Bot Client");
Console.WriteLine($"  API URL:   {config.ApiBaseUrl}");
Console.WriteLine($"  Neural:    {(config.NeuralEnabled ? "enabled" : "disabled")} ({config.NeuralApiUrl})");
Console.WriteLine($"  Database:  {config.DatabasePath}");
Console.WriteLine($"  Bot count: {config.BotCount}");
if (config.EnableHistoricalBootstrap)
{
    Console.WriteLine($"  Bootstrap: enabled ({config.HistoricalBootstrapSeasons} seasons, +{config.HistoricalBootstrapBotsPerSeason}/season)");
    Console.WriteLine($"  Brain:     {(config.HistoricalBootstrapCentralBrain ? "central-fast" : "session-by-session")}");
    Console.WriteLine($"  Fast/Real: {config.HistoricalBootstrapFastSeasons} fast + {config.HistoricalBootstrapRealSimulationSeasons} real");
    Console.WriteLine($"  Brain/day: {config.CentralBrainBotsPerMatchday} bots");
    Console.WriteLine($"  Game DB:   {config.GameDatabasePath}");
    Console.WriteLine($"  Anchor:    season {config.HistoricalBootstrapAnchorSeason} day1 @ {config.HistoricalBootstrapAnchorDayOneUtc}");
    Console.WriteLine($"  Status:    {config.HistoricalBootstrapStatusPath}");
}
if (config.SimulateSeasons > 0)
{
    Console.WriteLine($"  Sim mode:  {config.SimulateSeasons} seasons x {config.SimulateMatchdaysPerSeason} matchdays");
    Console.WriteLine($"  Sim delay: {config.SimulationInterSessionDelayMs}ms between bot sessions");
    Console.WriteLine($"  Sim engine:{(config.SimulateCentralBrainFastEngine ? " central-brain-fast" : " full-bot-api")}");
    Console.WriteLine($"  Sim out:   {config.SimulationOutputRoot}");
    Console.WriteLine($"  Sim audit: {(config.EnableSimulationAudit ? "enabled" : "disabled")}, snapshots={(config.CaptureSimulationSnapshots ? "on" : "off")}, stride={config.SimulationSnapshotStride}");
}
Console.WriteLine();

using var cts = new CancellationTokenSource();
Console.CancelKeyPress += (_, e) =>
{
    e.Cancel = true;
    cts.Cancel();
    Console.WriteLine("\nShutdown requested...");
};

using var runner = new BotRunner(config);
await runner.RunAsync(cts.Token);

Console.WriteLine("Bot client shut down.");

// ── Argument parsing ────────────────────────────────────────────

static BotConfig ParseConfig(string[] args)
{
    var config = new BotConfig();
    var map = ParseArgs(args);

    if (map.TryGetValue("api-url", out var url))
        config.ApiBaseUrl = url;

    if (map.TryGetValue("db-path", out var db))
        config.DatabasePath = db;

    if (map.TryGetValue("bot-count", out var count) && int.TryParse(count, out var n))
        config.BotCount = n;

    if (map.TryGetValue("max-groups", out var groups) && int.TryParse(groups, out var g))
        config.MaxGroups = g;

    if (map.TryGetValue("poll-interval", out var poll) && int.TryParse(poll, out var p))
        config.SchedulerPollIntervalSeconds = p;

    if (map.TryGetValue("neural-enabled", out var neuralEnabled) && bool.TryParse(neuralEnabled, out var enabled))
        config.NeuralEnabled = enabled;

    if (map.TryGetValue("neural-api-url", out var neuralApiUrl))
        config.NeuralApiUrl = neuralApiUrl;

    if (map.TryGetValue("neural-model", out var neuralModel) && !string.IsNullOrWhiteSpace(neuralModel))
        config.NeuralModel = neuralModel;

    if (map.TryGetValue("require-llm-for-chat", out var requireLlmForChat) && bool.TryParse(requireLlmForChat, out var requireLlm))
        config.RequireLlmForChat = requireLlm;

    if (map.TryGetValue("neural-max-concurrency", out var neuralConcurrency) && int.TryParse(neuralConcurrency, out var c))
        config.NeuralMaxConcurrentRequests = Math.Max(1, c);

    if (map.TryGetValue("neural-timeout-seconds", out var neuralTimeout) && int.TryParse(neuralTimeout, out var timeout))
        config.NeuralRequestTimeoutSeconds = Math.Max(5, timeout);

    if (map.TryGetValue("night-start-hour", out var nightStart) && int.TryParse(nightStart, out var startHour))
        config.NightPlanningStartHourLocal = ((startHour % 24) + 24) % 24;

    if (map.TryGetValue("night-end-hour", out var nightEnd) && int.TryParse(nightEnd, out var endHour))
        config.NightPlanningEndHourLocal = ((endHour % 24) + 24) % 24;

    if (map.TryGetValue("decision-confidence-threshold", out var confidenceThreshold) && double.TryParse(confidenceThreshold, out var threshold))
        config.DecisionConfidenceThreshold = Math.Clamp(threshold, 0.0, 1.0);

    if (map.TryGetValue("max-risky-actions-per-day", out var maxRisky) && int.TryParse(maxRisky, out var risky))
        config.MaxRiskyActionsPerDay = Math.Max(1, risky);

    if (map.TryGetValue("max-bid-percent", out var maxBidPercent) && double.TryParse(maxBidPercent, out var bidPercent))
        config.MaxBidPercentOfMoney = Math.Clamp(bidPercent, 0.01, 1.0);

    if (map.TryGetValue("min-stars-reserve", out var minStars) && int.TryParse(minStars, out var reserve))
        config.MinStarsReserve = Math.Max(0, reserve);

    if (map.TryGetValue("group-chat-min-delay-seconds", out var minDelay) && int.TryParse(minDelay, out var minDelaySeconds))
        config.GroupChatMinDelaySeconds = Math.Max(1, minDelaySeconds);

    if (map.TryGetValue("group-chat-max-delay-seconds", out var maxDelay) && int.TryParse(maxDelay, out var maxDelaySeconds))
        config.GroupChatMaxDelaySeconds = Math.Max(config.GroupChatMinDelaySeconds, maxDelaySeconds);

    if (map.TryGetValue("enable-multilingual-chat", out var multilingual) && bool.TryParse(multilingual, out var multilingualEnabled))
        config.EnableMultilingualChat = multilingualEnabled;

    if (map.TryGetValue("enable-rollback", out var rollback) && bool.TryParse(rollback, out var rollbackEnabled))
        config.EnableFallbackRollbackStrategy = rollbackEnabled;

    if (map.TryGetValue("enable-self-audit", out var selfAudit) && bool.TryParse(selfAudit, out var selfAuditEnabled))
        config.EnableSelfAudit = selfAuditEnabled;

    if (map.TryGetValue("simulate-seasons", out var simulateSeasons) && int.TryParse(simulateSeasons, out var seasons))
        config.SimulateSeasons = Math.Max(0, seasons);

    if (map.TryGetValue("simulate-matchdays", out var simulateMatchdays) && int.TryParse(simulateMatchdays, out var matchdays))
        config.SimulateMatchdaysPerSeason = Math.Max(1, matchdays);

    if (map.TryGetValue("simulate-inter-session-delay-ms", out var simulationInterSessionDelay) && int.TryParse(simulationInterSessionDelay, out var interSessionDelay))
        config.SimulationInterSessionDelayMs = Math.Max(0, interSessionDelay);

    if (map.TryGetValue("simulate-central-brain-fast", out var simulateCentralBrainFast) && bool.TryParse(simulateCentralBrainFast, out var centralBrainFast))
        config.SimulateCentralBrainFastEngine = centralBrainFast;

    if (map.TryGetValue("simulation-output-root", out var simulationOutputRoot) && !string.IsNullOrWhiteSpace(simulationOutputRoot))
        config.SimulationOutputRoot = simulationOutputRoot;

    if (map.TryGetValue("enable-simulation-audit", out var simulationAudit) && bool.TryParse(simulationAudit, out var simulationAuditEnabled))
        config.EnableSimulationAudit = simulationAuditEnabled;

    if (map.TryGetValue("capture-simulation-snapshots", out var simulationSnapshots) && bool.TryParse(simulationSnapshots, out var simulationSnapshotsEnabled))
        config.CaptureSimulationSnapshots = simulationSnapshotsEnabled;

    if (map.TryGetValue("simulation-snapshot-stride", out var simulationSnapshotStride) && int.TryParse(simulationSnapshotStride, out var stride))
        config.SimulationSnapshotStride = Math.Max(1, stride);

    if (map.TryGetValue("enable-historical-bootstrap", out var bootstrapEnabled) && bool.TryParse(bootstrapEnabled, out var bootEnabled))
        config.EnableHistoricalBootstrap = bootEnabled;

    if (map.TryGetValue("historical-bootstrap-central-brain", out var centralBrain) && bool.TryParse(centralBrain, out var useCentralBrain))
        config.HistoricalBootstrapCentralBrain = useCentralBrain;

    if (map.TryGetValue("game-db-path", out var gameDbPath) && !string.IsNullOrWhiteSpace(gameDbPath))
        config.GameDatabasePath = gameDbPath;

    if (map.TryGetValue("historical-bootstrap-fast-seasons", out var fastSeasons) && int.TryParse(fastSeasons, out var fSeasons))
        config.HistoricalBootstrapFastSeasons = Math.Max(0, fSeasons);

    if (map.TryGetValue("historical-bootstrap-normal-season-count", out var normalSeasonCount) && int.TryParse(normalSeasonCount, out var nSeasons))
    {
        var normalized = Math.Max(0, nSeasons);
        config.HistoricalBootstrapNormalSeasonCount = normalized;
        config.HistoricalBootstrapRealSimulationSeasons = normalized;
    }

    if (map.TryGetValue("historical-bootstrap-real-simulation-seasons", out var realSimulationSeasons) && int.TryParse(realSimulationSeasons, out var rSeasons))
        config.HistoricalBootstrapRealSimulationSeasons = Math.Max(0, rSeasons);

    // Keep backward compatibility with an alternate legacy key.
    if (map.TryGetValue("historical-bootstrap-real-season-count", out var realSeasonCountAlias) && int.TryParse(realSeasonCountAlias, out var rSeasonAlias))
        config.HistoricalBootstrapRealSimulationSeasons = Math.Max(0, rSeasonAlias);

    if (map.TryGetValue("central-brain-bots-per-matchday", out var centralBrainBotsPerMatchday) && int.TryParse(centralBrainBotsPerMatchday, out var brainBots))
        config.CentralBrainBotsPerMatchday = Math.Max(1, brainBots);

    if (map.TryGetValue("historical-bootstrap-seasons", out var bootstrapSeasons) && int.TryParse(bootstrapSeasons, out var bSeasons))
        config.HistoricalBootstrapSeasons = Math.Max(1, bSeasons);

    if (map.TryGetValue("historical-bootstrap-bots-per-season", out var bootstrapBots) && int.TryParse(bootstrapBots, out var bBots))
        config.HistoricalBootstrapBotsPerSeason = Math.Max(0, bBots);

    if (map.TryGetValue("historical-bootstrap-anchor-season", out var anchorSeason) && int.TryParse(anchorSeason, out var aSeason))
        config.HistoricalBootstrapAnchorSeason = Math.Max(1, aSeason);

    if (map.TryGetValue("historical-bootstrap-anchor-day1-utc", out var anchorDay1) && !string.IsNullOrWhiteSpace(anchorDay1))
        config.HistoricalBootstrapAnchorDayOneUtc = anchorDay1;

    if (map.TryGetValue("historical-bootstrap-status-path", out var bootstrapStatusPath) && !string.IsNullOrWhiteSpace(bootstrapStatusPath))
        config.HistoricalBootstrapStatusPath = bootstrapStatusPath;

    if (map.TryGetValue("enable-seasonal-bot-growth", out var seasonalGrowth) && bool.TryParse(seasonalGrowth, out var sGrowth))
        config.EnableSeasonalBotGrowth = sGrowth;

    if (map.TryGetValue("seasonal-bots-per-season", out var seasonalBots) && int.TryParse(seasonalBots, out var sBots))
        config.SeasonalBotsPerSeason = Math.Max(0, sBots);

    if (map.TryGetValue("seasonal-growth-check-minutes", out var seasonalCheck) && int.TryParse(seasonalCheck, out var sCheck))
        config.SeasonalGrowthCheckMinutes = Math.Max(1, sCheck);

    return config;
}

static Dictionary<string, string> ParseArgs(IEnumerable<string> args)
{
    var map = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
    foreach (var arg in args)
    {
        if (!arg.StartsWith("--", StringComparison.Ordinal))
            continue;

        int eq = arg.IndexOf('=');
        if (eq <= 2 || eq == arg.Length - 1)
            continue;

        map[arg[2..eq]] = arg[(eq + 1)..];
    }
    return map;
}
