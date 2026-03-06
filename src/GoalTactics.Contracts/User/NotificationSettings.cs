namespace GoalTactics.Contracts.User;

public sealed class NotificationSettings
{
    public bool AuctionOverbid { get; init; }

    public bool MatchResults { get; init; }

    public bool LineupIncomplete { get; init; }

    public bool FriendInvite { get; init; }

    public bool IneffectiveTraining { get; init; }

    public bool FriendlyMatch { get; init; }

    public bool System { get; init; }

    public bool AuctionEnd { get; init; }
}
