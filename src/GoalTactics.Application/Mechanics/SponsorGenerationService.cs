namespace GoalTactics.Application.Mechanics;

public sealed class SponsorGenerationService
{
    public (int Money, int Stars) GenerateOffer(int teamLevel)
    {
        var money = 5000 + teamLevel * 1000;
        var stars = Math.Max(1, teamLevel / 3);
        return (money, stars);
    }
}
