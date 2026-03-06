using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Tutorial;

public sealed class TutorialResponse : ResponseObject
{
    public TutorialStep? CurrentStep { get; init; }
}
