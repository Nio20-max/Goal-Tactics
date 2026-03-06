namespace GoalTactics.Contracts.Common;

public sealed class ResponseObject
{
    public bool Success { get; init; } = true;

    public string? Message { get; init; }
}
