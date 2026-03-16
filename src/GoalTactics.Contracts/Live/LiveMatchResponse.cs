using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.League;

namespace GoalTactics.Contracts.Live;

/// <summary>MatchDetailsResponse in Android app.</summary>
public sealed class LiveMatchResponse : ResponseObject
{
    public MatchData? Match { get; init; }

    /// <summary>Xamarin reads Report at response level.</summary>
    public string? Report { get; init; }
}

public sealed class MatchReportData
{
    public IReadOnlyList<MatchReportEntryData>? MatchEvents { get; init; }
    public IReadOnlyList<LineUp>? HomeLineUp { get; init; }
    public IReadOnlyList<LineUp>? AwayLineUp { get; init; }
}

public sealed class MatchReportEntryData
{
    public Severity EntrySeverity { get; init; }
    public EventType Type { get; init; }
    public bool IsAdditionalTime { get; init; }
    public bool IsHomeTeamEvent { get; init; }
    public string? KeyPlayerName { get; init; }
    public string? KeyPlayerName2 { get; init; }
    public int Minute { get; init; }
    public string? Message { get; init; }
    public int HomeTeamGoals { get; init; }
    public int AwayTeamGoals { get; init; }
    public int HomeTeamGoalshots { get; init; }
    public int AwayTeamGoalshots { get; init; }
    public int HomeTeamCorners { get; init; }
    public int AwayTeamCorners { get; init; }
    public int HomeTeamOffside { get; init; }
    public int AwayTeamOffside { get; init; }
    public int HomeTeamActions { get; init; }
    public int AwayTeamActions { get; init; }
    public int HomeTeamFouls { get; init; }
    public int AwayTeamFouls { get; init; }
    public int HomeTeamYellowCards { get; init; }
    public int AwayTeamYellowCards { get; init; }
    public int HomeTeamRedCards { get; init; }
    public int AwayTeamRedCards { get; init; }
    public int Second { get; init; }
    public bool IsMinuteVisible { get; init; }
}

public sealed class LineUp
{
    public Guid ID { get; init; }
    public int Position { get; init; }
    public Guid MatchSystemFieldID { get; init; }
    public string? Name { get; init; }
    public int ShirtNr { get; init; }
    public bool IsSubstitude { get; init; }
    public int SkillRating { get; init; }
}

public enum Severity
{
    Normal,
    Medium,
    High
}

public enum EventType
{
    KickOff,
    StandardAction,
    GoalShot,
    Goal,
    Freekick,
    FreekickGoal,
    Halftime,
    Overtime,
    Penalty,
    PenaltyGoal,
    Corner,
    CornerGoal,
    ThrowIn,
    FoulRed,
    FoulYellow,
    FoulYellowRed,
    End,
    Injury,
    HardInjury,
    Replacement,
    MatchInfo,
    Statistic
}

/// <summary>A single match event with a human-readable description.</summary>
public sealed class LiveMatchEventData
{
    public int Minute { get; init; }
    public string? Type { get; init; }
    public bool IsHome { get; init; }
    public string? PlayerName { get; init; }
    public string? Description { get; init; }
}
