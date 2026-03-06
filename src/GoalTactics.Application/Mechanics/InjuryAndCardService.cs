namespace GoalTactics.Application.Mechanics;

public sealed class InjuryAndCardService
{
    public int CalculateInjuryDays(int severity)
    {
        return Math.Clamp(severity * 2, 1, 60);
    }

    public int CalculateSuspensionMatches(int yellowCards, bool redCard)
    {
        if (redCard)
        {
            return 2;
        }

        return yellowCards >= 5 ? 1 : 0;
    }
}
