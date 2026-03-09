namespace GoalTactics.Contracts.Common;

public class ResponseObject
{
    public bool Success { get; init; } = true;

    public string? Message { get; init; }

    // Legacy app compatibility: Status enum (OK=1, InvalidRequest=2, AuthenticationError=3)
    public int Status => Success ? 1 : 2;

    public string? ErrorMessage => Success ? null : Message;

    public int Punishment { get; init; }
}
