namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamSkillCardEntity
{
    public required string Id { get; set; }

    public required string TeamId { get; set; }

    public int Skill { get; set; }

    public int Rarity { get; set; }

    public int Count { get; set; }

    public decimal Bonus { get; set; }

    public TeamEntity? Team { get; set; }
}
