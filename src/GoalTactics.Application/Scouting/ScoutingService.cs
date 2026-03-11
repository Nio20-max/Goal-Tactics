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
    private static readonly string[] FirstNames = ["Marco", "Lukas", "Felix", "Jan", "Niklas", "Tim", "Jonas", "Leon", "David", "Moritz",
        "Fabio", "Alex", "Kevin", "Stefan", "Paul", "Erik", "Tobias", "Lars", "Christian", "Max"];
    private static readonly string[] LastNames = ["Weber", "Koch", "Müller", "Fischer", "Bauer", "Krause", "Wolf", "Braun", "Neumann", "Lang",
        "Richter", "Berger", "Schmid", "Hartmann", "Kaiser", "Peters", "Jung", "Scholz", "Roth", "Hahn"];
    private static readonly string[] Origins = ["hometown", "nearby_city", "foreign", "academy", "other_club", "lower_league"];
    private static readonly string[] Positions = ["GK", "DEF", "MID", "FWD"];
    private static readonly int[] PositionCodes = [0, 1, 2, 3];

    public async Task<ScoutingPlayersResponse> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        _ = team; // ensure team exists

        // Return empty for now - players appear after InstructScout
        return new ScoutingPlayersResponse
        {
            Success = true,
            ScoutingCost = 500_000,
            PremiumScoutingCost = 5,
            SpeedupCost = 3,
            Players = []
        };
    }

    public async Task InstructScoutAsync(string userId, ScoutInstructionRequest request, CancellationToken cancellationToken = default)
    {
        _ = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
    }

    public async Task RecruitAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        _ = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
    }

    public async Task SpeedupAsync(string userId, Guid assignmentId, CancellationToken cancellationToken = default)
    {
        _ = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
    }
}
