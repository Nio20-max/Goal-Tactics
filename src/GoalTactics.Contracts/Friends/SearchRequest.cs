namespace GoalTactics.Contracts.Friends;

public sealed class SearchRequest
{
    public string? Text { get; init; }

    public int Value { get; init; }

    public string? Language { get; init; }
}
