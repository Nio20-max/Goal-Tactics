using GoalTactics.Bots.Config;

namespace GoalTactics.Bots.Runtime;

public sealed class BotWorldClock
{
    private readonly SimulationOptions simulationOptions;

    public BotWorldClock(SimulationOptions simulationOptions)
    {
        this.simulationOptions = simulationOptions;
        CurrentUtc = simulationOptions.StartDate.ToDateTime(new TimeOnly(0, 0), DateTimeKind.Utc);
    }

    public DateTime CurrentUtc { get; private set; }

    public int CurrentSeason { get; private set; } = 1;

    public int CurrentMatchday { get; private set; } = 1;

    public void AdvanceToDailyTime(TimeOnly utcTime)
    {
        CurrentUtc = CurrentUtc.Date.Add(utcTime.ToTimeSpan());
    }

    public void AdvanceDay()
    {
        CurrentUtc = CurrentUtc.Date.AddDays(1);
    }

    public void AdvanceMatchday()
    {
        CurrentMatchday++;
        if (CurrentMatchday > simulationOptions.MatchdaysPerSeason)
        {
            CurrentMatchday = 1;
            CurrentSeason++;
        }
    }
}
