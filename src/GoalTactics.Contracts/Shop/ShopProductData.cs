namespace GoalTactics.Contracts.Shop;

public sealed class ShopProductData
{
    public string? Identifier { get; init; }
    public string? Image { get; init; }
    public int Money { get; init; }
    public int Medipacks { get; init; }
    public int GTStars { get; init; }
}
