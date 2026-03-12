using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Friends;

public sealed class SearchRequest : RequestObject
{
    public string? Text { get; init; }

    public int Value { get; init; }

    public string? Language { get; init; }
}
