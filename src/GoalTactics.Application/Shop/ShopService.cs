using GoalTactics.Contracts.Shop;
using GoalTactics.Application.Common;
using GoalTactics.Application.Team;
using System.Security.Cryptography;
using System.Text;

namespace GoalTactics.Application.Shop;

public interface IShopService
{
    Task<ShopProductsResponse> GetProductsAsync(string userId, CancellationToken cancellationToken = default);

    Task<ShopEquipmentResponse> GetEquipmentAsync(string userId, CancellationToken cancellationToken = default);

    Task VerifyPurchaseAsync(string userId, ShopPurchaseVerifyRequest request, CancellationToken cancellationToken = default);

    Task<bool> BuyProductAsync(string userId, Guid productId, CancellationToken cancellationToken = default);

    Task<bool> BuyProductByIdentifierAsync(string userId, string identifier, CancellationToken cancellationToken = default);

    Task<bool> BuyEquipmentAsync(string userId, Guid equipmentId, int equipmentType, int cost, CancellationToken cancellationToken = default);

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
        var hash = SHA256.HashData(Encoding.UTF8.GetBytes(image));
        Span<byte> bytes = stackalloc byte[16];
        hash[..16].CopyTo(bytes);
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
                    Cost = 599,
                    Action = "Buy",
                    Section = 0,
                    Identifier = "com.xyrality.goaltactics.stars_20k",
                    Image = "shop_stars_1",
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
                    Cost = 1099,
                    Action = "Buy",
                    Section = 0,
                    Identifier = "com.xyrality.goaltactics.stars_44k",
                    Image = "shop_stars_2",
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
                    Cost = 2199,
                    Action = "Buy",
                    Section = 0,
                    Identifier = "com.xyrality.goaltactics.stars_87k",
                    Image = "shop_stars_3",
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
                    Cost = 5499,
                    Action = "Buy",
                    Section = 0,
                    Identifier = "com.xyrality.goaltactics.stars_250k",
                    Image = "shop_stars_4",
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
                    Cost = 10999,
                    Action = "Buy",
                    Section = 0,
                    Identifier = "com.xyrality.goaltactics.stars_600k",
                    Image = "shop_stars_5",
                    Money = 0,
                    Medipacks = 0,
                    GTStars = 600000
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000100"),
                    Name = "20.000 GT Stars",
                    Category = "gt_stars",
                    Price = 0,
                    Cost = 0,
                    Action = "Buy",
                    Section = 2,
                    Identifier = "com.xyrality.goaltactics.stars_20k_free",
                    Image = "shop_stars_2",
                    Money = 0,
                    Medipacks = 0,
                    GTStars = 20000
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000104"),
                    Name = "1.000 GT Stars",
                    Category = "gt_stars",
                    Price = 0,
                    Cost = 0,
                    Action = "Buy",
                    Section = 2,
                    Identifier = "com.xyrality.goaltactics.stars_1k_free",
                    Image = "shop_stars_1",
                    Money = 0,
                    Medipacks = 0,
                    GTStars = 1000
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000101"),
                    Name = "10 Medipacks",
                    Category = "medipacks",
                    Price = 1000,
                    Cost = 1000,
                    Action = "Buy",
                    Section = 2,
                    Identifier = "com.xyrality.goaltactics.medipacks_10",
                    Image = "shop_medipacks_1",
                    Money = 0,
                    Medipacks = 10,
                    GTStars = 0
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000102"),
                    Name = "30 Medipacks",
                    Category = "medipacks",
                    Price = 2700,
                    Cost = 2700,
                    Action = "Buy",
                    Section = 2,
                    Identifier = "com.xyrality.goaltactics.medipacks_30",
                    Image = "shop_medipacks_3",
                    Money = 0,
                    Medipacks = 30,
                    GTStars = 0
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000103"),
                    Name = "80 Medipacks",
                    Category = "medipacks",
                    Price = 6400,
                    Cost = 6400,
                    Action = "Buy",
                    Section = 2,
                    Identifier = "com.xyrality.goaltactics.medipacks_80",
                    Image = "shop_medipacks_5",
                    Money = 0,
                    Medipacks = 80,
                    GTStars = 0
                }
            ]
        });
    }

    public async Task<ShopEquipmentResponse> GetEquipmentAsync(string userId, CancellationToken cancellationToken = default)
    {
        var owned = await teamStore.GetOwnedEquipmentAsync(userId, cancellationToken);
        var ownedByImage = owned
            .GroupBy(o => o.Image, StringComparer.OrdinalIgnoreCase)
            .ToDictionary(group => group.Key, group => group.First(), StringComparer.OrdinalIgnoreCase);

        var allItems = new List<EquipmentData>();
        var shirts = new List<EquipmentData>();
        var emblems = new List<EquipmentData>();
        var myShirts = new List<EquipmentData>();
        var myEmblems = new List<EquipmentData>();

        foreach (var img in ShirtImages)
        {
            var isOwned = ownedByImage.TryGetValue(img, out var ownedItem);
            var eqId = DeterministicId(img);
            var inUse = 0;

            if (isOwned && ownedItem is not null)
            {
                if (Guid.TryParse(ownedItem.Id, out var parsedOwnedId))
                {
                    eqId = parsedOwnedId;
                }

                inUse = ownedItem.IsActive ? 1 : 0;
            }

            var item = new EquipmentData
            {
                Id = eqId,
                Name = img,
                CostStars = isOwned ? 0 : EquipmentCostStars,
                Image = img,
                Cost = isOwned ? 0 : EquipmentCostStars,
                InUse = inUse
            };
            allItems.Add(item);
            shirts.Add(item);
            if (isOwned) myShirts.Add(item);
        }

        foreach (var img in EmblemImages)
        {
            var isOwned = ownedByImage.TryGetValue(img, out var ownedItem);
            var eqId = DeterministicId(img);
            var inUse = 0;

            if (isOwned && ownedItem is not null)
            {
                if (Guid.TryParse(ownedItem.Id, out var parsedOwnedId))
                {
                    eqId = parsedOwnedId;
                }

                inUse = ownedItem.IsActive ? 1 : 0;
            }

            var item = new EquipmentData
            {
                Id = eqId,
                Name = img,
                CostStars = isOwned ? 0 : EquipmentCostStars,
                Image = img,
                Cost = isOwned ? 0 : EquipmentCostStars,
                InUse = inUse
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

    public async Task<bool> BuyProductAsync(string userId, Guid productId, CancellationToken cancellationToken = default)
    {
        // Keep equipment purchase flow for newer clients using product GUIDs.
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
            return false;

        if (!EquipmentCatalog.IsValidDrawable(image))
            return false;

        return await teamStore.BuyEquipmentAsync(userId, image, type, EquipmentCostStars, cancellationToken);
    }

    public async Task<bool> BuyProductByIdentifierAsync(string userId, string identifier, CancellationToken cancellationToken = default)
    {
        var normalized = identifier.Trim().ToLowerInvariant();

        return normalized switch
        {
            "com.xyrality.goaltactics.stars_20k_free" => await teamStore.TrySpendStarsAsync(userId, -20_000m, cancellationToken),
            "com.xyrality.goaltactics.stars_1k_free" => await teamStore.TrySpendStarsAsync(userId, -1_000m, cancellationToken),
            "com.xyrality.goaltactics.medipacks_10" => await BuyMedipacksForStarsAsync(userId, starsCost: 1_000m, medipacks: 10m, cancellationToken),
            "com.xyrality.goaltactics.medipacks_30" => await BuyMedipacksForStarsAsync(userId, starsCost: 2_700m, medipacks: 30m, cancellationToken),
            "com.xyrality.goaltactics.medipacks_80" => await BuyMedipacksForStarsAsync(userId, starsCost: 6_400m, medipacks: 80m, cancellationToken),
            _ => false
        };
    }

    public async Task<bool> BuyEquipmentAsync(string userId, Guid equipmentId, int equipmentType, int cost, CancellationToken cancellationToken = default)
    {
        if (!TryResolveEquipment(equipmentId, equipmentType, out var image, out var type))
        {
            return false;
        }

        if (!EquipmentCatalog.IsValidDrawable(image))
        {
            return false;
        }

        // Cost is client-provided in legacy requests and should not be trusted.
        _ = cost;
        return await teamStore.BuyEquipmentAsync(userId, image, type, EquipmentCostStars, cancellationToken);
    }

    private async Task<bool> BuyMedipacksForStarsAsync(string userId, decimal starsCost, decimal medipacks, CancellationToken cancellationToken)
    {
        if (!await teamStore.TrySpendStarsAsync(userId, starsCost, cancellationToken))
        {
            return false;
        }

        await teamStore.TrySpendMedipacksAsync(userId, -medipacks, cancellationToken);
        return true;
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

    private static bool TryResolveEquipment(Guid equipmentId, int equipmentType, out string image, out string type)
    {
        image = string.Empty;
        type = string.Empty;

        if (equipmentType is 0 or 2)
        {
            foreach (var img in ShirtImages)
            {
                if (DeterministicId(img) != equipmentId)
                {
                    continue;
                }

                image = img;
                type = "shirt";
                return true;
            }
        }

        if (equipmentType is 1 or 2)
        {
            foreach (var img in EmblemImages)
            {
                if (DeterministicId(img) != equipmentId)
                {
                    continue;
                }

                image = img;
                type = "emblem";
                return true;
            }
        }

        return false;
    }
}
