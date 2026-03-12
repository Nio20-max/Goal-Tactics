using GoalTactics.Application.Sponsors;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public sealed class SponsorRefreshJob(
    ILogger<SponsorRefreshJob> logger,
    IServiceScopeFactory scopeFactory)
    : ScheduledBackgroundJob(logger, TimeSpan.FromHours(1))
{
    protected override string JobName => nameof(SponsorRefreshJob);

    protected override async Task ExecuteJobAsync(CancellationToken cancellationToken)
    {
        using var scope = scopeFactory.CreateScope();
        var sponsorStore = scope.ServiceProvider.GetRequiredService<ISponsorStore>();

        await sponsorStore.DeactivateExpiredContractsAsync(cancellationToken);
        logger.LogInformation("Sponsor refresh: deactivated expired contracts at {UtcNow}", DateTime.UtcNow);
    }
}
