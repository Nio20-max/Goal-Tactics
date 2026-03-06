namespace GoalTactics.Contracts.Stadium;

public sealed class BuildPlaceData
{
    public Guid Id { get; init; }

    public string? BuildingType { get; init; }

    public int Level { get; init; }

    public bool CanBuild { get; init; }
}
