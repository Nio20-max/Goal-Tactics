using GoalTactics.Contracts.Tutorial;

namespace GoalTactics.Application.Tutorial;

public interface ITutorialService
{
    Task<TutorialResponse> GetTutorialAsync(string userId, CancellationToken cancellationToken = default);

    Task<TutorialResponse> SkipTutorialAsync(string userId, CancellationToken cancellationToken = default);

    Task<TutorialResponse> FinishTutorialStepAsync(string userId, CancellationToken cancellationToken = default);

    Task<TutorialResponse> ResetTutorialAsync(string userId, string? topicId, CancellationToken cancellationToken = default);
}

public sealed class TutorialService(ITutorialStore tutorialStore) : ITutorialService
{
    private const string DefaultTopic = "welcome";

    public async Task<TutorialResponse> GetTutorialAsync(string userId, CancellationToken cancellationToken = default)
    {
        var topicId = await tutorialStore.GetCurrentTopicIdAsync(userId, cancellationToken) ?? DefaultTopic;
        return BuildResponse(topicId, NextTopic(topicId), canSkip: true);
    }

    public Task<TutorialResponse> SkipTutorialAsync(string userId, CancellationToken cancellationToken = default)
    {
        return SetAndBuildAsync(userId, "tutorial-finished", cancellationToken);
    }

    public async Task<TutorialResponse> FinishTutorialStepAsync(string userId, CancellationToken cancellationToken = default)
    {
        var current = await tutorialStore.GetCurrentTopicIdAsync(userId, cancellationToken) ?? DefaultTopic;
        var next = NextTopic(current) ?? "tutorial-finished";
        return await SetAndBuildAsync(userId, next, cancellationToken);
    }

    public Task<TutorialResponse> ResetTutorialAsync(string userId, string? topicId, CancellationToken cancellationToken = default)
    {
        var targetTopic = string.IsNullOrWhiteSpace(topicId) ? DefaultTopic : topicId;
        return SetAndBuildAsync(userId, targetTopic, cancellationToken);
    }

    private async Task<TutorialResponse> SetAndBuildAsync(string userId, string topicId, CancellationToken cancellationToken)
    {
        await tutorialStore.SetCurrentTopicIdAsync(userId, topicId, cancellationToken);
        return BuildResponse(topicId, NextTopic(topicId), canSkip: true);
    }

    private static TutorialResponse BuildResponse(string topicId, string? nextTopicId, bool canSkip)
    {
        return new TutorialResponse
        {
            Success = true,
            CurrentStep = new TutorialStep
            {
                TopicID = topicId,
                NextTopicID = nextTopicId,
                CanSkip = canSkip,
                Title = "Tutorial",
                Message = "Progress your tutorial.",
                Screen = "Main"
            }
        };
    }

    private static string? NextTopic(string topicId)
    {
        return topicId switch
        {
            "welcome" => "tutorial-step-1",
            "tutorial-step-1" => "tutorial-step-2",
            "tutorial-step-2" => "tutorial-finished",
            "tutorial-finished" => null,
            _ => "tutorial-finished"
        };
    }
}
