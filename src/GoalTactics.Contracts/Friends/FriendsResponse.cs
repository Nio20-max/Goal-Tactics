using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Friends;

public sealed class FriendsResponse : ResponseObject
{
    public IReadOnlyList<FriendData> Friends { get; init; } = [];

    public IReadOnlyList<FriendData> Requests { get; init; } = [];

    public string? FriendName { get; init; }
}
