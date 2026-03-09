namespace GoalTactics.Bots.Models;

public enum BuildTaskType
{
    VipSeatsBulk,
    SitSeatsBulk,
    StandSeatsBulk,
    OfficeUpgrade,
    TrainingCenterUpgrade,
    FanShopUpgrade,
    ParkingUpgrade
}

public sealed class BuildTask
{
    public BuildTaskType Type { get; init; }

    // remaining minutes until completion
    public int RemainingMinutes { get; set; }

    // additional metadata
    public int Count { get; init; }

    public int TargetLevel { get; init; }
}
