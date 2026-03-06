namespace GoalTactics.Contracts.Friends;

public sealed class ChallengeData
{
    public Guid Id { get; init; }

    public Guid ForeignTeamId { get; init; }

    public string? OpponentName { get; init; }

    public bool Accepted { get; init; }

    public string? MatchDate { get; init; }
}
