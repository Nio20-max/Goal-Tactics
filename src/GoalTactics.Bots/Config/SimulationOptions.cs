namespace GoalTactics.Bots.Config;

public sealed class SimulationOptions
{
    public DateOnly StartDate { get; init; } = new(2026, 1, 1);

    public int MatchdaysPerSeason { get; init; } = 30;

    public int MaxAuctionsWatchedPerBot { get; init; } = 6;

    public int AuctionWakeupMinutesThreshold { get; init; } = 20;

    public int MaxAdsPerDay { get; init; } = 12;
}
