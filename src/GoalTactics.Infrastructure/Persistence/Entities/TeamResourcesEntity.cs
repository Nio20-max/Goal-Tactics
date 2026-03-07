namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class TeamResourcesEntity
{
    public required string TeamId { get; set; }

    public decimal Money { get; set; }

    public decimal Medipacks { get; set; }

    public decimal GTStars { get; set; }

    public int OfficeLevel { get; set; } = 1;

    public int TrainingCenterLevel { get; set; } = 1;

    public int MedicalCenterLevel { get; set; } = 1;

    public int YouthAcademyLevel { get; set; } = 1;

    public int FanShopLevel { get; set; } = 1;

    public int ParkingLevel { get; set; } = 1;

    public int StadiumVipSeats { get; set; } = 200;

    public int StadiumSitSeats { get; set; } = 2500;

    public int StadiumStandSeats { get; set; } = 2300;

    public long StadiumVisitorsLastMatch { get; set; }

    public long StadiumVisitorsTotal { get; set; }

    public decimal StadiumEarningsLastMatch { get; set; }

    public decimal StadiumEarningsTotal { get; set; }

    public int StadiumMatchesCount { get; set; }

    public DateTime? LastEconomyTickUtc { get; set; }

    public DateTime? LastTrainingTickUtc { get; set; }

    public int ProgressDayCounter { get; set; }

    public TeamEntity? Team { get; set; }
}
