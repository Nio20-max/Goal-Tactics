using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Shop;

public sealed class ShopEquipmentResponse : ResponseObject
{
    public IReadOnlyList<EquipmentData> Shirts { get; init; } = [];
    public IReadOnlyList<EquipmentData> Emblems { get; init; } = [];
    public IReadOnlyList<EquipmentData> MyShirts { get; init; } = [];
    public IReadOnlyList<EquipmentData> MyEmblems { get; init; } = [];
}
