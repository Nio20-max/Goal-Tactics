using System.Text.Json.Serialization;
using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Scouting;

public sealed class ScoutInstructionRequest : RequestObject
{
    public string? ScoutType { get; init; }

    [JsonPropertyName("type")]
    public string? Type { get; init; }

    public string? PositionFilter { get; init; }

    /// <summary>
    /// Position filter sent by Xamarin client.
    /// If omitted (null) the server will randomly choose a position.
    /// Legacy clients may send -1 for any, or 0-3 or 1-4 to select a position.
    /// </summary>
    public int? Position { get; init; }

    /// <summary>Price/cost sent by Xamarin client (e.g. 500000 for normal scout).</summary>
    public int Price { get; init; }
}
