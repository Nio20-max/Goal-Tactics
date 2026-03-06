namespace GoalTactics.Contracts.Ladder;

public sealed class LadderTeamData
{
    public Guid TeamId { get; init; }

    public string? TeamName { get; init; }

    public string? TeamLogo { get; init; }

    public int Points { get; init; }

    public int Rank { get; init; }

    public int Strength { get; init; }

    public bool IsMine { get; init; }
}
