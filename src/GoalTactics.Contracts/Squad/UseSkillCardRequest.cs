using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class UseSkillCardRequest : IdRequest
{
    public SkillCardData? Card { get; init; }
}
