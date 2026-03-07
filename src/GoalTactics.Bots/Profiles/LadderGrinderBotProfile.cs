namespace GoalTactics.Bots.Profiles;

public sealed class LadderGrinderBotProfile : IBotProfile
{
    public string Name => "LadderGrinderBot";
    public decimal RiskTolerance => 0.65m;
    public decimal SocialDrive => 0.3m;
    public decimal TransferAppetite => 0.35m;
    public decimal LadderFocus => 0.95m;
    public decimal TrainingDiscipline => 0.7m;
}
