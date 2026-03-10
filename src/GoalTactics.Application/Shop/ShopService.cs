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
                    Identifier = "medi_pack_1",
                    Image = "medi_pack",
                    Money = 100,
                    Medipacks = 1,
                    GTStars = 0
                }
            ]
        });
    }

    public Task<ShopEquipmentResponse> GetEquipmentAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new ShopEquipmentResponse
        {
            Success = true,
            Shirts =
            [
                new EquipmentData
                {
                    Id = Guid.NewGuid(),
                    Image = "shirt_default",
                    Cost = 50,
                    InUse = 1
                }
            ],
            Emblems = [],
            MyShirts =
            [
                new EquipmentData
                {
                    Id = Guid.NewGuid(),
                    Image = "shirt_default",
                    Cost = 0,
                    InUse = 1
                }
            ],
            MyEmblems = []
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
