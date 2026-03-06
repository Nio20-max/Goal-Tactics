namespace GoalTactics.Application.Mechanics;

public sealed class MatchSimulationEngine
{
    public (int HomeScore, int AwayScore, string Report) Simulate(int homeStrength, int awayStrength)
    {
        var seed = HashCode.Combine(homeStrength, awayStrength, DateTime.UtcNow.DayOfYear);
        var random = new Random(seed);

        var homeBase = random.Next(0, 4) + homeStrength / 30;
        var awayBase = random.Next(0, 4) + awayStrength / 30;

        var homeScore = Math.Max(0, homeBase);
        var awayScore = Math.Max(0, awayBase);

        var report = $"Simulated result {homeScore}:{awayScore}";
        return (homeScore, awayScore, report);
    }
}
