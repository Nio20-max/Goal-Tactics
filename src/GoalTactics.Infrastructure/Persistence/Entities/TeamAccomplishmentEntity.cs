namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamAccomplishmentEntity
{
    public required string Id { get; set; }

    public required string TeamId { get; set; }

    public required string Name { get; set; }

    public required string Image { get; set; }

    public required DateTime CreatedAtUtc { get; set; }
}
