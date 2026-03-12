using GoalTactics.Contracts.Shop;
using GoalTactics.Application.Common;
using GoalTactics.Application.Team;

namespace GoalTactics.Application.Shop;

public interface IShopService
{
    Task<ShopProductsResponse> GetProductsAsync(string userId, CancellationToken cancellationToken = default);

    Task<ShopEquipmentResponse> GetEquipmentAsync(string userId, CancellationToken cancellationToken = default);

    Task VerifyPurchaseAsync(string userId, ShopPurchaseVerifyRequest request, CancellationToken cancellationToken = default);

    Task BuyProductAsync(string userId, Guid productId, CancellationToken cancellationToken = default);

    Task UseEquipmentAsync(string userId, Guid equipmentId, CancellationToken cancellationToken = default);

    Task ClaimAdRewardAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class ShopService(ITeamStore teamStore) : IShopService
{
    private const int EquipmentCostStars = 500;

    // Use shared catalog as single source of truth for valid drawable names
    private static readonly string[] ShirtImages = EquipmentCatalog.Shirts;
    private static readonly string[] EmblemImages = EquipmentCatalog.Emblems;

    private static Guid DeterministicId(string image)
    {
        Span<byte> bytes = stackalloc byte[16];
        var h = image.GetHashCode(StringComparison.Ordinal);
        BitConverter.TryWriteBytes(bytes[..4], h);
        BitConverter.TryWriteBytes(bytes[4..8], h ^ 0x73686F70);
        BitConverter.TryWriteBytes(bytes[8..12], h ^ 0x65717569);
        BitConverter.TryWriteBytes(bytes[12..16], h ^ 0x70696E67);
        return new Guid(bytes);
    }

    public Task<ShopProductsResponse> GetProductsAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new ShopProductsResponse
        {
            Success = true,
            Products =
            [
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000001"),
                    Name = "20.000 GT Stars",
                    Category = "gt_stars",
                    Price = 599,
                    Identifier = "com.xyrality.goaltactics.stars_20k",
                    Image = "",
                    Money = 0,
                    Medipacks = 0,
                    GTStars = 20000
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000002"),
                    Name = "44.000 GT Stars",
                    Category = "gt_stars",
                    Price = 1099,
                    Identifier = "com.xyrality.goaltactics.stars_44k",
                    Image = "",
                    Money = 0,
                    Medipacks = 0,
                    GTStars = 44000
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000003"),
                    Name = "87.000 GT Stars",
                    Category = "gt_stars",
                    Price = 2199,
                    Identifier = "com.xyrality.goaltactics.stars_87k",
                    Image = "",
                    Money = 0,
                    Medipacks = 0,
                    GTStars = 87000
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000004"),
                    Name = "250.000 GT Stars",
                    Category = "gt_stars",
                    Price = 5499,
                    Identifier = "com.xyrality.goaltactics.stars_250k",
                    Image = "",
                    Money = 0,
                    Medipacks = 0,
                    GTStars = 250000
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000005"),
                    Name = "600.000 GT Stars",
                    Category = "gt_stars",
                    Price = 10999,
                    Identifier = "com.xyrality.goaltactics.stars_600k",
                    Image = "",
                    Money = 0,
                    Medipacks = 0,
                    GTStars = 600000
                }
            ]
        });
    }

    public async Task<ShopEquipmentResponse> GetEquipmentAsync(string userId, CancellationToken cancellationToken = default)
    {
        var owned = await teamStore.GetOwnedEquipmentAsync(userId, cancellationToken);
        var ownedImages = owned.Select(o => o.Image).ToHashSet(StringComparer.OrdinalIgnoreCase);

        var allItems = new List<EquipmentData>();
        var shirts = new List<EquipmentData>();
        var emblems = new List<EquipmentData>();
        var myShirts = new List<EquipmentData>();
        var myEmblems = new List<EquipmentData>();

        foreach (var img in ShirtImages)
        {
            var eqId = DeterministicId(img);
            var isOwned = ownedImages.Contains(img);
            var item = new EquipmentData
            {
                Id = eqId,
                Name = img,
                CostStars = isOwned ? 0 : EquipmentCostStars,
                Image = img,
                Cost = isOwned ? 0 : EquipmentCostStars,
                InUse = false
            };
            allItems.Add(item);
            shirts.Add(item);
            if (isOwned) myShirts.Add(item);
        }

        foreach (var img in EmblemImages)
        {
            var eqId = DeterministicId(img);
            var isOwned = ownedImages.Contains(img);
            var item = new EquipmentData
            {
                Id = eqId,
                Name = img,
                CostStars = isOwned ? 0 : EquipmentCostStars,
                Image = img,
                Cost = isOwned ? 0 : EquipmentCostStars,
                InUse = false
            };
            allItems.Add(item);
            emblems.Add(item);
            if (isOwned) myEmblems.Add(item);
        }

        return new ShopEquipmentResponse
        {
            Success = true,
            Equipment = allItems,
            Shirts = shirts,
            Emblems = emblems,
            MyShirts = myShirts,
            MyEmblems = myEmblems
        };
    }

    public Task VerifyPurchaseAsync(string userId, ShopPurchaseVerifyRequest request, CancellationToken cancellationToken = default)
    {
        return Task.CompletedTask;
    }

    public async Task BuyProductAsync(string userId, Guid productId, CancellationToken cancellationToken = default)
    {
        // Find matching catalog item
        string? image = null;
        string? type = null;

        foreach (var img in ShirtImages)
        {
            if (DeterministicId(img) == productId)
            {
                image = img;
                type = "shirt";
                break;
            }
        }

        if (image is null)
        {
            foreach (var img in EmblemImages)
            {
                if (DeterministicId(img) == productId)
                {
                    image = img;
                    type = "emblem";
                    break;
                }
            }
        }

        if (image is null || type is null)
            return;

        // Validate drawable name against canonical catalog
        if (!EquipmentCatalog.IsValidDrawable(image))
            return;

        await teamStore.BuyEquipmentAsync(userId, image, type, EquipmentCostStars, cancellationToken);
    }

    public async Task UseEquipmentAsync(string userId, Guid equipmentId, CancellationToken cancellationToken = default)
    {
        await teamStore.UseEquipmentAsync(userId, equipmentId.ToString("N"), cancellationToken);
    }

    public async Task ClaimAdRewardAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        // Grant 100 stars without watching an ad
        await teamStore.TrySpendStarsAsync(userId, -100m, cancellationToken);
    }
}
