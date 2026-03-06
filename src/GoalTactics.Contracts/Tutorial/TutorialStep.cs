namespace GoalTactics.Contracts.Tutorial;

public sealed class TutorialStep
{
    public string? TopicID { get; init; }

    public string? Title { get; init; }

    public string? Message { get; init; }

    public string? CharacterID { get; init; }

    public string? ControlID { get; init; }

    public string? NextTopicID { get; init; }

    public int RewardMoney { get; init; }

    public int RewardStars { get; init; }

    public bool CanSkip { get; init; }

    public string? Screen { get; init; }

    public string? Submenu { get; init; }
}
