using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class PlayerContractResponse : ResponseObject
{
    public string? Resolution { get; init; }
    public IReadOnlyList<PlayerContractItem> Contracts { get; init; } = [];
}

public sealed class PlayerContractItem
{
    public Guid PlayerID { get; init; }
    public string? PlayerName { get; init; }
    public string? StartDate { get; init; }
    public string? EndDate { get; init; }
    public decimal Salary { get; init; }
    public decimal MarketValue { get; init; }
    public int PremiumCost { get; init; }
    public int BudgetCost { get; init; }
}