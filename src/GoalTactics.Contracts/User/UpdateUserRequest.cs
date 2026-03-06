using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.User;

public sealed class UpdateUserRequest : RequestObject
{
    public UserData? UserData { get; init; }
}
