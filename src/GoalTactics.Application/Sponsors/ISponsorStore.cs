namespace GoalTactics.Application.Sponsors;

public interface ISponsorStore
{
    Task<IReadOnlyList<SponsorContractRecord>> GetActiveContractsAsync(string teamId, CancellationToken ct = default);

    Task<SponsorContractRecord?> GetActiveContractByTypeAsync(string teamId, string type, CancellationToken ct = default);

    Task<string> CreateContractAsync(string teamId, string type, string sponsorName, string? description,
        long baseMoney, long bonusPerWin, long bonusPerGoal, int starsPayout,
        DateTime startDateUtc, DateTime endDateUtc, CancellationToken ct = default);

    Task DeactivateExpiredContractsAsync(CancellationToken ct = default);
}

public sealed record SponsorContractRecord(
    string Id,
    string TeamId,
    string Type,
    string SponsorName,
    string? SponsorDescription,
    long BaseMoney,
    long BonusPerWin,
    long BonusPerGoal,
    int StarsPayout,
    DateTime StartDateUtc,
    DateTime EndDateUtc,
    bool IsActive);
