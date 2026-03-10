namespace GoalTactics.Contracts.Ladder;

public class LadderTeamData
{
    public string? Name { get; init; }
    public Guid TeamId { get; init; }
    public decimal Strength { get; init; }
    public string? Logo { get; init; }
    public string? Country { get; init; }
    public bool Played { get; init; }
    public bool IsMine { get; init; }
    public int GoalsScored { get; init; }
    public int GoalsReceived { get; init; }
    public int Points { get; init; }
}
