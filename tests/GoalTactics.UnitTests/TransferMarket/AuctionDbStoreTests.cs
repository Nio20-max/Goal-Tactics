using GoalTactics.Application.Common;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Contracts.TransferMarket;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using GoalTactics.Infrastructure.TransferMarket;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.UnitTests.TransferMarket;

public sealed class AuctionDbStoreTests : IDisposable
{
    private readonly SqliteConnection _connection;
    private readonly GoalTacticsDbContext _dbContext;
    private readonly AuctionDbStore _store;
    private readonly FakeNotificationService _notificationService;

    public AuctionDbStoreTests()
    {
        _connection = new SqliteConnection("Data Source=:memory:");
        _connection.Open();

        var options = new DbContextOptionsBuilder<GoalTacticsDbContext>()
            .UseSqlite(_connection)
            .Options;

        _dbContext = new GoalTacticsDbContext(options);
        _dbContext.Database.EnsureCreated();
        _notificationService = new FakeNotificationService();
        _store = new AuctionDbStore(_dbContext, _notificationService);
    }

    public void Dispose()
    {
        _dbContext.Dispose();
        _connection.Dispose();
    }

    private sealed class FakeNotificationService : INotificationService
    {
        public int CallCount { get; private set; }
        public string? UserId { get; private set; }
        public string? Subject { get; private set; }
        public string? Message { get; private set; }

        public Task SendUserNotificationAsync(string userId, string subject, string message, CancellationToken cancellationToken = default)
        {
            CallCount++;
            UserId = userId;
            Subject = subject;
            Message = message;
            return Task.CompletedTask;
        }
    }

    [Fact]
    public async Task EnsureSystemAuctions_CreatesRequiredCount()
    {
        await _store.EnsureSystemAuctionsAsync(5);

        var auctions = await _dbContext.Auctions.ToListAsync();
        Assert.Equal(5, auctions.Count);
        Assert.All(auctions, a => Assert.Equal("Active", a.Status));
    }

    [Fact]
    public async Task EnsureSystemAuctions_DoesNotCreateMore_WhenCountMet()
    {
        await _store.EnsureSystemAuctionsAsync(5);
        await _store.EnsureSystemAuctionsAsync(5);

        var auctions = await _dbContext.Auctions.ToListAsync();
        Assert.Equal(5, auctions.Count);
    }

    [Fact]
    public async Task Search_ReturnsActiveAuctions()
    {
        await _store.EnsureSystemAuctionsAsync(3);
        var (items, totalCount) = await _store.SearchAsync(new TransferSearchRequest());
        Assert.Equal(3, totalCount);
        Assert.Equal(3, items.Count);
    }

    [Fact]
    public async Task Search_FiltersAge()
    {
        await SeedAuction(playerAge: 20);
        await SeedAuction(playerAge: 30);
        await SeedAuction(playerAge: 25);

        var (items, totalCount) = await _store.SearchAsync(new TransferSearchRequest
        {
            Age = new RangeValue { Min = 22, Max = 28 }
        });

        Assert.Single(items);
        Assert.Equal(25, items[0].Age);
    }

    [Fact]
    public async Task PlaceBid_AcceptsValidBid()
    {
        var auctionId = await SeedAuction(minimumBid: 1000, currentBid: 0);

        var result = await _store.PlaceBidAsync(auctionId, "team-1", "Team One", null, 1500);

        Assert.True(result);

        var auction = await _dbContext.Auctions.FirstAsync(a => a.Id == auctionId.ToString("N"));
        Assert.Equal(1500, auction.CurrentBid);
        Assert.Equal("team-1", auction.CurrentBidderTeamId);
    }

    [Fact]
    public async Task PlaceBid_SendsOutbidNotification_ToPreviousBidder()
    {
        // setup user, team and preferences for previous bidder
        _dbContext.Users.Add(new UserEntity { Id = "previous-user", ManagerName = "Prev User", Email = "prev@test.com", PasswordHash = "hash", CreatedAtUtc = DateTime.UtcNow });
        _dbContext.Teams.Add(new TeamEntity { Id = "prev-team", UserId = "previous-user", Name = "Previous FC", Country = "DE", CountryName = "Deutschland", LeagueName = "Amateur", MarketValue = 100000, Mood = 50, TeamMood = "Neutral", Wins = 0, Losses = 0, Fans = 100, Members = 100, Strength = 50, MatchTrend = "Stable", StadiumName = "Arena", GrassQuality = 100, LeagueTier = 1 });
        _dbContext.UserPreferences.Add(new UserPreferencesEntity { UserId = "previous-user", SystemNotifications = true, AuctionOverbid = true, AuctionEnd = true, MatchResults = true, LineupIncomplete = true, FriendInvite = true, IneffectiveTraining = true, FriendlyMatch = true });
        await _dbContext.SaveChangesAsync();

        var auctionId = await SeedAuction(minimumBid: 1000, currentBid: 1000, currentBidderTeamId: "prev-team", currentBidderTeamName: "Previous FC");

        var result = await _store.PlaceBidAsync(auctionId, "team-1", "Team One", null, 1500);

        Assert.True(result);
        Assert.Equal(1, _notificationService.CallCount);
        Assert.Equal("previous-user", _notificationService.UserId);
        Assert.Equal("Transfer market: You were outbid", _notificationService.Subject);
        Assert.Contains("Team One", _notificationService.Message);

        var mail = await _dbContext.TeamMail.FirstOrDefaultAsync(x => x.UserId == "previous-user");
        Assert.Null(mail);
    }

    [Fact]
    public async Task PlaceBid_RejectsLowBid()
    {
        var auctionId = await SeedAuction(minimumBid: 1000, currentBid: 1200);

        var result = await _store.PlaceBidAsync(auctionId, "team-1", "Team One", null, 1100);

        Assert.False(result);
    }

    [Fact]
    public async Task PlaceBid_ExtendTimer_WhenLessThan20Seconds()
    {
        var auctionId = await SeedAuction(minimumBid: 1000, currentBid: 0, secondsRemaining: 10);

        var before = DateTime.UtcNow;
        var result = await _store.PlaceBidAsync(auctionId, "team-1", "Team One", null, 1500);
        var after = DateTime.UtcNow;

        Assert.True(result);

        var auction = await _dbContext.Auctions.FirstAsync(a => a.Id == auctionId.ToString("N"));
        // End date should have been extended to ~20 seconds from now
        Assert.True(auction.EndDateUtc > before.AddSeconds(15));
    }

    [Fact]
    public async Task PlaceBid_Rejects_WhenAuctionAlreadyExpired()
    {
        var auctionId = await SeedAuction(minimumBid: 1000, currentBid: 0, secondsRemaining: -1);

        var result = await _store.PlaceBidAsync(auctionId, "team-1", "Team One", null, 1500);

        Assert.False(result);

        var auction = await _dbContext.Auctions.FirstAsync(a => a.Id == auctionId.ToString("N"));
        Assert.Equal("Expired", auction.Status);
    }

    [Fact]
    public async Task ToggleFavorite_AddsAndRemoves()
    {
        var auctionId = await SeedAuction();

        await _store.ToggleFavoriteAsync("user-1", auctionId);
        var favorites = await _store.GetFavoritesAsync("user-1");
        Assert.Single(favorites);

        await _store.ToggleFavoriteAsync("user-1", auctionId);
        favorites = await _store.GetFavoritesAsync("user-1");
        Assert.Empty(favorites);
    }

    [Fact]
    public async Task SettleExpiredAuctions_MarksSoldWhenBidExists()
    {
        var auctionId = await SeedAuction(minimumBid: 1000, currentBid: 0, secondsRemaining: -10);
        // Place a bid on the already-created auction
        var auction = await _dbContext.Auctions.FirstAsync(a => a.Id == auctionId.ToString("N"));
        auction.CurrentBid = 2000;
        auction.CurrentBidderTeamId = "buyer-team";
        auction.CurrentBidderTeamName = "Buyer FC";
        await _dbContext.SaveChangesAsync();

        // Create buyer team and resources
        _dbContext.Users.Add(new UserEntity
        {
            Id = "buyer-user",
            ManagerName = "Buyer Manager",
            Email = "buyer@test.com",
            PasswordHash = "hash",
            CreatedAtUtc = DateTime.UtcNow
        });
        _dbContext.Teams.Add(new TeamEntity
        {
            Id = "buyer-team",
            UserId = "buyer-user",
            Name = "Buyer FC",
            Country = "DE",
            CountryName = "Deutschland",
            LeagueName = "Amateur",
            MarketValue = 100000,
            Mood = 50,
            TeamMood = "Neutral",
            Wins = 0, Losses = 0, Fans = 100, Members = 100, Strength = 50,
            MatchTrend = "Stable", StadiumName = "Arena", GrassQuality = 100, LeagueTier = 1
        });
        _dbContext.TeamResources.Add(new TeamResourcesEntity { TeamId = "buyer-team", Money = 500000, GTStars = 1000 });
        await _dbContext.SaveChangesAsync();

        var settled = await _store.SettleExpiredAuctionsAsync();

        Assert.Equal(1, settled);
        auction = await _dbContext.Auctions.FirstAsync(a => a.Id == auctionId.ToString("N"));
        Assert.Equal("Sold", auction.Status);
    }

    [Fact]
    public async Task SettleExpiredAuctions_MarksExpiredWhenNoBids()
    {
        await SeedAuction(secondsRemaining: -10);

        var settled = await _store.SettleExpiredAuctionsAsync();

        Assert.Equal(1, settled);
        var auction = await _dbContext.Auctions.FirstAsync();
        Assert.Equal("Expired", auction.Status);
    }

    [Fact]
    public async Task GetSellings_ReturnsTeamListings()
    {
        // Add a team auction
        _dbContext.Auctions.Add(new AuctionEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            SellerTeamId = "seller-team",
            PlayerName = "Test Player",
            PlayerCountry = "de",
            PlayerHead = "01_head-A01",
            PlayerPosition = 4,
            PlayerStrength = 80m,
            PlayerTalent = 6,
            PlayerAge = 25,
            MinimumBid = 50000,
            CurrentBid = 0,
            EndDateUtc = DateTime.UtcNow.AddHours(2),
            Status = "Active",
            CreatedAtUtc = DateTime.UtcNow
        });
        await _dbContext.SaveChangesAsync();

        var sellings = await _store.GetSellingsAsync("seller-team");
        Assert.Single(sellings);
    }

    private async Task<Guid> SeedAuction(
        long minimumBid = 10000,
        long currentBid = 0,
        int playerAge = 25,
        int secondsRemaining = 3600,
        string? currentBidderTeamId = null,
        string? currentBidderTeamName = null)
    {
        var id = Guid.NewGuid();
        _dbContext.Auctions.Add(new AuctionEntity
        {
            Id = id.ToString("N"),
            PlayerName = "Test Player",
            PlayerCountry = "de",
            PlayerHead = "01_head-A01",
            PlayerPosition = 4,
            PlayerStrength = 80m,
            PlayerTalent = 6,
            PlayerAge = playerAge,
            MinimumBid = minimumBid,
            CurrentBid = currentBid,
            CurrentBidderTeamId = currentBidderTeamId,
            CurrentBidderTeamName = currentBidderTeamName,
            EndDateUtc = DateTime.UtcNow.AddSeconds(secondsRemaining),
            Status = "Active",
            CreatedAtUtc = DateTime.UtcNow
        });
        await _dbContext.SaveChangesAsync();
        return id;
    }
}
