using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Training;

public sealed class TeamTrainingSaveRequest : RequestObject
{
    public int MainSkillIndex { get; init; }

    public int SubSkillIndex { get; init; }
}
