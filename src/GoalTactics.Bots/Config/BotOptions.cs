namespace GoalTactics.Bots.Config;

public sealed class BotOptions
{
    public string Mode { get; init; } = "simulate";

    public int BotCount { get; init; } = 96;

    public int Seasons { get; init; } = 20;

    public int SnapshotEvery { get; init; } = 1;

    public bool EnableChat { get; init; } = true;

    public bool EnableFriendlies { get; init; } = true;

    public string LogRootPath { get; init; } = "/mnt/website/goal_tactics";

    public TimeOnly LeagueKickoffUtc { get; init; } = new(18, 0);

    public TimeOnly FriendlyKickoffUtc { get; init; } = new(13, 0);

    public TimeOnly TrainingTickUtc { get; init; } = new(8, 0);

    public int BidStarCost { get; init; } = 200;

    public int SponsorStarsPerDay { get; init; } = 500;

    public int ShortSponsorStarsPerDay { get; init; } = 200;

    public int SeasonSponsorStarsPerDay { get; init; } = 300;

    public int ShortSponsorRenewDays { get; init; } = 3;

    public int StarsPerAd { get; init; } = 100;

    public int TeamsPerLeague { get; init; } = 16;

    public int MaxActionsPerSession { get; init; } = 12;

    public int MaxPlayerStrength { get; init; } = 700;

    public int IndividualTrainingStarsPerWeek { get; init; } = 1_000;

    public int CampDurationDays { get; init; } = 7;

    public int CampMoneyCost { get; init; } = 200_000;

    public int CampStarsCost { get; init; } = 1_000;

    public decimal CampSpecBoostPerDay { get; init; } = 1.5m;
}
