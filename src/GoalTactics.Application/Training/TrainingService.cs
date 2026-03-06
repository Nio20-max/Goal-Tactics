using GoalTactics.Contracts.Training;

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

public sealed class TrainingService : ITrainingService
{
    public Task<TeamTrainingResponse> GetTeamTrainingAsync(string userId, CancellationToken cancellationToken = default)
    {
        return Task.FromResult(new TeamTrainingResponse
        {
            Success = true,
            TeamTraining = new TeamTrainingData
            {
                MainSkillIndex = 0,
                SubSkillIndex = 2,
                EfficiencyText = "Good",
                EfficiencyValue = 80
            }
        });
    }

    public Task SaveTeamTrainingAsync(string userId, TeamTrainingSaveRequest request, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task SaveTacticTrainingAsync(string userId, TacticTrainingSaveRequest request, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task BookCampAsync(string userId, TrainingCampRequest request, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task SaveIndividualTrainingAsync(string userId, IndividualTrainingRequest request, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task RenewIndividualTrainingAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => Task.CompletedTask;

    public Task RenewAllIndividualTrainingAsync(string userId, CancellationToken cancellationToken = default) => Task.CompletedTask;
}
