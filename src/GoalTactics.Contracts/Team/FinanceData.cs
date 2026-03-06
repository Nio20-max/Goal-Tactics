using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class FinanceData : ResponseObject
{
    public string? BookingType { get; init; }

    public decimal Value { get; init; }

    public string? Description { get; init; }

    public bool IsEarning { get; init; }
}
