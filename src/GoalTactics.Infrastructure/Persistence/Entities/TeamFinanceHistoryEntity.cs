namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamFinanceHistoryEntity
{
    public required string Id { get; set; }

    public required string UserId { get; set; }

    public DateTime Date { get; set; }

    public decimal Income { get; set; }

    public decimal Outcome { get; set; }

    public decimal Balance { get; set; }
}
