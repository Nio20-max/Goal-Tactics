namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class SeasonStateEntity
{
    // singleton row, Id always "singleton" or any constant
    public required string Id { get; set; }

    public int LastSeasonProcessed { get; set; }

    public int SeasonNumber { get; set; }

    public int CurrentMatchday { get; set; }

    public DateTime? StartedAtUtc { get; set; }
}