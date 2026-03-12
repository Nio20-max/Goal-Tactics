using GoalTactics.Application.Mechanics;

namespace GoalTactics.UnitTests.Mechanics;

public sealed class MatchSimulationEngineTests
{
    [Fact]
    public void Simulate_DeterministicSeed_ProducesSameResult()
    {
        var engine = new MatchSimulationEngine();

        var (h1, a1, _) = engine.Simulate(80, 60, seed: 42);
        var (h2, a2, _) = engine.Simulate(80, 60, seed: 42);

        Assert.Equal(h1, h2);
        Assert.Equal(a1, a2);
    }

    [Fact]
    public void SimulateDetailed_ProducesDeterministicResults()
    {
        var engine = new MatchSimulationEngine();
        var homePlayers = CreatePlayers("home");
        var awayPlayers = CreatePlayers("away");

        var r1 = engine.SimulateDetailed(80, 60, "Normal", "Pressing", 0.8, 0.5, homePlayers, awayPlayers, seed: 42);
        var r2 = engine.SimulateDetailed(80, 60, "Normal", "Pressing", 0.8, 0.5, homePlayers, awayPlayers, seed: 42);

        Assert.Equal(r1.HomeScore, r2.HomeScore);
        Assert.Equal(r1.AwayScore, r2.AwayScore);
        Assert.Equal(r1.Events.Count, r2.Events.Count);
    }

    [Fact]
    public void SimulateDetailed_ProducesEvents()
    {
        var engine = new MatchSimulationEngine();
        var homePlayers = CreatePlayers("home");
        var awayPlayers = CreatePlayers("away");

        var result = engine.SimulateDetailed(80, 60, null, null, 0, 0, homePlayers, awayPlayers, seed: 123);

        // Should produce goals + potentially cards/injuries
        Assert.True(result.Events.Count > 0);
        Assert.True(result.HomeScore >= 0);
        Assert.True(result.AwayScore >= 0);
    }

    [Fact]
    public void SimulateDetailed_ScoresNonNegative()
    {
        var engine = new MatchSimulationEngine();

        // Run multiple simulations with different seeds
        for (var seed = 0; seed < 100; seed++)
        {
            var result = engine.SimulateDetailed(50, 90, null, null, 0, 0, null, null, seed: seed);
            Assert.True(result.HomeScore >= 0, $"Home score was {result.HomeScore} for seed {seed}");
            Assert.True(result.AwayScore >= 0, $"Away score was {result.AwayScore} for seed {seed}");
        }
    }

    [Fact]
    public void ApplyTacticBonus_GivesBonus_OneStepBelow()
    {
        // Normal (index 0) vs Pressing (index 1): Pressing is 1 step below Normal → Normal gets 10% bonus
        var result = MatchSimulationEngine.ApplyTacticBonus(1000, "Normal", 1.0, "Pressing");
        Assert.Equal(1100, result); // 10% of 1000 = 100
    }

    [Fact]
    public void ApplyTacticBonus_GivesBonus_TwoStepsBelow()
    {
        var result = MatchSimulationEngine.ApplyTacticBonus(1000, "Normal", 1.0, "CounterAttack");
        Assert.Equal(1050, result); // 5% of 1000 = 50
    }

    [Fact]
    public void ApplyTacticBonus_GivesBonus_ThreeStepsBelow()
    {
        var result = MatchSimulationEngine.ApplyTacticBonus(1000, "Normal", 1.0, "ThroughTheMiddle");
        Assert.Equal(1025, result); // 2.5% of 1000 = 25
    }

    [Fact]
    public void ApplyTacticBonus_NoBonus_SameTactic()
    {
        var result = MatchSimulationEngine.ApplyTacticBonus(1000, "Normal", 1.0, "Normal");
        Assert.Equal(1000, result);
    }

    [Fact]
    public void ApplyTacticBonus_ScaledByTraining()
    {
        // 50% training → 50% of the 10% bonus = 5%
        var result = MatchSimulationEngine.ApplyTacticBonus(1000, "Normal", 0.5, "Pressing");
        Assert.Equal(1050, result); // 5% of 1000 = 50
    }

    [Fact]
    public void ApplyTacticBonus_NullTactics_ReturnsBase()
    {
        var result = MatchSimulationEngine.ApplyTacticBonus(1000, null, 1.0, "Pressing");
        Assert.Equal(1000, result);
    }

    [Fact]
    public void SimulateDetailed_GoalScorersHavePlayerIds()
    {
        var engine = new MatchSimulationEngine();
        var homePlayers = CreatePlayers("home");
        var awayPlayers = CreatePlayers("away");

        // Run enough simulations to statistically produce goals
        var anyGoals = false;
        for (var seed = 0; seed < 50; seed++)
        {
            var result = engine.SimulateDetailed(80, 60, null, null, 0, 0, homePlayers, awayPlayers, seed: seed);
            foreach (var e in result.Events.Where(e => e.Type == MatchEventType.Goal))
            {
                Assert.NotNull(e.PlayerId);
                Assert.NotNull(e.PlayerName);
                anyGoals = true;
            }
        }
        Assert.True(anyGoals, "Expected at least some goals across many simulations");
    }

    private static List<SimulationPlayer> CreatePlayers(string teamId)
    {
        return
        [
            new SimulationPlayer("gk1", "Keeper One", "GK", 70, teamId),
            new SimulationPlayer("def1", "Defender One", "DEF", 65, teamId),
            new SimulationPlayer("def2", "Defender Two", "DEF", 68, teamId),
            new SimulationPlayer("def3", "Defender Three", "DEF", 62, teamId),
            new SimulationPlayer("def4", "Defender Four", "DEF", 66, teamId),
            new SimulationPlayer("mid1", "Midfielder One", "MID", 72, teamId),
            new SimulationPlayer("mid2", "Midfielder Two", "MID", 75, teamId),
            new SimulationPlayer("mid3", "Midfielder Three", "MID", 70, teamId),
            new SimulationPlayer("fwd1", "Forward One", "FWD", 82, teamId),
            new SimulationPlayer("fwd2", "Forward Two", "FWD", 78, teamId),
            new SimulationPlayer("fwd3", "Forward Three", "FWD", 80, teamId),
        ];
    }
}
