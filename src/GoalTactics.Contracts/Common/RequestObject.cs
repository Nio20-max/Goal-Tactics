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
}
