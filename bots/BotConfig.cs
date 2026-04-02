namespace GoalTactics.Bots.Client;

/// <summary>
/// Central configuration for the standalone bot client.
/// </summary>
public sealed class BotConfig
{
    /// <summary>
    /// Base URL of the GoalTactics API. Use http:// for local development
    /// or https:// with a valid certificate for production.
    /// </summary>
    public string ApiBaseUrl { get; set; } = "http://localhost:5000";
    public string DatabasePath { get; set; } = "bots.db";
    public int BotCount { get; set; } = 96;
    public int MaxGroups { get; set; } = 5;
    public int SchedulerPollIntervalSeconds { get; set; } = 10;
    public int SchedulerBatchSize { get; set; } = 10;
    public bool NeuralEnabled { get; set; } = true;
    public string NeuralApiUrl { get; set; } = "http://127.0.0.1:5057";
    public string NeuralModel { get; set; } = "lfm25-local";
    public bool RequireLlmForChat { get; set; } = true;
    public int NeuralMaxConcurrentRequests { get; set; } = 4;
    public int NeuralRequestTimeoutSeconds { get; set; } = 20;
    public int NightPlanningStartHourLocal { get; set; } = 22;
    public int NightPlanningEndHourLocal { get; set; } = 6;
    public double DecisionConfidenceThreshold { get; set; } = 0.22;
    public int MaxRiskyActionsPerDay { get; set; } = 4;
    public double MaxBidPercentOfMoney { get; set; } = 0.35;
    public int MinStarsReserve { get; set; } = 1000;
    public int GroupChatMinDelaySeconds { get; set; } = 10;
    public int GroupChatMaxDelaySeconds { get; set; } = 180;
    public bool EnableMultilingualChat { get; set; } = true;
    public bool EnableFallbackRollbackStrategy { get; set; } = true;
    public bool EnableSelfAudit { get; set; } = true;
    public int SimulateSeasons { get; set; } = 0;
    public int SimulateMatchdaysPerSeason { get; set; } = 30;
    public int SimulationInterSessionDelayMs { get; set; } = 75;
    public bool SimulateCentralBrainFastEngine { get; set; } = false;
    public string SimulationOutputRoot { get; set; } = "/mnt/website/goal_tactics/simulations";
    public bool EnableSimulationAudit { get; set; } = true;
    public bool CaptureSimulationSnapshots { get; set; } = true;
    public int SimulationSnapshotStride { get; set; } = 1;
    public bool EnableHistoricalBootstrap { get; set; } = false;
    public bool HistoricalBootstrapCentralBrain { get; set; } = true;
    public string GameDatabasePath { get; set; } = "/mnt/website/goal_tactics/data/goaltactics.db";
    public int HistoricalBootstrapFastSeasons { get; set; } = 29;
    public int HistoricalBootstrapNormalSeasonCount { get; set; } = 1;
    public int HistoricalBootstrapRealSimulationSeasons { get; set; } = 1;
    public int HistoricalBootstrapSeasons { get; set; } = 30;
    public int HistoricalBootstrapBotsPerSeason { get; set; } = 16;
    public int CentralBrainBotsPerMatchday { get; set; } = 16;
    public int HistoricalBootstrapAnchorSeason { get; set; } = 31;
    public string HistoricalBootstrapAnchorDayOneUtc { get; set; } = "2026-03-23";
    public string HistoricalBootstrapStatusPath { get; set; } = "/mnt/website/goal_tactics/simulations/historical-bootstrap-status.json";
    public bool EnableSeasonalBotGrowth { get; set; } = true;
    public int SeasonalBotsPerSeason { get; set; } = 16;
    public int SeasonalGrowthCheckMinutes { get; set; } = 30;
    public bool RegisterOnly { get; set; } = false;

    /// <summary>Rate limits expressed as minimum seconds between successive calls.</summary>
    public RateLimits Rates { get; set; } = new();
}

public sealed class RateLimits
{
    public int BidCooldownSeconds { get; set; } = 5;
    public int ChatCooldownSeconds { get; set; } = 10;
    public int SearchCooldownSeconds { get; set; } = 3;
    public int DefaultCooldownSeconds { get; set; } = 1;
}
