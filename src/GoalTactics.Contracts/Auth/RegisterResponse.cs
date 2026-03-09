namespace GoalTactics.Contracts.Auth;

public sealed class RegisterResponse
{
    public bool Success { get; init; }

    public string? UserId { get; init; }

    public string? Message { get; init; }

    /// <summary>Legacy app expects a Status int (1=OK, 2=InvalidRequest).</summary>
    public int Status { get; init; }

    public string? ErrorMessage { get; init; }

    /// <summary>Legacy app expects Login echoed back on success.</summary>
    public string? Login { get; init; }

    public int Punishment { get; init; }
}
