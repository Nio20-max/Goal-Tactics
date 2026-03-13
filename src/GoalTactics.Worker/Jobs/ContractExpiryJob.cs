using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class ContractExpiryJob(
    ILogger<ContractExpiryJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(6))
{
    protected override string JobName => nameof(ContractExpiryJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var now = DateTime.UtcNow;

        var expiredContracts = await dbContext.TeamPlayers
            .Where(p => !p.IsScouted && p.ContractEndUtc != null && p.ContractEndUtc <= now)
            .ToListAsync(cancellationToken);

        foreach (var player in expiredContracts)
        {
            player.ContractEndUtc = now.AddDays(30);
        }

        if (expiredContracts.Count > 0)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
            logger.LogInformation("Contract expiry: renewed {Count} contracts", expiredContracts.Count);
        }
    }
}
