namespace GoalTactics.Bots.Profiles;

public sealed class NewManagerBotProfile : IBotProfile
{
    public string Name => "NewManagerBot";
    public decimal RiskTolerance => 0.25m;
    public decimal SocialDrive => 0.45m;
    public decimal TransferAppetite => 0.3m;
    public decimal LadderFocus => 0.35m;
    public decimal TrainingDiscipline => 0.7m;
}
