namespace GoalTactics.Bots.Client;

/// <summary>
/// Central configuration for the standalone bot client.
/// </summary>
public sealed class BotConfig
{
    public string ApiBaseUrl { get; set; } = "https://localhost:5001";
    public string DatabasePath { get; set; } = "bots.db";
    public int BotCount { get; set; } = 96;
    public int MaxGroups { get; set; } = 5;
    public int SchedulerPollIntervalSeconds { get; set; } = 10;
    public int SchedulerBatchSize { get; set; } = 10;

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
