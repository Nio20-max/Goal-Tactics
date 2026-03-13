using GoalTactics.Bots.Client;

// ── Parse CLI arguments ─────────────────────────────────────────
var config = ParseConfig(args);

Console.WriteLine($"GoalTactics Bot Client");
Console.WriteLine($"  API URL:   {config.ApiBaseUrl}");
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
