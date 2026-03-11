using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Squad;

public sealed class TrainingProgressResponse : ResponseObject
{
    public IReadOnlyList<IReadOnlyList<TrainingProgressData>> Progress { get; init; } = [];
}

public sealed class TrainingProgressData
{
    public string? Date { get; init; }
    public decimal Value { get; init; }
}