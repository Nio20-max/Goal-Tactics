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

        // Get the challenge data to populate real team info for the response
        LadderChallengeRecord? challenge = null;
        try
        {
            challenge = await ladderStore.GetLadderChallengeAsync(userId, opponentTeamId, cancellationToken);
        }
        catch
        {
            // If challenge lookup fails, fall back to minimal data
        }

        var homeTeamName = challenge?.HomeTeam.TeamName ?? "My Team";
        var awayTeamName = challenge?.AwayTeam.TeamName ?? "Opponent";
        var homeStrength = challenge?.HomeTeam.Strength ?? 50;
        var awayStrength = challenge?.AwayTeam.Strength ?? 50;

        return new LadderMatchResponse
        {
            Success = true,
            Message = result.MatchReport,
            MatchReport = new LadderMatchData
            {
                Events = [],
                Home = new MatchTeamData { TeamName = homeTeamName, Strength = homeStrength },
                Away = new MatchTeamData { TeamName = awayTeamName, Strength = awayStrength }
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
            TeamName = team.TeamName,
            TeamLogo = team.TeamLogo,
            Points = team.Points,
            Strength = team.Strength,
            IsMine = team.IsMine,
            Rank = team.Rank,
            // Xamarin fields
            Name = team.TeamName,
            Logo = team.TeamLogo,
            Country = "de",
            Played = team.Played,
            GoalsScored = team.GoalsScored,
            GoalsReceived = team.GoalsReceived
        };
    }

    private static LadderChallengeTeamData MapChallengeTeam(LadderTeamRecord team)
    {
        return new LadderChallengeTeamData
        {
            TeamId = team.TeamId,
            TeamName = team.TeamName,
            TeamLogo = team.TeamLogo,
            Points = team.Points,
            Strength = team.Strength,
            IsMine = team.IsMine,
            Rank = team.Rank,
            Name = team.TeamName,
            Logo = team.TeamLogo,
            Country = "de",
            Played = team.Played,
            GoalsScored = team.GoalsScored,
            GoalsReceived = team.GoalsReceived
        };
    }
}
