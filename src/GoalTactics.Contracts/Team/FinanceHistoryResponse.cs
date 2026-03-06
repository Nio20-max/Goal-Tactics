using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class FinanceHistoryResponse : ResponseObject
{
    public IReadOnlyList<FinanceHistoryData> FinanceHistory { get; init; } = [];
}
