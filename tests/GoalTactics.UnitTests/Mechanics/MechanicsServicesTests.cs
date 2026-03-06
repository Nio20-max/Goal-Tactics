using GoalTactics.Application.Mechanics;

namespace GoalTactics.UnitTests.Mechanics;

public sealed class MechanicsServicesTests
{
    [Fact]
    public void TeamStrengthCalculator_ComputesPositiveStrength()
    {
        var calculator = new TeamStrengthCalculator();
        var value = calculator.Calculate(baseStrength: 50, tacticBonus: 5, fitnessAverage: 80);
        Assert.True(value > 0);
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
