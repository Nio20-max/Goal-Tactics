namespace GoalTactics.Contracts.Auth;

public sealed class AuthResponse
{
    public bool Success { get; init; }

    public string? Token { get; init; }

    public string? ManagerName { get; init; }

    public string? Message { get; init; }
}
