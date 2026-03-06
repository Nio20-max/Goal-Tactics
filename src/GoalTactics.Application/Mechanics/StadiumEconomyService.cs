namespace GoalTactics.Application.Mechanics;

public sealed class StadiumEconomyService
{
    public int CalculateMatchdayEarnings(int attendance, int ticketPrice, int maintenance)
    {
        return Math.Max(0, attendance * ticketPrice - maintenance);
    }
}
