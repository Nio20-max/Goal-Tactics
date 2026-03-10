using GoalTactics.Contracts.User;

namespace GoalTactics.Contracts.Team;

public class TeamData
{
    public string? Id { get; init; }

    public string? Name { get; init; }

    public string? Logo { get; init; }

    public string? Country { get; init; }

    public string? CountryName { get; init; }

    public Guid LeagueId { get; init; }

    public string? LeagueName { get; init; }

    public string? HomeTrikot { get; init; }

    public string? AwayTrikot { get; init; }

    public decimal MarketValue { get; init; }

    public int Mood { get; init; }

    public string? TeamMood { get; init; }

    public int Wins { get; init; }

    public int Losses { get; init; }

    public int Fans { get; init; }

    public int Members { get; init; }

    public int Strength { get; init; }

    public string? MatchTrend { get; init; }

    public UserData? UserData { get; init; }
}
