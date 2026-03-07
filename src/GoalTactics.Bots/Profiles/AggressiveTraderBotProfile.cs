namespace GoalTactics.Bots.Profiles;

public sealed class AggressiveTraderBotProfile : IBotProfile
{
    public string Name => "AggressiveTraderBot";
    public decimal RiskTolerance => 0.8m;
    public decimal SocialDrive => 0.4m;
    public decimal TransferAppetite => 0.95m;
    public decimal LadderFocus => 0.35m;
    public decimal TrainingDiscipline => 0.4m;
}
