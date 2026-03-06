namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class UserPreferencesEntity
{
    public required string UserId { get; set; }

    public bool AuctionOverbid { get; set; }

    public bool MatchResults { get; set; }

    public bool LineupIncomplete { get; set; }

    public bool FriendInvite { get; set; }

    public bool IneffectiveTraining { get; set; }

    public bool FriendlyMatch { get; set; }

    public bool SystemNotifications { get; set; }

    public bool AuctionEnd { get; set; }

    public UserEntity? User { get; set; }
}
