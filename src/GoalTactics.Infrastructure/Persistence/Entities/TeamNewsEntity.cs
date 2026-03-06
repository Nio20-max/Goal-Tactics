namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamNewsEntity
{
    public required string Id { get; set; }

    public required string TeamId { get; set; }

    public required string DateText { get; set; }

    public required string Title { get; set; }

    public required string Text { get; set; }
}
