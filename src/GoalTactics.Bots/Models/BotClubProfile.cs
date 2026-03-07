namespace GoalTactics.Bots.Models;

public sealed class BotClubProfile
{
    public required Guid BotId { get; init; }

    public required string ManagerName { get; init; }

    public required string TeamName { get; init; }

    public required string CountryIso { get; init; }

    public required string TimeZoneId { get; init; }

    public required string Persona { get; init; }

    public int Seed { get; init; }

    public TimeOnly ActiveFromLocal { get; init; }

    public TimeOnly ActiveToLocal { get; init; }

    public decimal Money { get; set; }

    public decimal Stars { get; set; }

    public int Strength { get; set; }

    public int Tier { get; set; }

    public int LeagueGroup { get; set; }

    public int Position { get; set; }

    public int SessionActionsToday { get; set; }

    public int AdsWatchedToday { get; set; }

    public int LadderStamina { get; set; } = 100;

    public bool OnlineNow { get; set; }

    public int SeasonSponsorSignedForSeason { get; set; }

    public DateTime? ShortSponsorActiveUntilUtc { get; set; }

    public DateOnly? ShortSponsorLastPayoutDate { get; set; }

    public DateOnly? SeasonSponsorLastPayoutDate { get; set; }
}
