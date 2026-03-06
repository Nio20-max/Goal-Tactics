namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class LadderSeasonEntity
{
    public required string Id { get; set; }

    public DateTime EndDateUtc { get; set; }

    public DateTime CreatedAtUtc { get; set; }

    public ICollection<LadderEntryEntity> Entries { get; set; } = new List<LadderEntryEntity>();
}
