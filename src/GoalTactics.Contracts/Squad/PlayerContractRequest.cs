using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class PlayerContractRequest : IdRequest
{
    public bool PremiumRenewal { get; init; }
    public Guid PlayerID { get; init; }
    public decimal Salary { get; init; }
}