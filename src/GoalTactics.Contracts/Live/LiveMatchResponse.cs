using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Live;

public sealed class LiveMatchResponse : ResponseObject
{
    public LiveMatchData? Match { get; init; }
}
