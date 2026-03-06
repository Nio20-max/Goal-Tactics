namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamResourcesEntity
{
    public required string TeamId { get; set; }

    public decimal Money { get; set; }

    public decimal Medipacks { get; set; }

    public decimal GTStars { get; set; }

    public TeamEntity? Team { get; set; }
}
