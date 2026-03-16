namespace GoalTactics.Application.Mechanics;

public sealed class InjuryAndCardService
{
    public int CalculateInjuryDays(int severity)
    {
        return Math.Clamp(severity * 2, 1, 60);
    }

    public int CalculateSuspensionMatches(int yellowCards, bool redCard)
    {
        // Standard football rule: one match suspension for a red card, or for a "3 yellows" accumulation.
        if (redCard)
            return 1;

        return yellowCards >= 3 ? 1 : 0;
    }
}
