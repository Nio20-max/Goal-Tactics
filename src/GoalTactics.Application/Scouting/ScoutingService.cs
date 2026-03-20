using GoalTactics.Application.Common;
using GoalTactics.Application.Team;
using GoalTactics.Contracts.Scouting;
using GoalTactics.Contracts.Squad;
using System.Linq;

namespace GoalTactics.Application.Scouting;

public interface IScoutingService
{
    Task<ScoutingPlayersResponse> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default);

    Task InstructScoutAsync(string userId, ScoutInstructionRequest request, CancellationToken cancellationToken = default);

    Task<Guid> GetNextPendingScoutIdAsync(string userId, bool premiumOnly, CancellationToken cancellationToken = default);

    Task RecruitAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task SpeedupAsync(string userId, Guid assignmentId, CancellationToken cancellationToken = default);
}

public sealed class ScoutingService(ITeamStore teamStore) : IScoutingService
{
    private const int NormalScoutCost = 10_000;
    private const int PremiumScoutCostStars = 1_000;
    private const int LegacyPremiumScoutCostStars = 300; // preserved for legacy request-line detection
    private const int SpeedupCostStars = 300;
    private const int MaxSimultaneousScouts = 3;
    private static readonly TimeSpan NormalScoutDuration = TimeSpan.FromHours(12);
    private static readonly TimeSpan PremiumScoutDuration = TimeSpan.FromHours(3);

    private static readonly string[] FirstNames = ["Marco", "Lukas", "Felix", "Jan", "Niklas", "Tim", "Jonas", "Leon", "David", "Moritz",
        "Fabio", "Alex", "Kevin", "Stefan", "Paul", "Erik", "Tobias", "Lars", "Christian", "Max"];
    private static readonly string[] LastNames = ["Weber", "Koch", "Müller", "Fischer", "Bauer", "Krause", "Wolf", "Braun", "Neumann", "Lang",
        "Richter", "Berger", "Schmid", "Hartmann", "Kaiser", "Peters", "Jung", "Scholz", "Roth", "Hahn"];
    private static readonly string[] Origins = ["Deutschland", "Österreich", "Schweiz", "Niederlande", "Frankreich", "England"];
    // The API and legacy clients both use the scouting order:
    //   0 = GK, 1 = DEF, 2 = MID, 3 = FWD
    private static readonly string[] Positions = ["GK", "DEF", "MID", "FWD"];

    public async Task<ScoutingPlayersResponse> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default)
    {
        // Get all scouted players (including pending) to compute NextScoutingDate
        var allScouted = await teamStore.GetAllScoutedPlayersAsync(userId, cancellationToken);
        var now = DateTime.UtcNow;

        // Ready players (visible to user)
        // Scouted players appear immediately; the "ready" time is now used only to throttle
        // how many scouts can be active at once (cooldown until next scout can be started).
        var readyPlayers = allScouted.ToList();

        // Pending scouts (cooling down)
        var pendingPlayers = allScouted.Where(p => p.ScoutingReadyAtUtc.HasValue && p.ScoutingReadyAtUtc > now).ToList();
        var pendingPremium = pendingPlayers.Where(p => p.IsPremiumScouting).ToList();
        var pendingNormal = pendingPlayers.Where(p => !p.IsPremiumScouting).ToList();

        // Compute the earliest pending scout completion for each type
        string? nextScoutingDate = null;
        if (pendingNormal.Count > 0)
        {
            var earliest = pendingNormal.Min(p => p.ScoutingReadyAtUtc!.Value);
            nextScoutingDate = earliest.ToString("o");
        }

        string? nextPremiumScoutingDate = null;
        if (pendingPremium.Count > 0)
        {
            var earliest = pendingPremium.Min(p => p.ScoutingReadyAtUtc!.Value);
            nextPremiumScoutingDate = earliest.ToString("o");
        }

        return new ScoutingPlayersResponse
        {
            Success = true,
            ScoutingCost = NormalScoutCost,
            PremiumScoutingCost = PremiumScoutCostStars,
            SpeedupCost = SpeedupCostStars,
            NextScoutingDate = nextScoutingDate,
            NextPremiumScoutingDate = nextPremiumScoutingDate,
            PendingScoutCount = pendingPlayers.Count,
            MaxSimultaneousScouts = MaxSimultaneousScouts,
            Players = readyPlayers.Select(MapScoutedPlayer).ToList()
        };
    }

    private static SquadPlayerData MapScoutedPlayer(SquadPlayerRecord p)
    {
        // Use the same conversion logic as SquadService to match the app model.
        return new SquadPlayerData
        {
            Id = p.Id,
            Name = p.Name,
            Country = LegacyAppCompatibility.NormalizeCountryCode(p.Origin),
            Head = p.Head,
            Strength = p.Strength,
            Talent = p.Talent,
            Age = p.Age,
            Position = LegacyAppCompatibility.MapPositionCode(p.Position),
            EndDate = p.ContractEndUtc?.ToString("O"),
            Experience = p.Experience,
            Fitness = (int)p.Fitness,
            Body = p.Body,
            Gloves = p.Gloves,
            Shoes = p.Shoes,
            Salary = Math.Max(1_000m, p.Strength * p.Strength / 4m),
            MarketValue = p.MarketValue,
            Origin = p.Origin,
            Skills = p.Skills,
            MainSkill = LegacyAppCompatibility.MainSkillIndex(p.Position),
            BonusSkills = LegacyAppCompatibility.BuildRandomBonusSkills(p.Id),
            YellowCards = p.YellowCards,
            HasRedCard = p.RedCards > 0,
            Injured = 0,
            IsForSale = false,
            SellPrice = p.MarketValue,
            TransfermarketFee = Math.Max(1_000m, p.Strength * 14m),
            TransfermarketMaxOffer = Math.Max(10_000m, p.MarketValue * 1.1m),
            TransfermarketMinOffer = Math.Max(1_000m, p.Strength * 14m),
            TransfermarketMaxHours = 48,
            IsUpgraded = false,
            MaxUpgradeStrength = (int)(p.Strength + 25m),
            Shirt = p.ShirtNumber <= 0 ? -1 : p.ShirtNumber,
            CanExtendContract = true,
            HasIndividualTraining = !string.IsNullOrWhiteSpace(p.IndividualTrainingSkill)
        };
    }

    public async Task InstructScoutAsync(string userId, ScoutInstructionRequest request, CancellationToken cancellationToken = default)
    {
        // Check simultaneous scout cap
        var pendingCount = await teamStore.GetPendingScoutCountAsync(userId, cancellationToken);
        if (pendingCount >= MaxSimultaneousScouts)
        {
            throw new InvalidOperationException($"Maximum of {MaxSimultaneousScouts} simultaneous scouts reached. Wait for one to complete or speed it up.");
        }

        // Determine if this is a premium (stars) or normal (money) scout.
        // Legacy clients sometimes send the premium flag via scoutType, some via type, or via price.
        bool isPremium = string.Equals(request.ScoutType, "premium", StringComparison.OrdinalIgnoreCase)
            || string.Equals(request.Type, "premium", StringComparison.OrdinalIgnoreCase)
            || request.Price == PremiumScoutCostStars;

        if (!isPremium)
        {
            var spent = await teamStore.TrySpendMoneyAsync(userId, NormalScoutCost, "Scouting", cancellationToken);
            if (!spent) return;
        }
        else
        {
            var spent = await teamStore.TrySpendStarsAsync(userId, PremiumScoutCostStars, cancellationToken);
            if (!spent) return;
        }

        // Determine position filter.
        // Legacy clients sometimes send 0-3, sometimes 1-4 (GK=1, DEF=2, MID=3, FWD=4).
        // If the client doesn't send a position, we want the server to randomly pick one.
        string? posFilter = null;
        if (request.Position.HasValue)
        {
            var posValue = request.Position.Value;

            // Keep a strict API format: only accept 0..3
            // 0=GK, 1=DEF, 2=MID, 3=FWD
            if (posValue >= 0 && posValue < Positions.Length)
            {
                posFilter = Positions[posValue];
            }
        }

        if (string.IsNullOrWhiteSpace(posFilter) && !string.IsNullOrWhiteSpace(request.PositionFilter))
        {
            var filter = request.PositionFilter.Trim();
            if (int.TryParse(filter, out var filterInt) && filterInt >= 0 && filterInt < Positions.Length)
            {
                posFilter = Positions[filterInt];
            }
            else if (string.Equals(filter, "GK", StringComparison.OrdinalIgnoreCase)
                  || string.Equals(filter, "DEF", StringComparison.OrdinalIgnoreCase)
                  || string.Equals(filter, "MID", StringComparison.OrdinalIgnoreCase)
                  || string.Equals(filter, "FWD", StringComparison.OrdinalIgnoreCase))
            {
                posFilter = filter.ToUpperInvariant();
            }
        }

        // Premium scouts should always use GK if no position was explicitly set.
        if (isPremium && string.IsNullOrWhiteSpace(posFilter))
        {
            posFilter = "GK";
        }

        // Generate a random scouted player
        var rng = new Random();
        var position = posFilter ?? Positions[rng.Next(Positions.Length)];
        var firstName = FirstNames[rng.Next(FirstNames.Length)];
        var lastName = LastNames[rng.Next(LastNames.Length)];
        var name = $"{firstName} {lastName}";
        var origin = Origins[rng.Next(Origins.Length)];
        var age = isPremium ? rng.Next(16, 18) : rng.Next(16, 19); // premium: 16-17, normal: 16-18
        var talent = isPremium ? rng.Next(6, 11) : rng.Next(3, 9);
        var baseStr = position switch
        {
            "GK" => 68m,
            "DEF" => 62m,
            "MID" => 63m,
            "FWD" => 64m,
            _ => 60m
        };
        var strength = Math.Clamp(baseStr + rng.Next(-5, 15) + (talent >= 8 ? rng.Next(2, 8) : 0), 50m, 90m);
        var fitness = isPremium ? rng.Next(0, 51) : rng.Next(0, 101);

        // Set scouting ready time based on scout type
        var duration = isPremium ? PremiumScoutDuration : NormalScoutDuration;
        var readyAtUtc = DateTime.UtcNow.Add(duration);

        await teamStore.AddScoutedPlayerAsync(userId, name, origin, position, age, talent, strength, fitness, isPremium, readyAtUtc, cancellationToken);
    }

    public async Task RecruitAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        await teamStore.RecruitScoutedPlayerAsync(userId, playerId, cancellationToken);
    }

    public async Task<Guid> GetNextPendingScoutIdAsync(string userId, bool premiumOnly, CancellationToken cancellationToken = default)
    {
        var allScouted = await teamStore.GetAllScoutedPlayersAsync(userId, cancellationToken);
        var now = DateTime.UtcNow;
        var pending = allScouted
            .Where(p => p.ScoutingReadyAtUtc.HasValue && p.ScoutingReadyAtUtc > now);

        if (premiumOnly)
        {
            pending = pending.Where(p => p.IsPremiumScouting);
        }

        var next = pending.OrderBy(p => p.ScoutingReadyAtUtc).FirstOrDefault();
        return next?.Id ?? Guid.Empty;
    }

    public async Task SpeedupAsync(string userId, Guid assignmentId, CancellationToken cancellationToken = default)
    {
        // Deduct GT Stars for speed-up
        var spent = await teamStore.TrySpendStarsAsync(userId, SpeedupCostStars, cancellationToken);
        if (!spent) return;

        var sped = await teamStore.SpeedupScoutAsync(userId, assignmentId, cancellationToken);
        if (!sped)
        {
            // Refund if the scout was not found or already ready
            // In a real system, this would use a transaction. For now, we accept the edge case.
        }
    }
}
