using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace GoalTactics.Worker.Jobs;

public abstract class ScheduledBackgroundJob(ILogger logger, TimeSpan interval) : BackgroundService
{
    protected abstract string JobName { get; }

    protected abstract Task ExecuteJobAsync(CancellationToken cancellationToken);

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        using var timer = new PeriodicTimer(interval);

        while (!stoppingToken.IsCancellationRequested)
        {
            try
            {
                await ExecuteJobAsync(stoppingToken);
            }
            catch (OperationCanceledException) when (stoppingToken.IsCancellationRequested)
            {
                return;
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Worker job {JobName} failed", JobName);
            }

            if (!await timer.WaitForNextTickAsync(stoppingToken))
            {
                break;
            }
        }
    }
}
