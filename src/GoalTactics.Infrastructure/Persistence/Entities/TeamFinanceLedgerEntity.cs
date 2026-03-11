namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamFinanceLedgerEntity
{
    public required string Id { get; set; }
    public required string UserId { get; set; }
    public int Matchday { get; set; }
    public DateTime Date { get; set; }
    public required string BookingType { get; set; }
    public decimal Value { get; set; }
    public required string Description { get; set; }
    public bool IsEarning { get; set; }
}
