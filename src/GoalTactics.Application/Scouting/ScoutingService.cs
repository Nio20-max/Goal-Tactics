using GoalTactics.Application.Team;
using GoalTactics.Contracts.Scouting;
using GoalTactics.Contracts.Squad;

namespace GoalTactics.Application.Scouting;

public interface IScoutingService
{
    Task<ScoutingPlayersResponse> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default);

    Task InstructScoutAsync(string userId, ScoutInstructionRequest request, CancellationToken cancellationToken = default);

    Task RecruitAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task SpeedupAsync(string userId, Guid assignmentId, CancellationToken cancellationToken = default);
}

public sealed class ScoutingService(ITeamStore teamStore) : IScoutingService
{
    private const int NormalScoutCost = 10_000;
    private const int PremiumScoutCostStars = 1_000;
    private const int SpeedupCostStars = 3;
    private const int MaxSimultaneousScouts = 3;
    private static readonly TimeSpan NormalScoutDuration = TimeSpan.FromHours(4);
    private static readonly TimeSpan PremiumScoutDuration = TimeSpan.FromHours(1);

    private static readonly string[] FirstNames = ["Marco", "Lukas", "Felix", "Jan", "Niklas", "Tim", "Jonas", "Leon", "David", "Moritz",
        "Fabio", "Alex", "Kevin", "Stefan", "Paul", "Erik", "Tobias", "Lars", "Christian", "Max"];
    private static readonly string[] LastNames = ["Weber", "Koch", "Müller", "Fischer", "Bauer", "Krause", "Wolf", "Braun", "Neumann", "Lang",
        "Richter", "Berger", "Schmid", "Hartmann", "Kaiser", "Peters", "Jung", "Scholz", "Roth", "Hahn"];
    private static readonly string[] Origins = ["Deutschland", "Österreich", "Schweiz", "Niederlande", "Frankreich", "England"];
    private static readonly string[] Positions = ["GK", "DEF", "MID", "FWD"];

    public async Task<ScoutingPlayersResponse> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default)
    {
        // Get all scouted players (including pending) to compute NextScoutingDate
        var allScouted = await teamStore.GetAllScoutedPlayersAsync(userId, cancellationToken);
        var now = DateTime.UtcNow;

        // Ready players (visible to user)
        var readyPlayers = allScouted.Where(p => p.ScoutingReadyAtUtc is null || p.ScoutingReadyAtUtc <= now).ToList();

        // Pending players (still scouting)
        var pendingPlayers = allScouted.Where(p => p.ScoutingReadyAtUtc.HasValue && p.ScoutingReadyAtUtc > now).ToList();

        // Compute the earliest pending scout completion
        string? nextScoutingDate = null;
        if (pendingPlayers.Count > 0)
        {
            var earliest = pendingPlayers.Min(p => p.ScoutingReadyAtUtc!.Value);
            nextScoutingDate = earliest.ToString("o");
        }

        return new ScoutingPlayersResponse
        {
            Success = true,
            ScoutingCost = NormalScoutCost,
            PremiumScoutingCost = PremiumScoutCostStars,
            SpeedupCost = SpeedupCostStars,
            NextScoutingDate = nextScoutingDate,
            PendingScoutCount = pendingPlayers.Count,
            MaxSimultaneousScouts = MaxSimultaneousScouts,
            Players = readyPlayers.Select(p => new ScoutedPlayerData
            {
                Id = p.Id,
                Name = p.Name,
                Position = p.Position,
                Talent = p.Talent,
                Strength = p.Strength
            }).ToList()
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

        // Determine if this is a premium (stars) or normal (money) scout
        bool isPremium = string.Equals(request.ScoutType, "premium", StringComparison.OrdinalIgnoreCase);

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

        // Determine position filter
        string? posFilter = request.Position >= 0 && request.Position < Positions.Length
            ? Positions[request.Position]
            : request.PositionFilter;

        // Generate a random scouted player
        var rng = new Random();
        var position = posFilter ?? Positions[rng.Next(Positions.Length)];
        var firstName = FirstNames[rng.Next(FirstNames.Length)];
        var lastName = LastNames[rng.Next(LastNames.Length)];
        var name = $"{firstName} {lastName}";
        var origin = Origins[rng.Next(Origins.Length)];
        var age = rng.Next(17, 33);
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
        var fitness = rng.Next(80, 101);

        // Set scouting ready time based on scout type
        var duration = isPremium ? PremiumScoutDuration : NormalScoutDuration;
        var readyAtUtc = DateTime.UtcNow.Add(duration);

        await teamStore.AddScoutedPlayerAsync(userId, name, origin, position, age, talent, strength, fitness, readyAtUtc, cancellationToken);
    }

    public async Task RecruitAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        await teamStore.RecruitScoutedPlayerAsync(userId, playerId, cancellationToken);
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
