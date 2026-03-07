using GoalTactics.Bots.Config;
using GoalTactics.Bots.Services;

namespace GoalTactics.Bots.Runtime;

public sealed class BotHostService(BotOptions options, BotSimulationRunner simulationRunner, BotLogWriter logWriter)
{
    public async Task RunAsync(CancellationToken cancellationToken)
    {
        await logWriter.WriteAsync("simulation-events.log", $"{DateTime.UtcNow:O}|host.start|mode={options.Mode}|seasons={options.Seasons}|logRoot={options.LogRootPath}");

        switch (options.Mode.ToLowerInvariant())
        {
            case "seed":
                await logWriter.WriteAsync("simulation-events.log", $"{DateTime.UtcNow:O}|seed.mode|botCount={options.BotCount}");
                break;
            case "live":
            case "simulate":
                await simulationRunner.RunAsync(cancellationToken);
                break;
            default:
                throw new InvalidOperationException($"Unknown bot mode '{options.Mode}'.");
        }

        await logWriter.WriteAsync("simulation-events.log", $"{DateTime.UtcNow:O}|host.stop|mode={options.Mode}");
    }
}
