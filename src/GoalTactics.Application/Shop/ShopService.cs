using GoalTactics.Contracts.Shop;

namespace GoalTactics.Application.Shop;

public interface IShopService
{
    Task<ShopProductsResponse> GetProductsAsync(string userId, CancellationToken cancellationToken = default);

    Task<ShopEquipmentResponse> GetEquipmentAsync(string userId, CancellationToken cancellationToken = default);

    Task VerifyPurchaseAsync(string userId, ShopPurchaseVerifyRequest request, CancellationToken cancellationToken = default);

    Task BuyProductAsync(string userId, Guid productId, CancellationToken cancellationToken = default);

    Task UseEquipmentAsync(string userId, Guid equipmentId, CancellationToken cancellationToken = default);
}

public sealed class ShopService : IShopService
{
    public Task<ShopProductsResponse> GetProductsAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new ShopProductsResponse
        {
            Success = true,
            Products =
            [
                new ShopProductData
                {
                    Id = Guid.NewGuid(),
                    Name = "Medi Pack",
                    Category = "Consumable",
                    Price = 100
                }
            ]
        });
    }

    public Task<ShopEquipmentResponse> GetEquipmentAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new ShopEquipmentResponse
        {
            Success = true,
            Equipment =
            [
                new EquipmentData
                {
                    Id = Guid.NewGuid(),
                    Name = "Home Shirt",
                    CostStars = 50
                }
            ]
        });
    }

    public Task VerifyPurchaseAsync(string userId, ShopPurchaseVerifyRequest request, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }

    public Task BuyProductAsync(string userId, Guid productId, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }

    public Task UseEquipmentAsync(string userId, Guid equipmentId, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }
}
