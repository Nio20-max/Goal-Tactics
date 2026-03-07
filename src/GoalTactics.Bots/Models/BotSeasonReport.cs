namespace GoalTactics.Bots.Models;

public sealed class BotSeasonReport
{
    public int SeasonNumber { get; init; }

    public int MatchesPlayed { get; set; }

    public int TotalGoals { get; set; }

    public int HomeWins { get; set; }

    public int AwayWins { get; set; }

    public int Draws { get; set; }

    public int AuctionBids { get; set; }

    public int AdsWatched { get; set; }

    public int ChatMessages { get; set; }

    public int FriendlyRequests { get; set; }

    public int FriendlyAccepted { get; set; }

    public int SponsorsAccepted { get; set; }

    public int SeasonSponsorsSigned { get; set; }

    public int ShortSponsorsRenewed { get; set; }

    public int LadderChallenges { get; set; }

    public int TransfersCompleted { get; set; }

    public decimal TransferFeesPaidMoney { get; set; }

    public decimal StarsSpent { get; set; }

    public decimal StarsEarned { get; set; }
}
