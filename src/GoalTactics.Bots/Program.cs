using GoalTactics.Bots.Config;
using GoalTactics.Bots.Runtime;
using GoalTactics.Bots.Services;

var options = BuildOptions(args);
var simulationOptions = new SimulationOptions();
await using var logWriter = new BotLogWriter(options.LogRootPath);

var clock = new BotWorldClock(simulationOptions);
var cooldowns = new BotCooldownTracker();
var registry = new BotRegistry(options);
var messageGenerator = new BotMessageGenerator(Path.Combine(AppContext.BaseDirectory, "Fixtures", "chat_templates.json"));

var lineupPlanner = new BotLineupPlanner();
var trainingPlanner = new BotTrainingPlanner();
var scoutingPlanner = new BotScoutingPlanner();
var transferPlanner = new BotTransferPlanner();
var financePlanner = new BotFinancePlanner();
var sponsorPlanner = new BotSponsorPlanner();
var ladderPlanner = new BotLadderPlanner();
var friendlyPlanner = new BotFriendlyPlanner();
var chatPlanner = new BotChatPlanner();

var scheduler = new BotActionScheduler(
    lineupPlanner,
    trainingPlanner,
    scoutingPlanner,
    transferPlanner,
    financePlanner,
    sponsorPlanner,
    ladderPlanner,
    friendlyPlanner,
    chatPlanner);

var metricsCollector = new BotMetricsCollector();
var playerCareerTracker = new BotPlayerCareerTracker(options);
var teamSeasonTracker = new BotTeamSeasonTracker();
var executor = new BotActionExecutor(options, cooldowns, messageGenerator, metricsCollector);
var runner = new BotSimulationRunner(options, simulationOptions, registry, clock, scheduler, executor, metricsCollector, playerCareerTracker, teamSeasonTracker, logWriter);
var host = new BotHostService(options, runner, logWriter);

await host.RunAsync(CancellationToken.None);

static BotOptions BuildOptions(string[] args)
{
    var values = ParseArgs(args);

    static string? Get(IReadOnlyDictionary<string, string> map, string key)
        => map.TryGetValue(key, out var value) ? value : null;

    var mode = Get(values, "mode") ?? "simulate";
    var botCount = TryParseInt(Get(values, "bot-count"), 96);
    var seasons = TryParseInt(Get(values, "seasons"), 20);
    var logRoot = Get(values, "log-root") ?? "/mnt/website/goal_tactics";

    return new BotOptions
    {
        Mode = mode,
        BotCount = botCount,
        Seasons = seasons,
        LogRootPath = logRoot,
        LeagueKickoffUtc = new TimeOnly(18, 0),
        FriendlyKickoffUtc = new TimeOnly(13, 0),
        TrainingTickUtc = new TimeOnly(8, 0),
        BidStarCost = 200,
        SponsorStarsPerDay = 500,
        ShortSponsorStarsPerDay = 200,
        SeasonSponsorStarsPerDay = 300,
        ShortSponsorRenewDays = 3,
        StarsPerAd = 100,
        TeamsPerLeague = 16,
        EnableChat = true,
        EnableFriendlies = true,
        MaxActionsPerSession = 12,
        SnapshotEvery = 1,
        MaxPlayerStrength = 700,
        IndividualTrainingStarsPerWeek = 1_000,
        CampDurationDays = 7,
        CampMoneyCost = 200_000,
        CampStarsCost = 1_000,
        CampSpecBoostPerDay = 1.5m
    };
}

static Dictionary<string, string> ParseArgs(IEnumerable<string> args)
{
    var map = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
    foreach (var arg in args)
    {
        if (!arg.StartsWith("--", StringComparison.Ordinal))
        {
            continue;
        }

        var split = arg.IndexOf('=');
        if (split <= 2 || split == arg.Length - 1)
        {
            continue;
        }

        var key = arg[2..split];
        var value = arg[(split + 1)..];
        map[key] = value;
    }

    return map;
}

static int TryParseInt(string? value, int defaultValue)
    => int.TryParse(value, out var parsed) ? parsed : defaultValue;
