namespace GoalTactics.Contracts.League;

public sealed class GoalGetterPlayerData
{
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public string? Country { get; init; }
    public string? Head { get; init; }
    public decimal Strength { get; init; }
    public int Talent { get; init; }
    public int Age { get; init; }
    public int Position { get; init; }
    public string? EndDate { get; init; }
    public string? TeamName { get; init; }
    public string? TeamLogo { get; init; }
    public bool IsMine { get; init; }
    public int Goals { get; init; }
}
