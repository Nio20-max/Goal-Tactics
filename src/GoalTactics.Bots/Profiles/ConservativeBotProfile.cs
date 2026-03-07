namespace GoalTactics.Bots.Profiles;

public sealed class ConservativeBotProfile : IBotProfile
{
    public string Name => "ConservativeBot";
    public decimal RiskTolerance => 0.15m;
    public decimal SocialDrive => 0.35m;
    public decimal TransferAppetite => 0.2m;
    public decimal LadderFocus => 0.25m;
    public decimal TrainingDiscipline => 0.8m;
}
