using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class FinancesResponse : ResponseObject
{
    public int Today { get; init; }

    public int Yesterday { get; init; }

    public IReadOnlyList<FinanceData> Todays { get; init; } = [];

    public IReadOnlyList<FinanceData> Yesterdays { get; init; } = [];
}
