namespace GoalTactics.Contracts.TransferMarket;

public sealed class TransferPlayerData
{
    public Guid Id { get; init; }

    public string? Name { get; init; }

    public string? Position { get; init; }

    public int Strength { get; init; }

    public int MinimumBid { get; init; }

    public string? EndDate { get; init; }
}
