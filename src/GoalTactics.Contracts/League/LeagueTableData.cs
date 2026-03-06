namespace GoalTactics.Contracts.League;

public sealed class LeagueTableData
{
    public Guid Id { get; init; }

    public string? Name { get; init; }

    public decimal Strength { get; init; }

    public string? Logo { get; init; }

    public string? Country { get; init; }

    public bool IsOnline { get; init; }

    public bool IsMine { get; init; }

    public LeagueTableValue Matches { get; init; } = new();

    public LeagueTableValue Wins { get; init; } = new();

    public LeagueTableValue Losses { get; init; } = new();

    public LeagueTableValue Draws { get; init; } = new();

    public LeagueTableValue GoalsScored { get; init; } = new();

    public LeagueTableValue GoalsReceived { get; init; } = new();

    public LeagueTableValue Points { get; init; } = new();
}
