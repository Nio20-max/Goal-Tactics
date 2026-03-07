namespace GoalTactics.Bots.Profiles;

public sealed class YouthFocusedBotProfile : IBotProfile
{
    public string Name => "YouthFocusedBot";
    public decimal RiskTolerance => 0.45m;
    public decimal SocialDrive => 0.35m;
    public decimal TransferAppetite => 0.45m;
    public decimal LadderFocus => 0.3m;
    public decimal TrainingDiscipline => 0.95m;
}
