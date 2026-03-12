namespace GoalTactics.Infrastructure.Persistence.Entities;

public sealed class AuctionEntity
{
    public required string Id { get; set; }

    /// <summary>References the player being sold; null for generated (non-team) players.</summary>
    public string? PlayerId { get; set; }

    /// <summary>Team that listed the player; null for system-generated auctions.</summary>
    public string? SellerTeamId { get; set; }

    public string PlayerName { get; set; } = string.Empty;

    public string PlayerCountry { get; set; } = "DE";

    public string PlayerHead { get; set; } = "01_head-A01";

    public int PlayerPosition { get; set; }

    public decimal PlayerStrength { get; set; }

    public int PlayerTalent { get; set; }

    public int PlayerAge { get; set; }

    public long MinimumBid { get; set; }

    public long CurrentBid { get; set; }

    /// <summary>Team ID of the current highest bidder; null if no bids yet.</summary>
    public string? CurrentBidderTeamId { get; set; }

    public string? CurrentBidderTeamName { get; set; }

    public string? CurrentBidderTeamLogo { get; set; }

    /// <summary>When the auction ends (UTC).</summary>
    public DateTime EndDateUtc { get; set; }

    /// <summary>Active, Sold, Expired, Cancelled.</summary>
    public string Status { get; set; } = "Active";

    public DateTime CreatedAtUtc { get; set; }
}
