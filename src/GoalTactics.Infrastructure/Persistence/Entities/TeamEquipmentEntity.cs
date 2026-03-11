namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamEquipmentEntity
{
    public required string Id { get; set; }

    public required string UserId { get; set; }

    public required string Image { get; set; }

    public required string EquipmentType { get; set; }

    public bool IsActive { get; set; }
}
