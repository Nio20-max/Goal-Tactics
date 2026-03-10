using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.User;

namespace GoalTactics.Contracts.Shop;

public sealed class ShopProductsResponse : ResponseObject
{
    public IReadOnlyList<ShopProductData> Products { get; init; } = [];
    public UserData? UserData { get; init; }
}
