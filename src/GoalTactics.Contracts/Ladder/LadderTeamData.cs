namespace GoalTactics.Contracts.Ladder;

public class LadderTeamData
{
    public Guid TeamId { get; init; }
    public string? TeamName { get; init; }
    public string? TeamLogo { get; init; }
    public int Points { get; init; }
    public int Rank { get; init; }
    public int Strength { get; init; }
    public bool IsMine { get; init; }

    // Xamarin fields
    public string? Name { get; init; }
    public string? Logo { get; init; }
    public string? Country { get; init; }
    public int Played { get; init; }
    public int GoalsScored { get; init; }
    public int GoalsReceived { get; init; }
}
