namespace GoalTactics.Bots.Profiles;

public sealed class SocialBotProfile : IBotProfile
{
    public string Name => "SocialBot";
    public decimal RiskTolerance => 0.4m;
    public decimal SocialDrive => 0.95m;
    public decimal TransferAppetite => 0.4m;
    public decimal LadderFocus => 0.45m;
    public decimal TrainingDiscipline => 0.55m;
}
