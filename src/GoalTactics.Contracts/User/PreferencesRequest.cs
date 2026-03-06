using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.User;

public sealed class PreferencesRequest : RequestObject
{
    public NotificationSettings? NotificationSettings { get; init; }
}
