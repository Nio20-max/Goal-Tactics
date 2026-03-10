using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Ladder;

public sealed class LadderMatchResponse : ResponseObject
{
    public LadderMatchData? MatchReport { get; init; }
    public string? Stamina { get; init; }
}

public sealed class LadderMatchData
{
    public List<LadderEvent>? Events { get; init; }
    public MatchTeamData? Home { get; init; }
    public MatchTeamData? Away { get; init; }
}

public sealed class LadderEvent
{
    public int Minute { get; init; }
    public string? Message { get; init; }
    public int EventType { get; init; }
    public bool IsHome { get; init; }
    public int HomeScore { get; init; }
    public int AwayScore { get; init; }
}

public sealed class MatchTeamData
{
    public decimal Strength { get; init; }
    public string? TeamName { get; init; }
    public TeamLineup? Lineup { get; init; }
}

public sealed class TeamLineup
{
    public string? SystemName { get; init; }
    public string? TacticName { get; init; }
}
