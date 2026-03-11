namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamTrainingStateEntity
{
    public required string TeamId { get; set; }

    public int MainSkillIndex { get; set; }

    public int SubSkillIndex { get; set; }

    public string CampType { get; set; } = string.Empty;

    public DateTime? CampActiveUntilUtc { get; set; }

    /// <summary>When team training was last changed (for efficiency decay after 3 days).</summary>
    public DateTime? TrainingChangedAtUtc { get; set; }

    /// <summary>Currently trained tactic ID (GUID string).</summary>
    public string? SelectedTacticId { get; set; }

    /// <summary>When the current tactic training started (for 2%/day progression).</summary>
    public DateTime? SelectedTacticStartUtc { get; set; }

    public TeamEntity? Team { get; set; }
}
