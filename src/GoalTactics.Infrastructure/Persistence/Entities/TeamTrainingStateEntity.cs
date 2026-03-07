namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamTrainingStateEntity
{
    public required string TeamId { get; set; }

    public int MainSkillIndex { get; set; }

    public int SubSkillIndex { get; set; }

    public string CampType { get; set; } = string.Empty;

    public DateTime? CampActiveUntilUtc { get; set; }

    public TeamEntity? Team { get; set; }
}
