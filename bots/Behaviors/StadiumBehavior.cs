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
    // Known building types (names used to identify priorities)
    private static readonly string[] YouthBuildings = ["training", "scouting", "academy"];
    private static readonly string[] CoreBuildings = ["main", "seating", "vip"];
    private const string ParkingType = "parking";
    private const string StandingType = "standing";

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot)
    {
        var stadium = await api.GetStadiumAsync();
        if (stadium is null) return;

        var buildings = stadium.Buildings;
        bool capacityFull = stadium.FilledPlaces >= stadium.Capacity;

        // Build priority list based on youth focus
        var toBuild = DetermineBuildPriority(buildings, bot.YouthFocus, capacityFull);

        foreach (long buildingId in toBuild)
        {
            await api.BuildStadiumAsync(buildingId);
        }
    }

    /// <summary>
    /// Returns building IDs to upgrade, ordered by priority.
    /// </summary>
    private static List<long> DetermineBuildPriority(
        List<BuildingDto> buildings, int youthFocus, bool capacityFull)
    {
        var priority = new List<long>();

        // Separate buildings by type
        var youth = buildings.Where(b => YouthBuildings.Any(y =>
            b.Type.Contains(y, StringComparison.OrdinalIgnoreCase) ||
            b.Name.Contains(y, StringComparison.OrdinalIgnoreCase))).ToList();

        var core = buildings.Where(b => CoreBuildings.Any(c =>
            b.Type.Contains(c, StringComparison.OrdinalIgnoreCase) ||
            b.Name.Contains(c, StringComparison.OrdinalIgnoreCase))).ToList();

        var standing = buildings.Where(b =>
            b.Type.Contains(StandingType, StringComparison.OrdinalIgnoreCase) ||
            b.Name.Contains(StandingType, StringComparison.OrdinalIgnoreCase)).ToList();

        var parking = buildings.Where(b =>
            b.Type.Contains(ParkingType, StringComparison.OrdinalIgnoreCase) ||
            b.Name.Contains(ParkingType, StringComparison.OrdinalIgnoreCase)).ToList();

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
