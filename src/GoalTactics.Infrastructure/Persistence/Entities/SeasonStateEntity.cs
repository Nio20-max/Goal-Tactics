namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class SeasonStateEntity
{
    // singleton row, Id always "singleton" or any constant
    public required string Id { get; set; }

    public int LastSeasonProcessed { get; set; }
}