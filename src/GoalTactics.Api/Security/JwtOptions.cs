namespace GoalTactics.Api.Security;

public sealed class JwtOptions
{
    public const string SectionName = "Jwt";

    public string Issuer { get; init; } = "GoalTactics.Api";

    public string Audience { get; init; } = "GoalTactics.Client";

    public string SigningKey { get; init; } = "dev-only-super-long-change-me-signing-key-123456";

    // 24 hours to match legacy client expectations and avoid frequent re-login
    public int ExpiryMinutes { get; init; } = 1440;
}
