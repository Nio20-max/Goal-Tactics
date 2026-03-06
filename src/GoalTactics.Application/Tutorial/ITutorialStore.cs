namespace GoalTactics.Application.Tutorial;

public interface ITutorialStore
{
    Task<string?> GetCurrentTopicIdAsync(string userId, CancellationToken cancellationToken = default);

    Task SetCurrentTopicIdAsync(string userId, string topicId, CancellationToken cancellationToken = default);
}
