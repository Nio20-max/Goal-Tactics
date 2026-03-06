namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class LeagueEntity
{
    public required string Id { get; set; }

    public int Tier { get; set; }

    public int GroupNumber { get; set; }

    public required string Name { get; set; }

    public int Mount { get; set; }

    public int Dismount { get; set; }

    public ICollection<LeagueTeamEntity> Teams { get; set; } = new List<LeagueTeamEntity>();
}
