using GoalTactics.Contracts.Stadium;
using GoalTactics.Application.Team;

namespace GoalTactics.Application.Stadium;

public interface IStadiumService
{
    Task<StadiumResponse> GetStadiumAsync(string userId, CancellationToken cancellationToken = default);

    Task<BuildPlacesResponse> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default);

    Task BuildAsync(string userId, Guid placeId, CancellationToken cancellationToken = default);

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
            VisitorsLastMatch = stadium.VisitorsLastMatch,
            VisitorsAverage = stadium.VisitorsAverage,
            VisitorsTotal = stadium.VisitorsTotal,
            EarningsLastMatch = (long)Math.Round(stadium.EarningsLastMatch, MidpointRounding.AwayFromZero),
            EarningsTotal = (long)Math.Round(stadium.EarningsTotal, MidpointRounding.AwayFromZero),
            Buildings = places.Select(place => ToBuilding(place, activeConstruction)).ToList(),
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

    public async Task BuildAsync(string userId, Guid placeId, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.BuildPlaceAsync(userId, placeId, cancellationToken);
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

    private static BuildingData ToBuilding(BuildPlaceRecord place, ConstructionRecord? activeConstruction)
    {
        var construction = activeConstruction?.PlaceId == place.Id ? activeConstruction : null;
        var rawCurrent = construction?.CurrentValue ?? place.Level;
        var rawNew = construction?.NewValue ?? GetNextValue(place);

        // stadium entries are stored as absolute seat counts in the database but
        // the old mobile client treats "level" as the number of completed
        // blocks (10 VIP seats, 100 sit/stand seats).  Convert the raw counts
        // to block counts for any field that is conceptually a level.
        var isStadium = place.BuildingType == "StadiumVips" 
                        || place.BuildingType == "StadiumSeats"
                        || place.BuildingType == "StadiumStands";
        var blockSize = place.BuildingType == "StadiumVips" ? 10 : 100;

        var currentValue = isStadium ? rawCurrent / blockSize : rawCurrent;
        var newValue = isStadium ? rawNew / blockSize : rawNew;

        return new BuildingData
        {
            Id = place.Id,
            Name = GetDisplayName(place.BuildingType),
            Description = GetDescription(place.BuildingType),
            EffectName = GetEffectName(place.BuildingType),
            CurrentValue = currentValue,
            MaxValue = GetMaxValue(place.BuildingType),
            NewValue = newValue,
            BuildStart = construction?.BuildStartUtc.ToString("O"),
            BuildEnd = construction?.BuildEndUtc.ToString("O"),
            Earnings = GetEarnings(place.BuildingType, rawCurrent),
            UpgradeCost = construction?.UpgradeCost ?? GetUpgradeCost(place),
            UpgradeCostPremium = construction?.UpgradeCostPremium ?? Math.Round(GetUpgradeCost(place) / 50m, 2),
            Duration = GetDurationMinutes(place.BuildingType, currentValue),
            DailyCost = GetDailyCost(place.BuildingType, rawCurrent),
            DailyCostIncrease = GetDailyCostIncrease(place.BuildingType),
            Profit = GetProfit(place.BuildingType, rawCurrent),
            ProfitSign = GetProfitSign(place.BuildingType),
            ProfitIncrease = GetProfitIncrease(place.BuildingType),
            Capacity = isStadium ? rawNew : GetCapacity(place.BuildingType, newValue),
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
        // The cost calculation mirrors the server-side logic used when the
        // build request actually runs (see TeamDbStore.BuildPlaceAsync).  In
        // particular we must divide the stadium seat counts by the block size
        // before applying the quadratic growth formula.  The previous
        // implementation blindly divided every stadium type by 10 which meant
        // sitting/standing seats were charged as if they were ten times as
        // expensive, leading to ridiculous prices and a client that assumed
        // the team could not afford the upgrade.
        var currentLevel = place.BuildingType switch
        {
            "StadiumVips" => place.Level / 10,
            "StadiumSeats" => place.Level / 100,
            "StadiumStands" => place.Level / 100,
            _ => place.Level
        };

        return place.BuildingType switch
        {
            "Office" => 4000m + (place.Level * place.Level * 1250m),
            "Parking" => 1250m + (place.Level * 650m),
            "StadiumVips" or "StadiumSeats" or "StadiumStands" =>
                8500m + (Math.Max(1, currentLevel) * Math.Max(1, currentLevel) * 2200m),
            _ => 12000m + (place.Level * place.Level * 2400m)
        };
    }

    private static decimal GetDurationMinutes(string buildingType, int currentLevel)
    {
        // Seat durations are fixed per block (from information.md)
        if (buildingType is "StadiumVips") return 50m;
        if (buildingType is "StadiumSeats") return 140m;
        if (buildingType is "StadiumStands") return 100m;

        // Facility durations depend on level: Level 0→1: 30min, Level 19→20: 50hrs (3000min), linear
        const decimal minMinutes = 30m;
        const decimal maxMinutes = 50m * 60m;
        return Math.Round(minMinutes + (Math.Clamp(currentLevel, 0, 19) * ((maxMinutes - minMinutes) / 19m)), 0);
    }

    private static int GetMaxValue(string buildingType)
    {
        return buildingType switch
        {
            "StadiumVips" => 2800,
            "StadiumSeats" => 35000,
            "StadiumStands" => int.MaxValue,
            "Parking" => 10,
            _ => 20
        };
    }

    private static long GetEarnings(string buildingType, int currentValue)
    {
        return buildingType switch
        {
            "FanShop" => currentValue * 750L,
            "Parking" => currentValue * 475L,
            "StadiumVips" => currentValue * 34L,
            "StadiumSeats" => currentValue * 3L,
            "StadiumStands" => currentValue,
            _ => 0L
        };
    }

    private static decimal GetDailyCost(string buildingType, int currentValue)
    {
        return buildingType switch
        {
            "Parking" => 82.5m + (currentValue * 82.5m),
            "YouthAcademy" => 500m + (currentValue * 200m),
            "TrainingCenter" => 550m + (currentValue * 220m),
            "MedicalCenter" => 450m + (currentValue * 180m),
            "FanShop" => 320m + (currentValue * 140m),
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

    private static decimal GetProfit(string buildingType, int currentValue)
    {
        return buildingType switch
        {
            "Parking" => 475m + (currentValue * 475m),
            "YouthAcademy" => currentValue,
            "TrainingCenter" => currentValue,
            "MedicalCenter" => currentValue,
            "FanShop" => 150m + (currentValue * 75m),
            _ => currentValue
        };
    }

    private static string? GetProfitSign(string buildingType)
    {
        return buildingType switch
        {
            "Parking" or "FanShop" => "\u20ac",
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
