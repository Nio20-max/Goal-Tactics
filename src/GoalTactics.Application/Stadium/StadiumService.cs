using GoalTactics.Contracts.Stadium;
using GoalTactics.Application.Team;

namespace GoalTactics.Application.Stadium;

public interface IStadiumService
{
    Task<StadiumResponse> GetStadiumAsync(string userId, CancellationToken cancellationToken = default);

    Task<BuildPlacesResponse> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default);

    Task BuildAsync(string userId, Guid placeId, int count = 1, CancellationToken cancellationToken = default);

    Task SpeedupAsync(string userId, Guid buildId, CancellationToken cancellationToken = default);

    Task RenewGrassAsync(string userId, CancellationToken cancellationToken = default);

    Task RenameAsync(string userId, string? name, CancellationToken cancellationToken = default);

    Task<UnderConstructionResponse> GetUnderConstructionAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class StadiumService(ITeamStore teamStore) : IStadiumService
{
    public async Task<StadiumResponse> GetStadiumAsync(string userId, CancellationToken cancellationToken = default)
    {
        var stadium = await teamStore.GetStadiumStateAsync(userId, cancellationToken);
        var places = await teamStore.GetBuildPlacesAsync(userId, cancellationToken);
        var activeConstruction = await teamStore.GetUnderConstructionAsync(userId, cancellationToken);

        return new StadiumResponse
        {
            Success = true,
            Stadium = new StadiumData
            {
                Name = stadium.Name,
                GrassQuality = stadium.GrassQuality,
                Capacity = stadium.Capacity,
                EarningsAverage = stadium.EarningsAverage
            },
            // Flat fields for Xamarin
            Name = stadium.Name,
            GrassQuality = stadium.GrassQuality,
            VisitorsLastMatch = stadium.VisitorsLastMatch,
            VisitorsAverage = stadium.VisitorsAverage,
            VisitorsTotal = stadium.VisitorsTotal,
            EarningsLastMatch = (long)Math.Round(stadium.EarningsLastMatch, MidpointRounding.AwayFromZero),
            EarningsAverage = stadium.EarningsAverage,
            EarningsTotal = (long)Math.Round(stadium.EarningsTotal, MidpointRounding.AwayFromZero),
            Buildings = places.Select(place => ToBuilding(place, activeConstruction, stadium.LeagueTier)).ToList(),
            ChangeNameCost = 500,
            RenewGrassCost = 0,
            SpeedupCost = 10,
            MaxBuildingLevel = 20
        };
    }

    public async Task<BuildPlacesResponse> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var places = await teamStore.GetBuildPlacesAsync(userId, cancellationToken);
        return new BuildPlacesResponse
        {
            Success = true,
            Places = places.Select(x => new BuildPlaceData
            {
                Id = x.Id,
                BuildingType = x.BuildingType,
                // The Xamarin client treats the `level` field as a generic
                // "building level" and performs its own office‑level check
                // (`officeLevel >= level + 1`).  If we send the raw seat
                // counts the check always fails and the stadium entries are
                // locked.  Convert to block counts so that the front end sees
                // a sensible small number.
                Level = x.BuildingType switch
                {
                    "StadiumVips" => x.Level / 10,
                    "StadiumSeats" => x.Level / 100,
                    "StadiumStands" => x.Level / 100,
                    _ => x.Level
                },
                CanBuild = x.CanBuild
            }).ToArray()
        };
    }

    public async Task BuildAsync(string userId, Guid placeId, int count = 1, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.BuildPlaceAsync(userId, placeId, count, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Upgrade unavailable or insufficient resources.");
        }
    }

    public Task SpeedupAsync(string userId, Guid buildId, CancellationToken cancellationToken = default)
    {
        return SpeedupAsyncCore(userId, buildId, cancellationToken);
    }

    public Task RenewGrassAsync(string userId, CancellationToken cancellationToken = default)
    {
        return teamStore.RenewGrassAsync(userId, cancellationToken);
    }

    public Task RenameAsync(string userId, string? name, CancellationToken cancellationToken = default)
    {
        return teamStore.RenameStadiumAsync(userId, string.IsNullOrWhiteSpace(name) ? "My Stadium" : name.Trim(), cancellationToken);
    }

    public Task<UnderConstructionResponse> GetUnderConstructionAsync(string userId, CancellationToken cancellationToken = default)
        => GetUnderConstructionCoreAsync(userId, cancellationToken);

    private async Task SpeedupAsyncCore(string userId, Guid buildId, CancellationToken cancellationToken)
    {
        var success = await teamStore.SpeedupConstructionAsync(userId, buildId, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Construction not found.");
        }
    }

    private async Task<UnderConstructionResponse> GetUnderConstructionCoreAsync(string userId, CancellationToken cancellationToken)
    {
        var activeConstruction = await teamStore.GetUnderConstructionAsync(userId, cancellationToken);
        return new UnderConstructionResponse
        {
            Success = true,
            Building = activeConstruction is null ? null : new BuildingData
            {
                Id = Guid.Empty,
                Name = GetDisplayName(activeConstruction.BuildingType),
                Description = null,
                EffectName = null,
                CurrentValue = 0,
                NewValue = 0,
                MaxValue = 0,
                BuildStart = null,
                BuildEnd = activeConstruction.BuildEndUtc.ToString("O"),
                UpgradeCost = 0,
                UpgradeCostPremium = 0,
                DailyCost = 0,
                DailyCostIncrease = 0,
                Profit = 0,
                ProfitIncrease = 0,
                Duration = 0,
                Capacity = 0,
                Utilization = 0,
                Earnings = 0,
                HasWarning = false
            }
        };
    }

    private static BuildingData ToBuilding(BuildPlaceRecord place, ConstructionRecord? activeConstruction, int leagueTier)
    {
        var construction = activeConstruction?.PlaceId == place.Id ? activeConstruction : null;
        var rawCurrent = construction?.CurrentValue ?? place.Level;
        var rawNew = construction?.NewValue ?? GetNextValue(place);

        var isStadium = place.BuildingType == "StadiumVips" 
                        || place.BuildingType == "StadiumSeats"
                        || place.BuildingType == "StadiumStands";
        var blockSize = place.BuildingType == "StadiumVips" ? 10 : 100;

        // The Xamarin client expects raw seat counts (2300, 2500, 200) that are
        // divisible by the block size.  Returning block-counts (23, 25, 20)
        // caused an immediate crash because 23 % 100 != 0.
        var currentValue = rawCurrent;
        var newValue = rawNew;

        return new BuildingData
        {
            Id = place.Id,
            Name = GetDisplayName(place.BuildingType),
            Description = GetDescription(place.BuildingType),
            EffectName = GetEffectName(place.BuildingType),
            CurrentValue = currentValue,
            MaxValue = GetMaxValue(place.BuildingType, leagueTier),
            NewValue = newValue,
            BuildStart = construction?.BuildStartUtc.ToString("O"),
            BuildEnd = construction?.BuildEndUtc.ToString("O"),
            Earnings = GetEarnings(place.BuildingType, rawCurrent, leagueTier),
            UpgradeCost = construction?.UpgradeCost ?? GetUpgradeCost(place),
            UpgradeCostPremium = construction?.UpgradeCostPremium ?? Math.Round(GetUpgradeCost(place) / 50m, 2),
            Duration = GetDurationMinutes(place.BuildingType, isStadium ? rawCurrent / blockSize : rawCurrent),
            DailyCost = GetDailyCost(place.BuildingType, rawCurrent, leagueTier),
            DailyCostIncrease = GetDailyCostIncrease(place.BuildingType),
            Profit = GetProfit(place.BuildingType, rawCurrent, leagueTier),
            ProfitSign = GetProfitSign(place.BuildingType),
            ProfitIncrease = GetProfitIncrease(place.BuildingType),
            Capacity = isStadium ? blockSize : GetCapacity(place.BuildingType, newValue),
            Utilization = GetUtilization(place.BuildingType),
            HasWarning = false
        };
    }

    private static int GetNextValue(BuildPlaceRecord place)
    {
        return place.BuildingType switch
        {
            "StadiumVips" => place.Level + 10,
            "StadiumSeats" => place.Level + 100,
            "StadiumStands" => place.Level + 100,
            _ => Math.Min(place.Level + 1, 20)
        };
    }

    private static decimal GetUpgradeCost(BuildPlaceRecord place)
    {
        // Legacy client payload expects reduced seat-cost display units.
        return place.BuildingType switch
        {
            "Office" => 4000m + (place.Level * place.Level * 1250m),
            "Parking" => 1250m + (place.Level * 650m),
            "StadiumStands" => 100m,
            "StadiumSeats" => 400m,
            "StadiumVips" => 5000m,
            _ => 12000m + (place.Level * place.Level * 2400m)
        };
    }

    private static decimal GetDurationMinutes(string buildingType, int currentLevel)
    {
        // Seat durations are fixed per block (from information.md)
        if (buildingType is "StadiumVips") return 5m;
        if (buildingType is "StadiumSeats") return 1m;
        if (buildingType is "StadiumStands") return 1m;

        // Facility durations depend on level: linear was previously used, but the backend now uses exponential scaling.
        const decimal minMinutes = 30m;
        const decimal maxMinutes = 50m * 60m;
        const int maxLevel = 19;

        var level = Math.Clamp(currentLevel, 0, maxLevel);
        var factor = Math.Pow((double)(maxMinutes / minMinutes), 1.0 / maxLevel);
        var minutes = minMinutes * (decimal)Math.Pow(factor, level);
        return Math.Round(minutes, 0);
    }

    private static int GetMaxValue(string buildingType, int leagueTier)
    {
        var (maxVipSeats, maxSitSeats) = GetSeatCaps(leagueTier);
        return buildingType switch
        {
            "StadiumVips" => maxVipSeats,
            "StadiumSeats" => maxSitSeats,
            "StadiumStands" => 76000,
            "Parking" => 10,
            _ => 20
        };
    }

    private static long GetEarnings(string buildingType, int currentValue, int leagueTier)
    {
        var (vipProfit, sitProfit, standProfit) = GetSeatProfitRates(leagueTier);
        var (_, maxSitSeats) = GetSeatCaps(leagueTier);

        // Legacy seat payload uses per-seat profit multiplied by the league sit cap.
        return buildingType switch
        {
            "FanShop" => currentValue * 750L,
            "Parking" => currentValue * 475L,
            "StadiumStands" => (long)standProfit * maxSitSeats,
            "StadiumSeats" => (long)sitProfit * maxSitSeats,
            "StadiumVips" => (long)vipProfit * maxSitSeats,
            _ => 0L
        };
    }

    private static decimal GetDailyCost(string buildingType, int currentValue, int leagueTier)
    {
        // Daily running costs — seat rates match TeamDbStore.ApplyProgressionTicksAsync
        // (stand: 2/seat, sit: 5/seat, VIP: 150/seat per day).
        var (vipProfit, sitProfit, standProfit) = GetSeatProfitRates(leagueTier);
        return buildingType switch
        {
            "Parking" => 82.5m + (currentValue * 82.5m),
            "YouthAcademy" => 500m + (currentValue * 200m),
            "TrainingCenter" => 550m + (currentValue * 220m),
            "MedicalCenter" => 450m + (currentValue * 180m),
            "FanShop" => 320m + (currentValue * 140m),
            "StadiumStands" => Math.Round((standProfit / 13m) * 1.08m, 2),
            "StadiumSeats" => Math.Round((sitProfit / 27m) * 2.16m, 2),
            "StadiumVips" => Math.Round((vipProfit / 343m) * 27m, 2),
            "Office" => 50m + (currentValue * 50m),
            _ => currentValue * 50m
        };
    }

    private static decimal GetDailyCostIncrease(string buildingType)
    {
        return buildingType switch
        {
            "YouthAcademy" => 650m,
            "TrainingCenter" => 600m,
            "MedicalCenter" => 450m,
            "FanShop" => 240m,
            _ => 0m
        };
    }

    private static decimal GetProfit(string buildingType, int currentValue, int leagueTier)
    {
        var (vipProfit, sitProfit, standProfit) = GetSeatProfitRates(leagueTier);
        return buildingType switch
        {
            "Parking" => 475m + (currentValue * 475m),
            "YouthAcademy" => currentValue,
            "TrainingCenter" => currentValue,
            "MedicalCenter" => currentValue,
            "FanShop" => 150m + (currentValue * 75m),
            "StadiumStands" => standProfit,
            "StadiumSeats" => sitProfit,
            "StadiumVips" => vipProfit,
            _ => currentValue
        };
    }

    private static string? GetProfitSign(string buildingType)
    {
        return buildingType switch
        {
            "Parking" or "FanShop" or "StadiumStands" or "StadiumSeats" or "StadiumVips" => "\u20ac",
            _ => string.Empty
        };
    }

    private static decimal GetProfitIncrease(string buildingType)
    {
        return buildingType switch
        {
            "YouthAcademy" or "TrainingCenter" or "MedicalCenter" => 1m,
            _ => 0m
        };
    }

    private static (int MaxVipSeats, int MaxSitSeats) GetSeatCaps(int leagueTier)
    {
        return leagueTier switch
        {
            1 => (2800, 35000),
            2 => (2300, 28500),
            3 => (1900, 24000),
            _ => (1700, 20000)
        };
    }

    private static (int Vip, int Sit, int Stand) GetSeatProfitRates(int leagueTier)
    {
        return leagueTier switch
        {
            1 => (436, 34, 17),
            2 => (343, 27, 13),
            3 => (269, 21, 10),
            _ => (212, 16, 8)
        };
    }

    private static int GetCapacity(string buildingType, int newValue)
    {
        return buildingType switch
        {
            "StadiumVips" or "StadiumSeats" or "StadiumStands" => Math.Max(1, newValue),
            _ => 1
        };
    }

    private static int GetUtilization(string buildingType)
    {
        return buildingType switch
        {
            "Parking" => 0,
            _ => 100
        };
    }

    private static string GetDisplayName(string buildingType)
    {
        return buildingType switch
        {
            "Office" => "Geschäftsstelle",
            "TrainingCenter" => "Trainingsgelände",
            "MedicalCenter" => "Fitnessstudio",
            "YouthAcademy" => "Jugendzentrum",
            "FanShop" => "Fanshop",
            "Parking" => "Parkplätze",
            "StadiumVips" => "VIP-Sitze",
            "StadiumSeats" => "Sitzplätze",
            "StadiumStands" => "Stehplätze",
            _ => buildingType
        };
    }

    private static string GetDescription(string buildingType)
    {
        return buildingType switch
        {
            "Office" => "Die Geschäftsstelle ist der zentrale Mittelpunkt deiner Managerlaufbahn. Von hier aus steuerst du das Geschehen.",
            "TrainingCenter" => "Sieh dir nur dieses schöne grüne Gras an! Deine Spieler werden besser trainieren.",
            "MedicalCenter" => "Es hilft Spielern, sich zu verbessern und in Form zu bleiben.",
            "YouthAcademy" => "Dein Scout wird talentiertere Spieler finden, die sich dann im Training schneller verbessern.",
            "FanShop" => "Welcher Fan würde nicht ein paar Andenken kaufen wollen?",
            "Parking" => "Parkplätze für die Besucher.",
            "StadiumVips" => "VIP-Sitze in 10er-Blöcken.",
            "StadiumSeats" => "Sitzplätze in 100er-Blöcken.",
            "StadiumStands" => "Stehplätze in 100er-Blöcken.",
            _ => buildingType
        };
    }

    private static string? GetEffectName(string buildingType)
    {
        return buildingType switch
        {
            "Office" => "Max. Gebäudestufe",
            "TrainingCenter" => "Trainingsbonus",
            "MedicalCenter" => "Fitnessbonus",
            "YouthAcademy" => "Scoutingbonus",
            _ => null
        };
    }
}
