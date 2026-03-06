using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Ladder;

public sealed class LadderMatchResponse : ResponseObject
{
    public string? MatchReport { get; init; }

    public int Stamina { get; init; }
}
