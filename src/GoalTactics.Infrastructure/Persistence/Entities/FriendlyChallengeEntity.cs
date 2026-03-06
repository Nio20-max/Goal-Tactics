namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class FriendlyChallengeEntity
{
    public required string Id { get; set; }

    public required string HomeUserId { get; set; }

    public required string AwayUserId { get; set; }

    public required string HomeTeamId { get; set; }

    public required string AwayTeamId { get; set; }

    public int Status { get; set; }

    public DateTime MatchDateUtc { get; set; }

    public DateTime EndDateUtc { get; set; }

    public DateTime CreatedAtUtc { get; set; }
}
