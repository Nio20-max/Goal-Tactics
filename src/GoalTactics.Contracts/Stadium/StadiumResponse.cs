using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Stadium;

public sealed class StadiumResponse : ResponseObject
{
    public List<BuildingData>? Buildings { get; init; }
    public string? Name { get; init; }
    public long VisitorsLastMatch { get; init; }
    public long VisitorsAverage { get; init; }
    public long VisitorsTotal { get; init; }
    public long EarningsLastMatch { get; init; }
    public long EarningsAverage { get; init; }
    public long EarningsTotal { get; init; }
    public int GrassQuality { get; init; }
    public int ChangeNameCost { get; init; }
    public int RenewGrassCost { get; init; }
    public int SpeedupCost { get; init; }
    public int MaxBuildingLevel { get; init; }
}

public sealed class BuildingData
{
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public string? Description { get; init; }
    public string? EffectName { get; init; }
    public int CurrentValue { get; init; }
    public int MaxValue { get; init; }
    public int NewValue { get; init; }
    public string? BuildStart { get; init; }
    public string? BuildEnd { get; init; }
    public long Earnings { get; init; }
    public int Utilization { get; init; }
    public decimal UpgradeCost { get; init; }
    public decimal UpgradeCostPremium { get; init; }
    public decimal DailyCost { get; init; }
    public decimal DailyCostIncrease { get; init; }
    public decimal Profit { get; init; }
    public string? ProfitSign { get; init; }
    public decimal ProfitIncrease { get; init; }
    public decimal Duration { get; init; }
    public int Capacity { get; init; }
    public bool HasWarning { get; init; }
}
