using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class ScoutingCompletionJob(
    ILogger<ScoutingCompletionJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromMinutes(10))
{
    protected override string JobName => nameof(ScoutingCompletionJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();

        var now = DateTime.UtcNow;

        var completedScouts = await dbContext.TeamPlayers
            .Where(p => p.IsScouted && p.ScoutingReadyAtUtc != null && p.ScoutingReadyAtUtc <= now)
            .ToListAsync(cancellationToken);

        foreach (var player in completedScouts)
        {
            player.ScoutingReadyAtUtc = null;
        }

        if (completedScouts.Count > 0)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
            logger.LogInformation("Scouting completion: {Count} scouts completed", completedScouts.Count);
        }
    }
}
