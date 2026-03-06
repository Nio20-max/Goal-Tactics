namespace GoalTactics.Contracts.Squad;

public sealed class PlayerStatisticsData
{
    public Guid PlayerId { get; init; }

    public int Matches { get; init; }

    public int Goals { get; init; }

    public int YellowCards { get; init; }

    public int RedCards { get; init; }
}
