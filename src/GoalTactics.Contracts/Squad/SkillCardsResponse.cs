using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class SkillCardsResponse : ResponseObject
{
    public IReadOnlyList<SkillCardData> SkillCards { get; init; } = [];
}
