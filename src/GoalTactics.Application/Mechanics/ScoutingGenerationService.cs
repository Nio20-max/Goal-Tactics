namespace GoalTactics.Application.Mechanics;

public sealed class ScoutingGenerationService
{
    public int GenerateProspectStrength(int scoutLevel)
    {
        var random = new Random(HashCode.Combine(Guid.NewGuid(), scoutLevel));
        return Math.Clamp(45 + scoutLevel * 3 + random.Next(-5, 6), 30, 95);
    }
}
