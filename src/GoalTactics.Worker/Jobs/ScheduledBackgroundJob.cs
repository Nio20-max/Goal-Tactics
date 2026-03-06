using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System.Collections.Concurrent;

namespace GoalTactics.Worker.Jobs;

public abstract class ScheduledBackgroundJob(ILogger logger, TimeSpan interval) : BackgroundService
{
    private static readonly ConcurrentDictionary<string, SemaphoreSlim> JobGates = new(StringComparer.Ordinal);

    protected abstract string JobName { get; }

    protected abstract Task ExecuteJobAsync(CancellationToken cancellationToken);

    protected override async Task ExecuteAsync(CancellationToken stoppingToken)
    {
        using var timer = new PeriodicTimer(interval);
        var jobGate = JobGates.GetOrAdd(JobName, _ => new SemaphoreSlim(1, 1));

        while (!stoppingToken.IsCancellationRequested)
        {
            if (!await jobGate.WaitAsync(0, stoppingToken))
            {
                logger.LogWarning("Worker job {JobName} skipped because a previous run is still active", JobName);

                if (!await timer.WaitForNextTickAsync(stoppingToken))
                {
                    break;
                }

                continue;
            }

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
            finally
            {
                jobGate.Release();
            }

            if (!await timer.WaitForNextTickAsync(stoppingToken))
            {
                break;
            }
        }
    }
}
