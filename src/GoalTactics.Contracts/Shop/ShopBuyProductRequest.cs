namespace GoalTactics.Contracts.Shop;

public sealed class ShopBuyProductRequest
{
    public Guid Id { get; init; }
    public string? Identifier { get; init; }
    public decimal Cost { get; init; }
}
