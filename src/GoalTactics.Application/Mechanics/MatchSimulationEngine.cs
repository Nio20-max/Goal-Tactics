namespace GoalTactics.Application.Mechanics;

public sealed class MatchSimulationEngine
{
    public (int HomeScore, int AwayScore, string Report) Simulate(int homeStrength, int awayStrength)
    {
        var seed = HashCode.Combine(homeStrength, awayStrength, Guid.NewGuid());
        var random = new Random(seed);

        var diff = homeStrength - awayStrength;
        var homeBase = random.Next(0, 3) + diff / 25;
        var awayBase = random.Next(0, 3) - diff / 30;

        var homeScore = Math.Max(0, homeBase);
        var awayScore = Math.Max(0, awayBase);

        var report = $"Simulated result {homeScore}:{awayScore}";
        return (homeScore, awayScore, report);
    }
}
