namespace GoalTactics.Contracts.Common;

public class RequestObject
{
    // Legacy app sends these fields on every request; accepted but not used.
    public string? Signature { get; init; }
    public string? Token { get; init; }
    public string? Locale { get; init; }
    public string? UtcOffset { get; init; }
    public string? Culture { get; init; }
    public int? Platform { get; init; }

    /// <summary>Optional pagination: 1-based page number. Default = 1.</summary>
    public int Page { get; init; } = 1;

    /// <summary>Optional pagination: items per page. Default = 50. Max = 200.</summary>
    public int PageSize { get; init; } = 50;

    /// <summary>Clamp and return a safe page number (1-based).</summary>
    public int SafePage => Math.Max(1, Page);

    /// <summary>Clamp and return a safe page size.</summary>
    public int SafePageSize => Math.Clamp(PageSize, 1, 200);
}
