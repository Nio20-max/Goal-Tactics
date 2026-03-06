using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.User;

public sealed class UpdateUserResponse : ResponseObject
{
    public decimal EmailReward { get; init; }

    public decimal FacebookReward { get; init; }
}
