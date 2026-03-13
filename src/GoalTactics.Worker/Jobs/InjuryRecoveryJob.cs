using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class InjuryRecoveryJob(
    ILogger<InjuryRecoveryJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(6))
{
    protected override string JobName => nameof(InjuryRecoveryJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var recoveringPlayers = await dbContext.TeamPlayers
            .Where(p => !p.IsScouted && p.Fitness < 70)
            .ToListAsync(cancellationToken);

        foreach (var player in recoveringPlayers)
        {
            player.Fitness = Math.Min(100, player.Fitness + 5);
        }

        if (recoveringPlayers.Count > 0)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
            logger.LogInformation("Injury recovery: {Count} players recovering", recoveringPlayers.Count);
        }
    }
}
