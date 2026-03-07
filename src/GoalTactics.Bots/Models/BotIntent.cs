namespace GoalTactics.Bots.Models;

public sealed class BotIntent
{
    public required string IntentType { get; init; }

    public required string Reason { get; init; }

    public required decimal Score { get; init; }

    public DateTime TimestampUtc { get; init; }

    public Dictionary<string, string> Metadata { get; init; } = new(StringComparer.Ordinal);
}
