using GoalTactics.Bots.Config;
using GoalTactics.Bots.Runtime;
using GoalTactics.Bots.Services;

namespace GoalTactics.SimulationTests.Bots;

public sealed class BotSimulationRunnerTests
{
    [Fact]
    public async Task RunAsync_Writes_Metrics_For_Two_Seasons()
    {
        var tempRoot = Path.Combine(Path.GetTempPath(), "goal-tactics-sim", Guid.NewGuid().ToString("N"));
        Directory.CreateDirectory(tempRoot);

        var options = new BotOptions
        {
            Mode = "simulate",
            BotCount = 96,
            Seasons = 2,
            LogRootPath = tempRoot,
            LeagueKickoffUtc = new TimeOnly(18, 0),
            FriendlyKickoffUtc = new TimeOnly(13, 0),
            TrainingTickUtc = new TimeOnly(8, 0),
            BidStarCost = 200,
            SponsorStarsPerDay = 500,
            StarsPerAd = 100,
            TeamsPerLeague = 16,
            EnableChat = true,
            EnableFriendlies = true,
            MaxActionsPerSession = 8
        };

        var simulation = new SimulationOptions { MatchdaysPerSeason = 2, StartDate = new DateOnly(2026, 1, 1) };

        await using var writer = new BotLogWriter(tempRoot);
        var runner = BuildRunner(options, simulation, writer);

        await runner.RunAsync(CancellationToken.None);

        var csvPath = Path.Combine(tempRoot, "metrics.csv");
        var csv = await File.ReadAllLinesAsync(csvPath);

        Assert.True(File.Exists(Path.Combine(tempRoot, "metrics.json")));
        Assert.True(csv.Length >= 3);
        Assert.Contains("season,matches,goals", csv[0]);
    }

    private static BotSimulationRunner BuildRunner(BotOptions options, SimulationOptions simulation, BotLogWriter writer)
    {
        var scheduler = new BotActionScheduler(
            new BotLineupPlanner(),
            new BotTrainingPlanner(),
            new BotScoutingPlanner(),
            new BotTransferPlanner(),
            new BotFinancePlanner(),
            new BotSponsorPlanner(),
            new BotLadderPlanner(),
            new BotFriendlyPlanner(),
            new BotChatPlanner());

        var metrics = new BotMetricsCollector();
        var executor = new BotActionExecutor(options, new BotCooldownTracker(), new BotMessageGenerator("does-not-exist.json"), metrics);

        return new BotSimulationRunner(
            options,
            simulation,
            new BotRegistry(options),
            new BotWorldClock(simulation),
            scheduler,
            executor,
            metrics,
            new BotPlayerCareerTracker(options),
            new BotTeamSeasonTracker(),
            writer);
    }
}
