namespace GoalTactics.Bots.Models;

public sealed class BotPerceptionSnapshot
{
    public required Guid BotId { get; init; }

    public DateTime TimestampUtc { get; init; }

    public bool HasUpcomingLeagueMatch { get; init; }

    public bool HasUpcomingFriendly { get; init; }

    public bool HasAuctionExpiringSoon { get; init; }

    public bool HasTrainingTickDue { get; init; }

    public decimal Money { get; init; }

    public decimal Stars { get; init; }

    public int SquadHealthRisk { get; init; }

    public int ContractRisk { get; init; }
}
