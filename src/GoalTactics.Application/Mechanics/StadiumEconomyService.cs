namespace GoalTactics.Application.Mechanics;

public sealed class StadiumEconomyService
{
    public StadiumEconomyResult CalculateMatchday(
        int leagueTier,
        int wins,
        int losses,
        int vipSeats,
        int sitSeats,
        int standSeats,
        int fanShopLevel,
        int parkingLevel,
        int officeLevel)
    {
        var ticketPrices = GetTicketPrices(leagueTier);
        var caps = GetSeatCaps(leagueTier);

        var vipCapacity = Math.Clamp(vipSeats, 0, caps.MaxVipSeats);
        var sitCapacity = Math.Clamp(sitSeats, 0, caps.MaxSitSeats);

        var standingDemandCap = GetStandingDemandCap(leagueTier, wins, losses);
        var standCapacityUsed = Math.Max(0, Math.Min(standSeats, standingDemandCap));

        var visitors = vipCapacity + sitCapacity + standCapacityUsed;
        var baseIncome = (vipCapacity * ticketPrices.Vip) + (sitCapacity * ticketPrices.Sit) + (standCapacityUsed * ticketPrices.Stand);

        var facilityBonus = (decimal)(fanShopLevel * 450 + parkingLevel * 300);
        var dailyFacilityCost = (decimal)(officeLevel * 250 + fanShopLevel * 180 + parkingLevel * 150);
        var earnings = Math.Max(0m, baseIncome + facilityBonus - dailyFacilityCost);

        return new StadiumEconomyResult(visitors, earnings);
    }

    public (int MaxVipSeats, int MaxSitSeats) GetSeatCaps(int leagueTier)
    {
        return leagueTier switch
        {
            1 => (2800, 35000),
            2 => (2300, 28500),
            3 => (1900, 24000),
            _ => (1700, 20000)
        };
    }

    private static (int Vip, int Sit, int Stand) GetTicketPrices(int leagueTier)
    {
        return leagueTier switch
        {
            1 => (436, 34, 17),
            2 => (343, 27, 13),
            3 => (269, 21, 10),
            _ => (212, 16, 8)
        };
    }

    private static int GetStandingDemandCap(int leagueTier, int wins, int losses)
    {
        var baseline = leagueTier switch
        {
            1 => 60000,
            2 => 48000,
            3 => 38000,
            _ => 30000
        };

        var formDelta = Math.Clamp((wins - losses) * 750, -12000, 18000);
        return Math.Max(5000, baseline + formDelta);
    }
}

public sealed record StadiumEconomyResult(int Visitors, decimal Earnings);
