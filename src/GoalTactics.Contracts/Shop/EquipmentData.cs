namespace GoalTactics.Contracts.Shop;

public sealed class EquipmentData
{
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public int CostStars { get; init; }

    // Xamarin fields
    public string? Image { get; init; }
    public int Cost { get; init; }
    public int InUse { get; init; }
}
