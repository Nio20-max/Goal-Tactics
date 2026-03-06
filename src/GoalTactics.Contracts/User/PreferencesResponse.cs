using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.User;

public sealed class PreferencesResponse : ResponseObject
{
    public NotificationSettings? NotificationSettings { get; init; }

    public UserData? UserData { get; init; }
}
