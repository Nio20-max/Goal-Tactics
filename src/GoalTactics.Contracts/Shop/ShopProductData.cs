namespace GoalTactics.Contracts.Shop;

public sealed class ShopProductData
{
    public Guid Id { get; init; }

    public string? Name { get; init; }

    public string? Category { get; init; }

    public int Price { get; init; }
}
