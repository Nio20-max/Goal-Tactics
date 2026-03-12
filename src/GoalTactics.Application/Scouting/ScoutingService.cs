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

    private static readonly string[] FirstNames = ["Marco", "Lukas", "Felix", "Jan", "Niklas", "Tim", "Jonas", "Leon", "David", "Moritz",
        "Fabio", "Alex", "Kevin", "Stefan", "Paul", "Erik", "Tobias", "Lars", "Christian", "Max"];
    private static readonly string[] LastNames = ["Weber", "Koch", "Müller", "Fischer", "Bauer", "Krause", "Wolf", "Braun", "Neumann", "Lang",
        "Richter", "Berger", "Schmid", "Hartmann", "Kaiser", "Peters", "Jung", "Scholz", "Roth", "Hahn"];
    private static readonly string[] Origins = ["Deutschland", "Österreich", "Schweiz", "Niederlande", "Frankreich", "England"];
    private static readonly string[] Positions = ["GK", "DEF", "MID", "FWD"];

    public async Task<ScoutingPlayersResponse> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default)
    {
        var scouted = await teamStore.GetScoutedPlayersAsync(userId, cancellationToken);

        return new ScoutingPlayersResponse
        {
            Success = true,
            ScoutingCost = NormalScoutCost,
            PremiumScoutingCost = PremiumScoutCostStars,
            SpeedupCost = SpeedupCostStars,
            Players = scouted.Select(p => new ScoutedPlayerData
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
        // Determine if this is a premium (stars) or normal (money) scout
        bool isPremium = string.Equals(request.ScoutType, "premium", StringComparison.OrdinalIgnoreCase);

        if (!isPremium)
        {
            // Deduct money for normal scouting
            var spent = await teamStore.TrySpendMoneyAsync(userId, NormalScoutCost, "Scouting", cancellationToken);
            if (!spent) return;
        }
        else
        {
            // Deduct GT Stars for premium scouting
            var spent = await teamStore.TrySpendStarsAsync(userId, PremiumScoutCostStars, cancellationToken);
            if (!spent) return;
        }

        // Determine position filter from Xamarin client (-1 = any) or Android client (PositionFilter string)
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

        await teamStore.AddScoutedPlayerAsync(userId, name, origin, position, age, talent, strength, fitness, cancellationToken);
    }

    public async Task RecruitAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        await teamStore.RecruitScoutedPlayerAsync(userId, playerId, cancellationToken);
    }

    public async Task SpeedupAsync(string userId, Guid assignmentId, CancellationToken cancellationToken = default)
    {
        _ = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
    }
}
