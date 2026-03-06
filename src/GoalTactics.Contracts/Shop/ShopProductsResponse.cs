using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Shop;

public sealed class ShopProductsResponse : ResponseObject
{
    public IReadOnlyList<ShopProductData> Products { get; init; } = [];
}
