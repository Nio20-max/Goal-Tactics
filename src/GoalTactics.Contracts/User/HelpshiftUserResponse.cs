using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.User;

public sealed class HelpshiftUserResponse : ResponseObject
{
    public Guid UserId { get; init; }

    public string? ManagerName { get; init; }

    public int PurchasesAmount { get; init; }

    public string? CreationDate { get; init; }

    public decimal PurchasesLTV { get; init; }

    public string? ClubName { get; init; }

    public string? LeagueName { get; init; }

    public int UserLevel { get; init; }
}
