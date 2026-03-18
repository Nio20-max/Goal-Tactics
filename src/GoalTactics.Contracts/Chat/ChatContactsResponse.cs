using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Chat;

public sealed class ChatContactsResponse : ResponseObject
{
    public string? GroupKey { get; init; }
    public IReadOnlyList<ChatContactData> Contacts { get; init; } = [];
}

public sealed class ChatContactData
{
    public Guid UserId { get; init; }
    public string? Name { get; init; }
    public string? TeamName { get; init; }
    public bool IsBot { get; init; }
    public bool IsFriend { get; init; }
}
