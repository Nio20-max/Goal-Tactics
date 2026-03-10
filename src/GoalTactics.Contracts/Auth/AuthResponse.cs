using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Auth;

public sealed class AuthResponse : ResponseObject
{
    public string? Token { get; init; }

    public string? ManagerName { get; init; }

    public Guid UserId { get; init; }

    public int Level { get; init; }

    public bool IsAdmin { get; init; }
}
