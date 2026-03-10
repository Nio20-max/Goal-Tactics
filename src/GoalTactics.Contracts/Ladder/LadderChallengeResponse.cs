using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Ladder;

public sealed class LadderChallengeResponse : ResponseObject
{
    public LadderChallengeTeamData? HomeTeam { get; init; }

    public LadderChallengeTeamData? AwayTeam { get; init; }

    public int WinPoints { get; init; }

    public int LosePoints { get; init; }

    public int Stamina { get; init; }

    public int StaminaCost { get; init; }

    public string? LadderDate { get; init; }

    public int MatchCost { get; init; }
}

public sealed class LadderChallengeTeamData : LadderTeamData
{
    public string? Trikot { get; init; }
    public string? Tactics { get; init; }
    public string? Scheme { get; init; }
}
