using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Ladder;

public sealed class LadderChallengeResponse : ResponseObject
{
    public LadderTeamData? HomeTeam { get; init; }

    public LadderTeamData? AwayTeam { get; init; }

    public int WinPoints { get; init; }

    public int LosePoints { get; init; }

    public int Stamina { get; init; }

    public int StaminaCost { get; init; }

    public string? LadderDate { get; init; }

    public int MatchCost { get; init; }
}
