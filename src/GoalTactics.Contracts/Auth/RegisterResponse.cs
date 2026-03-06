namespace GoalTactics.Contracts.Auth;

public sealed class RegisterResponse
{
    public bool Success { get; init; }

    public string? UserId { get; init; }

    public string? Message { get; init; }
}
