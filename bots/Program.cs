using GoalTactics.Bots.Client;

// ── Parse CLI arguments ─────────────────────────────────────────
var config = ParseConfig(args);

Console.WriteLine($"GoalTactics Bot Client");
Console.WriteLine($"  API URL:   {config.ApiBaseUrl}");
Console.WriteLine($"  Neural:    {(config.NeuralEnabled ? "enabled" : "disabled")} ({config.NeuralApiUrl})");
Console.WriteLine($"  Database:  {config.DatabasePath}");
Console.WriteLine($"  Bot count: {config.BotCount}");
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
