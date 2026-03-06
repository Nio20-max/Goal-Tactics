using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Tutorial;

public sealed class TutorialRequest : RequestObject
{
    public string? TopicID { get; init; }
}
