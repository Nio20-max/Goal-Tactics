namespace GoalTactics.Contracts.Common;

public class ResponseObject
{
    public bool Success { get; init; } = true;

    public string? Message { get; init; }

    // Legacy app compatibility: Status enum (OK=1, InvalidRequest=2, AuthenticationError=3)
    public int Status => Success ? 1 : 2;

    public string? ErrorMessage => Success ? null : Message;

    public int Punishment { get; init; }

    /// <summary>Pagination metadata: total number of items across all pages. 0 if not paginated.</summary>
    public int TotalCount { get; init; }

    /// <summary>Pagination metadata: current page number (1-based).</summary>
    public int CurrentPage { get; init; }

    /// <summary>Pagination metadata: total number of pages.</summary>
    public int TotalPages { get; init; }
}
