namespace GoalTactics.Application.Ladder;

public interface ILadderStore
{
    Task<LadderRecord> GetLadderAsync(string userId, Guid ladderId, CancellationToken cancellationToken = default);

    Task<LadderChallengeRecord> GetLadderChallengeAsync(string userId, Guid opponentTeamId, CancellationToken cancellationToken = default);

    Task<LadderMatchResultRecord> RunMatchAsync(string userId, Guid opponentTeamId, CancellationToken cancellationToken = default);

    Task RestoreStaminaAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed record LadderTeamRecord(
    Guid TeamId,
    string TeamName,
    string TeamLogo,
    int Points,
    int Rank,
    int Strength,
    bool IsMine);

public sealed record LadderRecord(Guid LadderId, DateTime EndDateUtc, IReadOnlyList<LadderTeamRecord> Teams);

public sealed record LadderChallengeRecord(
    LadderTeamRecord HomeTeam,
    LadderTeamRecord AwayTeam,
    int WinPoints,
    int LosePoints,
    int Stamina,
    int StaminaCost,
    DateTime LadderDateUtc,
    int MatchCost);

public sealed record LadderMatchResultRecord(string MatchReport, int Stamina);
