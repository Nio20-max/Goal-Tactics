using GoalTactics.Application.Mechanics;

namespace GoalTactics.UnitTests.Mechanics;

public sealed class MechanicsServicesTests
{
    [Fact]
    public void TeamStrengthCalculator_ComputesPositiveStrength()
    {
        var calculator = new TeamStrengthCalculator();
        // (50 + 5) * (0.80 + 80/500.0) = 55 * 0.96 = 52.8 → 53
        var value = calculator.Calculate(baseStrength: 50, tacticBonus: 5, fitnessAverage: 80);
        Assert.Equal(53, value);
    }

    [Fact]
    public void TeamStrengthCalculator_FullFitness_ReturnsFullStrength()
    {
        var calculator = new TeamStrengthCalculator();
        // (100 + 0) * (0.80 + 100/500.0) = 100 * 1.00 = 100
        var value = calculator.Calculate(baseStrength: 100, tacticBonus: 0, fitnessAverage: 100);
        Assert.Equal(100, value);
    }

    [Fact]
    public void TeamStrengthCalculator_ZeroFitness_Returns80Percent()
    {
        var calculator = new TeamStrengthCalculator();
        // (100 + 0) * (0.80 + 0/500.0) = 100 * 0.80 = 80
        var value = calculator.Calculate(baseStrength: 100, tacticBonus: 0, fitnessAverage: 0);
        Assert.Equal(80, value);
    }

    [Fact]
    public void TransferAuctionService_RejectsLowBid()
    {
        var service = new TransferAuctionService();
        Assert.False(service.IsBidValid(bid: 100, minimumBid: 150, currentBid: 120));
    }

    [Fact]
    public void InjuryAndCardService_RedCardCreatesSuspension()
    {
        var service = new InjuryAndCardService();
        Assert.Equal(2, service.CalculateSuspensionMatches(yellowCards: 0, redCard: true));
    }
}
