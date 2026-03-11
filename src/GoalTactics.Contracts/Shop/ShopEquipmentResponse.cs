using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Shop;

public sealed class ShopEquipmentResponse : ResponseObject
{
    public IReadOnlyList<EquipmentData> Equipment { get; init; } = [];
}
