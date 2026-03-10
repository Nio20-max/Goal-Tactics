namespace GoalTactics.Contracts.Squad;

public sealed class SkillCardData
{
    public int Skill { get; init; }
    public int Rarity { get; init; }
    public int Count { get; init; } = 1;
    public decimal Bonus { get; init; }
}
