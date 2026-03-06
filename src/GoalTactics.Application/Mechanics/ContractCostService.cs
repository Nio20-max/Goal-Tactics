namespace GoalTactics.Application.Mechanics;

public sealed class ContractCostService
{
    public int CalculateExtensionCost(int salary, int months)
    {
        return Math.Max(0, salary * months);
    }
}
