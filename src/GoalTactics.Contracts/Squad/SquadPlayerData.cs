namespace GoalTactics.Contracts.Squad;

public class SquadPlayerData
{
    // PlayerData base fields
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public string? Country { get; init; }
    public string? Head { get; init; }
    public decimal Strength { get; init; }
    public int Talent { get; init; }
    public int Age { get; init; }
    public int Position { get; init; }
    public string? EndDate { get; init; }

    // SquadPlayerData fields
    public int Experience { get; init; }
    public decimal Fitness { get; init; }
    public string? Body { get; init; }
    public string? Gloves { get; init; }
    public string? Shoes { get; init; }
    public long Salary { get; init; }
    public long MarketValue { get; init; }
    public string? Origin { get; init; }
    public decimal[]? Skills { get; init; }
    public int MainSkill { get; init; }
    public int[]? BonusSkills { get; init; }
    public int YellowCards { get; init; }
    public bool HasRedCard { get; init; }
    public bool Injured { get; init; }
    public bool IsForSale { get; init; }
    public long SellPrice { get; init; }
    public long TransfermarketFee { get; init; }
    public long TransfermarketMaxOffer { get; init; }
    public long TransfermarketMinOffer { get; init; }
    public int TransfermarketMaxHours { get; init; }
    public bool IsUpgraded { get; init; }
    public decimal MaxUpgradeStrength { get; init; }
    public int Shirt { get; init; }
    public bool CanExtendContract { get; init; }
    public bool HasIndividualTraining { get; init; }
}
