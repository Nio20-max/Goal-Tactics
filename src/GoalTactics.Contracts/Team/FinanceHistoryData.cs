namespace GoalTactics.Contracts.Team;

public sealed class FinanceHistoryData
{
    public DateTime Date { get; init; }

    public decimal Income { get; init; }

    public decimal Outcome { get; init; }

    public decimal Balance { get; init; }
}
