using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Squad;

namespace GoalTactics.Contracts.Training;

/// <summary>TrainingData : ResponseObject in decompiled app.</summary>
public sealed class TeamTrainingResponse : ResponseObject
{
    public TeamTrainingData? TeamTraining { get; init; }
    public TacticTrainingData? TacticTraining { get; init; }
    public TrainingCampData? TrainingCamp { get; init; }
    public IndividualTrainingData? IndividualTraining { get; init; }
}

public sealed class TacticTrainingData : ResponseObject
{
    public TacticBonus[]? TacticBonusList { get; init; }
    public Guid SelectedTacticId { get; init; }
}

public sealed class TacticBonus
{
    public TacticBonusTactic? Tactic { get; init; }
    public CounterTactic[]? CounterTactics { get; init; }
}

public sealed class TacticBonusTactic
{
    public Guid Id { get; init; }
    public string? Name { get; init; }
    public int Value { get; init; }
}

public sealed class CounterTactic
{
    public Guid TacticId { get; init; }
    public decimal Bonus { get; init; }
    public int MaxBonus { get; init; }
}

public sealed class TrainingCampData : ResponseObject
{
    public TrainingCampItem[]? CampItems { get; init; }
    public int UpdateCampsCost { get; init; }
    public bool IsUpdateEnabled { get; init; }
}

public sealed class TrainingCampItem
{
    public string? Identifier { get; init; }
    public string? Image { get; init; }
    public string? Name { get; init; }
    public int Effect { get; init; }
    public int Variant { get; init; }
    public decimal Power { get; init; }
    public bool Percent { get; init; }
    public int PriceEuro { get; init; }
    public int PriceStars { get; init; }
    public string? BookDate { get; init; }
}

public sealed class IndividualTrainingData : ResponseObject
{
    public TrainingPlayerData[]? Players { get; init; }
    public int TrainPrice { get; init; }
    public int RenewPrice { get; init; }
    public int RenewAllPrice { get; init; }
}

public sealed class TrainingPlayerData : SquadPlayerData
{
    public int SkillIndex { get; init; }
    public decimal SkillChange { get; init; }
    public decimal TotalChange { get; init; }
    public new decimal[]? Skills { get; init; }
    public bool HasContract { get; init; }
}
