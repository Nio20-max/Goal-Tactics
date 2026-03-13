namespace GoalTactics.Contracts.TransferMarket;

// Legacy Xamarin compatibility payload used by Transfermarket details screens.
public sealed class TransferAuctionPlayerData
{
    public Guid Id { get; init; }
    public Guid TeamId { get; init; }
    public string Name { get; init; } = string.Empty;
    public string CustomName { get; init; } = string.Empty;
    public int Age { get; init; }
    public int Talent { get; init; }
    public int Position { get; init; }
    public decimal Strength { get; init; }
    public string Country { get; init; } = "de";
    public string Head { get; init; } = "01_head-A01";
    public bool IsFrozen { get; init; }

    public Guid AuctionId { get; init; }
    public decimal Bid { get; init; }
    public decimal BidIncrement { get; init; }
    public decimal Offer { get; init; }
    public Guid OfferTeamId { get; init; }
    public string EndDate { get; init; } = string.Empty;
    public Guid BidTeamId { get; init; }
    public string BidTeamName { get; init; } = string.Empty;
    public string BidTeamLogo { get; init; } = string.Empty;
    public string OfferTeamName { get; init; } = string.Empty;
    public string OfferTeamTrikot { get; init; } = "trikot0";
    public string OfferTeamLogo { get; init; } = string.Empty;
    public bool IsFavorite { get; init; }

    public decimal Experience { get; init; }
    public decimal Fitness { get; init; }
    public string Body { get; init; } = "01_body-A00";
    public string Gloves { get; init; } = "01_Gloves01";
    public string Shoes { get; init; } = "01_Shoes01";
    public decimal Salary { get; init; }
    public decimal MarketValue { get; init; }
    public string Origin { get; init; } = "de";

    public decimal[] Skills { get; init; } =
    [
        0m, 0m, 0m, 0m, 0m, 0m, 0m,
        0m, 0m, 0m, 0m, 0m, 0m, 0m
    ];

    public int MainSkill { get; init; }

    public int[] BonusSkills { get; init; } = [1, 13, 13, 12];

    public int YellowCards { get; init; }
    public bool HasRedCard { get; init; }
    public int Injured { get; init; }
    public bool IsForSale { get; init; }
    public decimal SellPrice { get; init; }
    public decimal TransfermarketFee { get; init; }
    public decimal TransfermarketMaxOffer { get; init; }
    public decimal TransfermarketMinOffer { get; init; }
    public int TransfermarketMaxHours { get; init; }
    public bool IsUpgraded { get; init; }
    public decimal MaxUpgradeStrength { get; init; }
    public int Shirt { get; init; }
    public bool CanExtendContract { get; init; }
    public bool HasIndividualTraining { get; init; }
}