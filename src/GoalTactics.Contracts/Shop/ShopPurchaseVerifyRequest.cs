using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Shop;

public sealed class ShopPurchaseVerifyRequest : RequestObject
{
    public string? Platform { get; init; }

    public string? ProductIdentifier { get; init; }

    public string? PurchaseToken { get; init; }
}
