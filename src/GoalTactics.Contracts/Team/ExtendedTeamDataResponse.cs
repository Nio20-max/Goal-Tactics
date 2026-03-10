using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Team;

public sealed class MatchData
{
    public Guid Id { get; init; }
    public string? Date { get; init; }
    public string? HomeLogo { get; init; }
    public string? AwayLogo { get; init; }
    public string? HomeName { get; init; }
    public string? AwayName { get; init; }
    public int MyTeam { get; init; }
    public string? HomeCountry { get; init; }
    public string? AwayCountry { get; init; }
    public int HomeScore { get; init; }
    public int AwayScore { get; init; }
    public Guid OpponentTeamId { get; init; }
    public int HomeStrength { get; init; }
    public int AwayStrength { get; init; }
    public bool HasLineup { get; init; }
    public string? HomeTrikot { get; init; }
    public string? AwayTrikot { get; init; }
    public bool IsFriendly { get; init; }
}

public sealed class ExtendedTeamDataResponse : ResponseObject
{
    public ExtendedTeamData? TeamData { get; init; }

    public IReadOnlyList<ClubNews>? News { get; init; }

    public string? Season { get; init; }

    public string? SeasonStartDate { get; init; }

    public int Matchday { get; init; }

    public MatchData? LastMatch { get; init; }

    public MatchData? NextMatch { get; init; }

    public int RenameTeamCost { get; init; }
}
