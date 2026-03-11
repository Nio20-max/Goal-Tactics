namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamEntity
{
    public required string Id { get; set; }

    public required string UserId { get; set; }

    public required string Name { get; set; }

    public string Country { get; set; } = "DE";

    public string CountryName { get; set; } = "Germany";

    public string LeagueName { get; set; } = "Amateur";

    public decimal MarketValue { get; set; }

    public int Mood { get; set; }

    public string TeamMood { get; set; } = "Neutral";

    public int Wins { get; set; }

    public int Losses { get; set; }

    public int Fans { get; set; }

    public int Members { get; set; }

    public int Strength { get; set; }

    public string MatchTrend { get; set; } = "Stable";

    public string StadiumName { get; set; } = "My Stadium";

    public int GrassQuality { get; set; } = 80;

    public int LeagueTier { get; set; } = 4;

    public string? SelectedShirt { get; set; }

    public string? SelectedEmblem { get; set; }

    public UserEntity? User { get; set; }
}
