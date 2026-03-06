using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.League;

public sealed class LeagueTableResponse : ResponseObject
{
    public IReadOnlyList<LeagueTableData> Teams { get; init; } = [];

    public string? LeagueName { get; init; }

    public int Mount { get; init; }

    public int Dismount { get; init; }
}
