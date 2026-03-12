namespace GoalTactics.Contracts.Shop;

public sealed class ShopProductData
{
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public string? Category { get; init; }
    public int Price { get; init; }

    // Xamarin fields
    public string? Identifier { get; init; }
    public string? Image { get; init; }
    public long Money { get; init; }
    public int Medipacks { get; init; }
    public int GTStars { get; init; }
}
