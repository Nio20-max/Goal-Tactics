namespace GoalTactics.Bots.Profiles;

public interface IBotProfile
{
    string Name { get; }

    decimal RiskTolerance { get; }

    decimal SocialDrive { get; }

    decimal TransferAppetite { get; }

    decimal LadderFocus { get; }

    decimal TrainingDiscipline { get; }
}
