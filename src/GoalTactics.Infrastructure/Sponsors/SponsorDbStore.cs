using GoalTactics.Application.Sponsors;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Sponsors;

public sealed class SponsorDbStore(GoalTacticsDbContext dbContext) : ISponsorStore
{
    public async Task<IReadOnlyList<SponsorContractRecord>> GetActiveContractsAsync(string teamId, CancellationToken ct = default)
    {
        var contracts = await dbContext.SponsorContracts.AsNoTracking()
            .Where(c => c.TeamId == teamId && c.IsActive)
            .OrderBy(c => c.Type)
            .ToListAsync(ct);

        return contracts.Select(Map).ToArray();
    }

    public async Task<SponsorContractRecord?> GetActiveContractByTypeAsync(string teamId, string type, CancellationToken ct = default)
    {
        var contract = await dbContext.SponsorContracts.AsNoTracking()
            .FirstOrDefaultAsync(c => c.TeamId == teamId && c.Type == type && c.IsActive, ct);

        return contract is null ? null : Map(contract);
    }

    public async Task<string> CreateContractAsync(string teamId, string type, string sponsorName, string? description,
        long baseMoney, long bonusPerWin, long bonusPerGoal, int starsPayout,
        DateTime startDateUtc, DateTime endDateUtc, CancellationToken ct = default)
    {
        // Deactivate any existing contract of the same type
        var existing = await dbContext.SponsorContracts
            .Where(c => c.TeamId == teamId && c.Type == type && c.IsActive)
            .ToListAsync(ct);

        foreach (var old in existing)
            old.IsActive = false;

        var id = Guid.NewGuid().ToString("N");
        dbContext.SponsorContracts.Add(new SponsorContractEntity
        {
            Id = id,
            TeamId = teamId,
            Type = type,
            SponsorName = sponsorName,
            SponsorDescription = description,
            BaseMoney = baseMoney,
            BonusPerWin = bonusPerWin,
            BonusPerGoal = bonusPerGoal,
            StarsPayout = starsPayout,
            StartDateUtc = startDateUtc,
            EndDateUtc = endDateUtc,
            IsActive = true
        });

        await dbContext.SaveChangesAsync(ct);
        return id;
    }

    public async Task DeactivateExpiredContractsAsync(CancellationToken ct = default)
    {
        var now = DateTime.UtcNow;
        var expired = await dbContext.SponsorContracts
            .Where(c => c.IsActive && c.EndDateUtc <= now)
            .ToListAsync(ct);

        foreach (var contract in expired)
            contract.IsActive = false;

        if (expired.Count > 0)
            await dbContext.SaveChangesAsync(ct);
    }

    private static SponsorContractRecord Map(SponsorContractEntity e) => new(
        Id: e.Id,
        TeamId: e.TeamId,
        Type: e.Type,
        SponsorName: e.SponsorName,
        SponsorDescription: e.SponsorDescription,
        BaseMoney: e.BaseMoney,
        BonusPerWin: e.BonusPerWin,
        BonusPerGoal: e.BonusPerGoal,
        StarsPayout: e.StarsPayout,
        StartDateUtc: e.StartDateUtc,
        EndDateUtc: e.EndDateUtc,
        IsActive: e.IsActive);
}
