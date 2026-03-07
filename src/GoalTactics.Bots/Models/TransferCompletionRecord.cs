namespace GoalTactics.Bots.Models;

public sealed class TransferCompletionRecord
{
    public int Season { get; init; }

    public DateTime TimestampUtc { get; init; }

    public required Guid BuyerBotId { get; init; }

    public required string BuyerPersona { get; init; }

    public required string BuyerTeam { get; init; }

    public required string PlayerName { get; init; }

    public int PlayerAge { get; init; }

    public int PlayerStrength { get; init; }

    public int PlayerPotential { get; init; }

    public decimal FeeMoney { get; init; }
}
