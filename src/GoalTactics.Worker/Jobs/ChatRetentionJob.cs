using Microsoft.Extensions.Logging;
using GoalTactics.Infrastructure.Persistence;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Worker.Jobs;

public sealed class ChatRetentionJob(ILogger<ChatRetentionJob> logger, IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(24))
{
    protected override string JobName => nameof(ChatRetentionJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        var cutoff = DateTime.UtcNow.AddDays(-30);

        using var scope = scopeFactory.CreateScope();
        var dbContext = scope.ServiceProvider.GetRequiredService<GoalTacticsDbContext>();
        var deleted = await dbContext.ChatMessages
            .Where(x => x.CreatedAtUtc < cutoff)
            .ExecuteDeleteAsync(cancellationToken);

        logger.LogInformation("Chat retention cleanup deleted {Count} messages older than {CutoffUtc}", deleted, cutoff);
    }
}
