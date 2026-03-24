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
    private const string OfficeId = "d1709f1f-8c8e-437f-962e-3e6bf2a90dcc";
    private const string TrainingCenterId = "7ffe23ce-8b4e-4d56-8079-78b2a08adc96";
    private const string MedicalCenterId = "4b36139b-78ab-4250-b236-89064a82230e";
    private const string YouthAcademyId = "f5895854-a8eb-4b2d-8d9e-0bfab48cc961";
    private const string FanShopId = "1f7b17ca-7cd0-4f46-b295-efd718bc1f84";
    private const string ParkingId = "ebaca28b-5b21-4cd7-9259-7c1ffecd8baf";
    private const string StadiumStandsId = "6841898a-1a0a-4b66-90e4-f52cf4720fb8";
    private const string StadiumSeatsId = "8bfa436e-5080-4732-82bf-9279794e8bb7";
    private const string StadiumVipsId = "6ad08b4e-c787-4ff3-8517-c67dfdb27bcd";

    private const decimal StandCostPerBlock = 10_000m;
    private const decimal SeatCostPerBlock = 30_000m;
    private const decimal VipCostPerBlock = 2_000m;

    private enum BuildingKind
    {
        Unknown,
        Office,
        TrainingCenter,
        MedicalCenter,
        YouthAcademy,
        FanShop,
        Parking,
        StadiumStands,
        StadiumSeats,
        StadiumVips
    }

    private sealed class BuildingSnapshot
    {
        public string Id { get; init; } = "";
        public string Name { get; init; } = "";
        public BuildingKind Kind { get; init; }
        public int Utilization { get; init; }
        public int CurrentValue { get; init; }
        public int MaxValue { get; init; }
        public decimal UpgradeCost { get; init; }
    }

    public async Task ExecuteAsync(GoalTacticsApiClient api, BotRecord bot, BotNightPlan? nightPlan = null)
    {
        var response = await api.ExecuteForBotAsync("GetStadium");
        if (!response.Success) return;

        var buildings = BotApiTranslationReader.GetObjectList(response, "buildings")
            .Select(ToBuilding)
            .Where(b => b.Kind != BuildingKind.Unknown)
            .ToList();
        if (buildings is null || buildings.Count == 0) return;

        decimal money = 0;
        try
        {
            var resources = await api.ExecuteForBotAsync("GetMyResources");
            if (resources.Success)
            {
                money = BotApiTranslationReader.GetDecimal(resources.Output, "money");
            }
        }
        catch
        {
            // Keep behavior best-effort if resources endpoint is unavailable.
        }

        // Build priority list based on deterministic IDs and staged progression strategy.
        var toBuild = DetermineBuildPriority(buildings, bot.YouthFocus, nightPlan);

        foreach (var building in toBuild)
        {
            if (building.CurrentValue >= building.MaxValue)
            {
                continue;
            }

            if (building.Kind is BuildingKind.StadiumVips or BuildingKind.StadiumSeats or BuildingKind.StadiumStands)
            {
                var desiredSeatCount = DetermineSeatBatch(building, money, buildings);
                if (desiredSeatCount <= 0)
                {
                    continue;
                }

                try
                {
                    await api.ExecuteForBotAsync("BuildPlaces", new BuildPlacesRequest
                    {
                        Places =
                        [
                            new PlaceOrder
                            {
                                Id = building.Id,
                                Count = desiredSeatCount
                            }
                        ]
                    });

                    money -= EstimateSeatCost(building.Kind, desiredSeatCount);
                    break;
                }
                catch
                {
                    continue;
                }
            }

            if (building.UpgradeCost > 0 && money > 0 && building.UpgradeCost > money)
            {
                continue;
            }

            try
            {
                await api.ExecuteForBotAsync("BuildStadium", new IdRequest { Id = building.Id });

                if (building.UpgradeCost > 0 && money > 0)
                {
                    money -= building.UpgradeCost;
                }

                // Keep one construction order per online session.
                break;
            }
            catch
            {
                continue;
            }
        }
    }

    private static List<BuildingSnapshot> DetermineBuildPriority(
        List<BuildingSnapshot> buildings,
        int youthFocus,
        BotNightPlan? nightPlan)
    {
        var priority = new List<BuildingSnapshot>();

        var office = Find(buildings, BuildingKind.Office);
        var training = Find(buildings, BuildingKind.TrainingCenter);
        var youth = Find(buildings, BuildingKind.YouthAcademy);
        var medical = Find(buildings, BuildingKind.MedicalCenter);
        var fanShop = Find(buildings, BuildingKind.FanShop);
        var parking = Find(buildings, BuildingKind.Parking);
        var stands = Find(buildings, BuildingKind.StadiumStands);
        var seats = Find(buildings, BuildingKind.StadiumSeats);
        var vips = Find(buildings, BuildingKind.StadiumVips);

        var earlyOfficeTarget = 4;
        var earlyTrainingTarget = 4;
        var midOfficeTarget = 8;
        var infrastructureTarget = Math.Max(10, 8 + ((nightPlan?.ScoutIntensity ?? youthFocus) / 20));

        // Stage 1: office and training first.
        if (office is not null && office.CurrentValue < earlyOfficeTarget)
        {
            priority.Add(office);
            return priority;
        }

        if (training is not null && training.CurrentValue < earlyTrainingTarget)
        {
            priority.Add(training);
            return priority;
        }

        // Stage 2: modest stadium expansion.
        if (stands is not null && stands.CurrentValue < Math.Min(2600, stands.MaxValue))
        {
            priority.Add(stands);
            return priority;
        }

        if (seats is not null && seats.CurrentValue < Math.Min(3000, seats.MaxValue))
        {
            priority.Add(seats);
            return priority;
        }

        if (vips is not null && vips.CurrentValue < Math.Min(320, vips.MaxValue))
        {
            priority.Add(vips);
            return priority;
        }

        // Stage 3: strengthen training + youth before heavy stadium push.
        if (office is not null && office.CurrentValue < midOfficeTarget)
        {
            priority.Add(office);
        }

        if (training is not null && training.CurrentValue < infrastructureTarget)
        {
            priority.Add(training);
        }

        if (youth is not null && youth.CurrentValue < infrastructureTarget)
        {
            priority.Add(youth);
        }

        if (medical is not null && medical.CurrentValue < Math.Min(infrastructureTarget - 1, medical.MaxValue))
        {
            priority.Add(medical);
        }

        if (fanShop is not null && fanShop.CurrentValue < Math.Min(infrastructureTarget - 1, fanShop.MaxValue))
        {
            priority.Add(fanShop);
        }

        if (priority.Count > 0)
        {
            return priority;
        }

        // Stage 4: heavy stadium expansion.
        if (youthFocus >= 55)
        {
            AddIfUpgradeable(priority, vips);
            AddIfUpgradeable(priority, seats);
            AddIfUpgradeable(priority, stands);
        }
        else
        {
            AddIfUpgradeable(priority, seats);
            AddIfUpgradeable(priority, stands);
            AddIfUpgradeable(priority, vips);
        }

        if (parking is not null && parking.CurrentValue < parking.MaxValue)
        {
            priority.Add(parking);
        }

        AddIfUpgradeable(priority, office);
        AddIfUpgradeable(priority, training);
        AddIfUpgradeable(priority, youth);

        return priority;
    }

    private static BuildingSnapshot? Find(List<BuildingSnapshot> buildings, BuildingKind kind)
        => buildings.FirstOrDefault(b => b.Kind == kind);

    private static void AddIfUpgradeable(List<BuildingSnapshot> priority, BuildingSnapshot? building)
    {
        if (building is not null && building.CurrentValue < building.MaxValue)
        {
            priority.Add(building);
        }
    }

    private static int DetermineSeatBatch(BuildingSnapshot building, decimal money, List<BuildingSnapshot> allBuildings)
    {
        var blockSize = building.Kind == BuildingKind.StadiumVips ? 10 : 100;
        var costPerBlock = building.Kind switch
        {
            BuildingKind.StadiumVips => VipCostPerBlock,
            BuildingKind.StadiumSeats => SeatCostPerBlock,
            _ => StandCostPerBlock
        };

        var remaining = Math.Max(0, building.MaxValue - building.CurrentValue);
        if (remaining <= 0)
        {
            return 0;
        }

        var maxBlocksByCapacity = Math.Max(1, (remaining + blockSize - 1) / blockSize);
        var affordableBlocks = (int)Math.Floor(money / costPerBlock);
        if (affordableBlocks <= 0)
        {
            return 0;
        }

        var office = Find(allBuildings, BuildingKind.Office)?.CurrentValue ?? 1;
        var training = Find(allBuildings, BuildingKind.TrainingCenter)?.CurrentValue ?? 1;
        var youth = Find(allBuildings, BuildingKind.YouthAcademy)?.CurrentValue ?? 1;
        var infrastructureReady = office >= 8 && training >= 10 && youth >= 10;

        var desiredBlocks = infrastructureReady
            ? (money >= 12_000_000m ? 10 : (money >= 4_000_000m ? 6 : 3))
            : 2;

        var blocks = Math.Min(maxBlocksByCapacity, Math.Min(affordableBlocks, desiredBlocks));
        return Math.Max(1, blocks) * blockSize;
    }

    private static decimal EstimateSeatCost(BuildingKind kind, int seatCount)
    {
        var blockSize = kind == BuildingKind.StadiumVips ? 10 : 100;
        var blocks = Math.Max(1, seatCount / blockSize);
        return kind switch
        {
            BuildingKind.StadiumVips => blocks * VipCostPerBlock,
            BuildingKind.StadiumSeats => blocks * SeatCostPerBlock,
            _ => blocks * StandCostPerBlock
        };
    }

    private static BuildingKind ResolveKind(string id)
        => id switch
        {
            OfficeId => BuildingKind.Office,
            TrainingCenterId => BuildingKind.TrainingCenter,
            MedicalCenterId => BuildingKind.MedicalCenter,
            YouthAcademyId => BuildingKind.YouthAcademy,
            FanShopId => BuildingKind.FanShop,
            ParkingId => BuildingKind.Parking,
            StadiumStandsId => BuildingKind.StadiumStands,
            StadiumSeatsId => BuildingKind.StadiumSeats,
            StadiumVipsId => BuildingKind.StadiumVips,
            _ => BuildingKind.Unknown
        };

    private static BuildingSnapshot ToBuilding(Dictionary<string, object?> data)
        => new()
        {
            Id = BotApiTranslationReader.GetString(data, "id"),
            Name = BotApiTranslationReader.GetString(data, "name"),
            Kind = ResolveKind(BotApiTranslationReader.GetString(data, "id")),
            Utilization = BotApiTranslationReader.GetInt(data, "utilization"),
            CurrentValue = BotApiTranslationReader.GetInt(data, "currentValue"),
            MaxValue = BotApiTranslationReader.GetInt(data, "maxValue"),
            UpgradeCost = BotApiTranslationReader.GetDecimal(data, "upgradeCost")
        };
}
