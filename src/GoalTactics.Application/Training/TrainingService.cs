using GoalTactics.Contracts.Training;
using GoalTactics.Application.Team;

namespace GoalTactics.Application.Training;

public interface ITrainingService
{
    Task<TeamTrainingResponse> GetTeamTrainingAsync(string userId, CancellationToken cancellationToken = default);

    Task SaveTeamTrainingAsync(string userId, TeamTrainingSaveRequest request, CancellationToken cancellationToken = default);

    Task SaveTacticTrainingAsync(string userId, TacticTrainingSaveRequest request, CancellationToken cancellationToken = default);

    Task BookCampAsync(string userId, TrainingCampRequest request, CancellationToken cancellationToken = default);

    Task SaveIndividualTrainingAsync(string userId, IndividualTrainingRequest request, CancellationToken cancellationToken = default);

    Task RenewIndividualTrainingAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task RenewAllIndividualTrainingAsync(string userId, CancellationToken cancellationToken = default);
}

public sealed class TrainingService(ITeamStore teamStore) : ITrainingService
{
    public async Task<TeamTrainingResponse> GetTeamTrainingAsync(string userId, CancellationToken cancellationToken = default)
    {
        var state = await teamStore.GetTrainingStateAsync(userId, cancellationToken);
        return new TeamTrainingResponse
        {
            Success = true,
            TeamTraining = new TeamTrainingData
            {
                MainSkillIndex = state.MainSkillIndex,
                SubSkillIndex = state.SubSkillIndex,
                EfficiencyText = state.EfficiencyText,
                EfficiencyValue = state.EfficiencyValue
            }
        };
    }

    public Task SaveTeamTrainingAsync(string userId, TeamTrainingSaveRequest request, CancellationToken cancellationToken = default)
    {
        return teamStore.SaveTeamTrainingAsync(userId, request.MainSkillIndex, request.SubSkillIndex, cancellationToken);
    }

    public Task SaveTacticTrainingAsync(string userId, TacticTrainingSaveRequest request, CancellationToken cancellationToken = default)
    {
        // Tactic training is not persisted separately yet.
        return Task.CompletedTask;
    }

    public async Task BookCampAsync(string userId, TrainingCampRequest request, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.BookCampAsync(userId, request.CampType ?? "generic", cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Insufficient resources to book camp.");
        }
    }

    public async Task SaveIndividualTrainingAsync(string userId, IndividualTrainingRequest request, CancellationToken cancellationToken = default)
    {
        var success = await teamStore.SaveIndividualTrainingAsync(userId, request.Id, request.SkillType, cancellationToken);
        if (!success)
        {
            throw new InvalidOperationException("Player not found.");
        }
    }

    public async Task RenewIndividualTrainingAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var renewed = await teamStore.RenewIndividualTrainingAsync(userId, playerId, cancellationToken);
        if (renewed == 0)
        {
            throw new InvalidOperationException("Insufficient stars or no active individual training.");
        }
    }

    public async Task RenewAllIndividualTrainingAsync(string userId, CancellationToken cancellationToken = default)
    {
        var renewed = await teamStore.RenewIndividualTrainingAsync(userId, null, cancellationToken);
        if (renewed == 0)
        {
            throw new InvalidOperationException("Insufficient stars or no active individual training.");
        }
    }
}
