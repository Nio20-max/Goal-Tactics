using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class PlayerStatisticsResponse : ResponseObject
{
    public int RedCardsThisSeason { get; init; }
    public int RedCardsTotalThisTeam { get; init; }
    public int RedCardsTotal { get; init; }
    public int YellowCardsThisSeason { get; init; }
    public int YellowCardsTotalThisTeam { get; init; }
    public int YellowCardsTotal { get; init; }
    public int GoalsScoredThisSeason { get; init; }
    public int GoalsScoredTotalThisTeam { get; init; }
    public int GoalsScoredTotal { get; init; }
    public int HattricksThisSeason { get; init; }
    public int HattricksTotalThisTeam { get; init; }
    public int HattricksTotal { get; init; }
    public int MatchesThisSeason { get; init; }
    public int MatchesTotalThisTeam { get; init; }
    public int MatchesTotal { get; init; }
}
