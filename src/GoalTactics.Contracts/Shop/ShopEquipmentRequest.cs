using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Shop;

public sealed class ShopEquipmentRequest : RequestObject
{
    public int Equipment { get; init; }
    public Guid Id { get; init; }
    public int Cost { get; init; }
    public int InUse { get; init; }
}