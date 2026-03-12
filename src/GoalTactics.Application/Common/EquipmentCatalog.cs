namespace GoalTactics.Application.Common;

/// <summary>
/// Canonical catalog of valid equipment drawable names shared across
/// ShopService, LegacyAppCompatibility, and validation logic.
/// </summary>
public static class EquipmentCatalog
{
    /// <summary>56 shirt drawables: trikot0 – trikot55.</summary>
    public static readonly string[] Shirts = Enumerable.Range(0, 56).Select(i => $"trikot{i}").ToArray();

    /// <summary>81 emblem drawables extracted from the APK.</summary>
    public static readonly int[] EmblemNumbers =
    [
        1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,
        31,33,34,37,40,42,43,44,45,50,51,52,53,56,58,61,63,65,67,68,71,76,78,79,80,
        83,84,88,90,92,95,97,100,104,105,106,107,111,113,114,117,118,121,125,126,128,
        130,131,132,135,137,142,143,146,150,157
    ];

    public static readonly string[] Emblems = EmblemNumbers.Select(i => $"wappen{i:00}").ToArray();

    private static readonly HashSet<string> ValidShirtSet = new(Shirts, StringComparer.OrdinalIgnoreCase);
    private static readonly HashSet<string> ValidEmblemSet = new(Emblems, StringComparer.OrdinalIgnoreCase);

    public static bool IsValidShirt(string name) => ValidShirtSet.Contains(name);

    public static bool IsValidEmblem(string name) => ValidEmblemSet.Contains(name);

    public static bool IsValidDrawable(string name) => ValidShirtSet.Contains(name) || ValidEmblemSet.Contains(name);
}
