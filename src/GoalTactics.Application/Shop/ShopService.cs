using GoalTactics.Contracts.Shop;
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

    // 56 trikots (trikot0 – trikot55)
    private static readonly string[] ShirtImages = Enumerable.Range(0, 56).Select(i => $"trikot{i}").ToArray();

    // 81 wappen extracted from APK
    private static readonly int[] EmblemNumbers =
    [
        1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,
        31,33,34,37,40,42,43,44,45,50,51,52,53,56,58,61,63,65,67,68,71,76,78,79,80,
        83,84,88,90,92,95,97,100,104,105,106,107,111,113,114,117,118,121,125,126,128,
        130,131,132,135,137,142,143,146,150,157
    ];
    private static readonly string[] EmblemImages = EmblemNumbers.Select(i => $"wappen{i:00}").ToArray();

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
                    Name = "Medi Pack",
                    Category = "medi_pack",
                    Price = 100,
                    Identifier = "medi_pack_1",
                    Image = "medi_pack",
                    Money = 0,
                    Medipacks = 1,
                    GTStars = 100
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000002"),
                    Name = "10.000 Coins",
                    Category = "coins",
                    Price = 50,
                    Identifier = "coins_10k",
                    Image = "coins_pack",
                    Money = 10000,
                    Medipacks = 0,
                    GTStars = 50
                },
                new ShopProductData
                {
                    Id = Guid.Parse("a1b2c3d4-e5f6-0000-0000-000000000003"),
                    Name = "50.000 Coins",
                    Category = "coins",
                    Price = 200,
                    Identifier = "coins_50k",
                    Image = "coins_pack_big",
                    Money = 50000,
                    Medipacks = 0,
                    GTStars = 200
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
