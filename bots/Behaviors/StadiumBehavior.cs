using GoalTactics.Bots.Client.ApiClient;
using GoalTactics.Bots.Client.Database;

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

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        var response = await api.GetStadiumAsync();
        if (response is null) return;

        var buildings = response.Buildings;
        if (buildings is null || buildings.Count == 0) return;

        // Determine if the stadium is at capacity using the embedded StadiumDataDto
        int capacity = response.Stadium?.Capacity ?? 0;
        int utilization = buildings.Sum(b => b.Utilization);
        bool capacityFull = capacity > 0 && utilization >= capacity;

        // Build priority list based on youth focus
        var toBuild = DetermineBuildPriority(buildings, bot.YouthFocus, capacityFull);

        foreach (string buildingId in toBuild)
        {
            await api.BuildStadiumAsync(buildingId);
        }
    }

    /// <summary>
    /// Returns building IDs to upgrade, ordered by priority.
    /// </summary>
    private static List<string> DetermineBuildPriority(
        List<BuildingDto> buildings, int youthFocus, bool capacityFull)
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
}
