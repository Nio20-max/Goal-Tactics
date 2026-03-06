namespace GoalTactics.Contracts.Team;

public sealed class ExtendedTeamData : TeamData
{
    public int LeaguePosition { get; init; }

    public int PlayersCount { get; init; }

    public string? BestVictory { get; init; }

    public string? WorstDefeat { get; init; }

    public int StadiumSize { get; init; }
}
