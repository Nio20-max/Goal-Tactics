using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;
using GoalTactics.Bots.Client.Neural;

namespace GoalTactics.Bots.Client.Behaviors;

/// <summary>
/// Stadium building behavior prioritized by youth focus.
/// Training center and scouting first for high youth focus bots.
/// Parking last. No standing places if existing ones aren't filled.
/// </summary>
public sealed class StadiumBehavior
{
    // Known building name keywords (used to identify priorities)
    private static readonly string[] YouthBuildings = ["training", "scouting", "academy"];
    private static readonly string[] CoreBuildings = ["main", "seating", "vip"];
    private const string ParkingKeyword = "parking";
    private const string StandingKeyword = "standing";

    private sealed class BuildingSnapshot
    {
        public string Id { get; init; } = "";
        public string Name { get; init; } = "";
        public int Utilization { get; init; }
    }

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan = null)
    {
        var response = await api.ExecuteForBotAsync("GetStadium");
        if (!response.Success) return;

        var buildings = BotApiTranslationReader.GetObjectList(response, "buildings")
            .Select(ToBuilding)
            .Where(b => !string.IsNullOrEmpty(b.Id))
            .ToList();
        if (buildings is null || buildings.Count == 0) return;

        // Determine if the stadium is at capacity using the embedded StadiumDataDto
        int capacity = 0;
        var stadium = BotApiTranslationReader.GetObject(response, "stadium");
        if (stadium is not null)
        {
            capacity = BotApiTranslationReader.GetInt(stadium, "capacity");
        }

        int utilization = buildings.Sum(b => b.Utilization);
        bool capacityFull = capacity > 0 && utilization >= capacity;

        // Build priority list based on youth focus
        var toBuild = DetermineBuildPriority(buildings, bot.YouthFocus, capacityFull);

        foreach (string buildingId in toBuild)
        {
            await api.ExecuteForBotAsync("BuildStadium", new IdRequest { Id = buildingId });
        }
    }

    /// <summary>
    /// Returns building IDs to upgrade, ordered by priority.
    /// </summary>
    private static List<string> DetermineBuildPriority(
        List<BuildingSnapshot> buildings, int youthFocus, bool capacityFull)
    {
        var priority = new List<string>();

        // Separate buildings by name keywords
        var youth = buildings.Where(b => YouthBuildings.Any(y =>
            b.Name.Contains(y, StringComparison.OrdinalIgnoreCase))).ToList();

        var core = buildings.Where(b => CoreBuildings.Any(c =>
            b.Name.Contains(c, StringComparison.OrdinalIgnoreCase))).ToList();

        var standing = buildings.Where(b =>
            b.Name.Contains(StandingKeyword, StringComparison.OrdinalIgnoreCase)).ToList();

        var parking = buildings.Where(b =>
            b.Name.Contains(ParkingKeyword, StringComparison.OrdinalIgnoreCase)).ToList();

        // High youth focus → prioritize training/scouting
        if (youthFocus > 50)
        {
            priority.AddRange(youth.Select(b => b.Id));
            priority.AddRange(core.Select(b => b.Id));
        }
        else
        {
            priority.AddRange(core.Select(b => b.Id));
            priority.AddRange(youth.Select(b => b.Id));
        }

        // Don't build standing places if not all are filled
        if (capacityFull)
        {
            priority.AddRange(standing.Select(b => b.Id));
        }

        // Parking is always last, and only if capacity is full
        if (capacityFull)
        {
            priority.AddRange(parking.Select(b => b.Id));
        }

        return priority;
    }

    private static BuildingSnapshot ToBuilding(Dictionary<string, object?> data)
        => new()
        {
            Id = BotApiTranslationReader.GetString(data, "id"),
            Name = BotApiTranslationReader.GetString(data, "name"),
            Utilization = BotApiTranslationReader.GetInt(data, "utilization")
        };
}
