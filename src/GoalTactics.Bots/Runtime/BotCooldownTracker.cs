namespace GoalTactics.Bots.Runtime;

public sealed class BotCooldownTracker
{
    private readonly Dictionary<(Guid BotId, string Action), DateTime> cooldowns = new();

    public bool IsReady(Guid botId, string action, DateTime nowUtc)
    {
        if (!cooldowns.TryGetValue((botId, action), out var until))
        {
            return true;
        }

        return nowUtc >= until;
    }

    public void SetCooldown(Guid botId, string action, DateTime nowUtc, TimeSpan duration)
    {
        cooldowns[(botId, action)] = nowUtc.Add(duration);
    }
}
