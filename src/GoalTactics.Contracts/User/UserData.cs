namespace GoalTactics.Contracts.User;

public sealed class UserData
{
    public string? Name { get; init; }

    public int Score { get; init; }

    public string? Created { get; init; }

    public string? LastActivity { get; init; }

    public string? FacebookId { get; init; }

    public string? AppleId { get; init; }

    public string? Email { get; init; }

    public string? Password { get; init; }

    public string? Rank { get; init; }
}
