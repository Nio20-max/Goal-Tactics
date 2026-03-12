using GoalTactics.Contracts.Common;

namespace GoalTactics.Contracts.Training;

public sealed class IndividualTrainingRequest : IdRequest
{
    public string? SkillType { get; init; }

    /// <summary>Xamarin client sends SkillIndex (int 0‑13) instead of SkillType.</summary>
    public int? SkillIndex { get; init; }

    /// <summary>Xamarin client sends PlayerID instead of Id.</summary>
    public Guid? PlayerID { get; init; }

    public Guid ResolvedPlayerId => PlayerID != Guid.Empty && PlayerID.HasValue ? PlayerID.Value : Id;

    public string? ResolvedSkillType => SkillType ?? IndexToSkill(SkillIndex ?? 0);

    private static string? IndexToSkill(int index) => index switch
    {
        0 => "Defence",
        1 => "Keeping",
        2 => "Shots",
        3 => "Playmaking",
        4 => "Passing",
        5 => "BallControl",
        6 => "Duel",
        7 => "OneOnOne",
        8 => "Header",
        9 => "Speed",
        10 => "Flanks",
        11 => "Cornerkick",
        12 => "Freekick",
        13 => "Penalty",
        _ => null
    };
}
