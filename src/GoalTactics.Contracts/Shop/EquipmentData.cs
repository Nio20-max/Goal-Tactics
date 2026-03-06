namespace GoalTactics.Contracts.Shop;

public sealed class EquipmentData
{
    public Guid Id { get; init; }

    public string? Name { get; init; }

    public int CostStars { get; init; }
}
