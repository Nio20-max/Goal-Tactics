using GoalTactics.Contracts.Ladder;

namespace GoalTactics.Application.Ladder;

public interface ILadderService
{
    Task<LadderResponse> GetLadderAsync(string userId, Guid ladderId, CancellationToken cancellationToken = default);

    Task<LadderChallengeResponse> GetLadderChallengeAsync(string userId, Guid opponentTeamId, CancellationToken cancellationToken = default);

    Task<LadderMatchResponse> RunMatchAsync(string userId, Guid opponentTeamId, CancellationToken cancellationToken = default);

    Task RestoreStaminaAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class LadderService(ILadderStore ladderStore) : ILadderService
{
    public async Task<LadderResponse> GetLadderAsync(string userId, Guid ladderId, CancellationToken cancellationToken = default)
    {
        var ladder = await ladderStore.GetLadderAsync(userId, ladderId, cancellationToken);

        return new LadderResponse
        {
            Success = true,
            LadderId = ladder.LadderId,
            EndDate = ladder.EndDateUtc.ToString("O"),
            Teams = ladder.Teams.Select(MapTeam).ToArray()
        };
    }

    public async Task<LadderChallengeResponse> GetLadderChallengeAsync(string userId, Guid opponentTeamId, CancellationToken cancellationToken = default)
    {
        var challenge = await ladderStore.GetLadderChallengeAsync(userId, opponentTeamId, cancellationToken);

        return new LadderChallengeResponse
        {
            Success = true,
            HomeTeam = MapChallengeTeam(challenge.HomeTeam),
            AwayTeam = MapChallengeTeam(challenge.AwayTeam),
            WinPoints = challenge.WinPoints,
            LosePoints = challenge.LosePoints,
            Stamina = challenge.Stamina,
            StaminaCost = challenge.StaminaCost,
            LadderDate = challenge.LadderDateUtc.ToString("O"),
            MatchCost = challenge.MatchCost
        };
    }

    public async Task<LadderMatchResponse> RunMatchAsync(string userId, Guid opponentTeamId, CancellationToken cancellationToken = default)
    {
        var result = await ladderStore.RunMatchAsync(userId, opponentTeamId, cancellationToken);
        return new LadderMatchResponse
        {
            Success = true,
            MatchReport = new LadderMatchData
            {
                Events = [],
                Home = new MatchTeamData { TeamName = "My Team", Strength = 50 },
                Away = new MatchTeamData { TeamName = "Opponent", Strength = 50 }
            },
            Stamina = result.Stamina.ToString()
        };
    }

    public Task RestoreStaminaAsync(string userId, CancellationToken cancellationToken = default)
    {
        return ladderStore.RestoreStaminaAsync(userId, cancellationToken);
    }

    private static LadderTeamData MapTeam(LadderTeamRecord team)
    {
        return new LadderTeamData
        {
            TeamId = team.TeamId,
            Name = team.TeamName,
            Logo = team.TeamLogo,
            Points = team.Points,
            Strength = team.Strength,
            IsMine = team.IsMine
        };
    }

    private static LadderChallengeTeamData MapChallengeTeam(LadderTeamRecord team)
    {
        return new LadderChallengeTeamData
        {
            TeamId = team.TeamId,
            Name = team.TeamName,
            Logo = team.TeamLogo,
            Points = team.Points,
            Strength = team.Strength,
            IsMine = team.IsMine
        };
    }
}
