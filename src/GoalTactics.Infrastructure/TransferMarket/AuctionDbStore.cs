using GoalTactics.Application.Common;
using GoalTactics.Application.TransferMarket;
using GoalTactics.Contracts.TransferMarket;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.TransferMarket;

public sealed class AuctionDbStore(GoalTacticsDbContext dbContext, INotificationService? notificationService = null) : IAuctionStore
{
    private static readonly string[] HeadVariants =
    [
        "01_head-A01", "01_head-A02", "01_head-A03", "01_head-A04", "01_head-A05",
        "01_head-A06", "01_head-A07", "01_head-A08", "01_head-A09", "01_head-A10",
        "01_head-A11", "01_head-A12", "01_head-A13",
        "01_head-B01", "01_head-B02", "01_head-B03",
        "01_head-C01", "01_head-C02", "01_head-C03"
    ];

    private static readonly HashSet<string> SafeCountryCodes = new(StringComparer.OrdinalIgnoreCase)
    {
        "de", "at", "ch", "fr", "es", "it", "gb", "us", "br", "pt", "nl", "be"
    };

    private static readonly HashSet<string> SafeHeads = new(StringComparer.OrdinalIgnoreCase)
    {
        "01_head-A01", "01_head-A02", "01_head-A03", "01_head-A04", "01_head-A05",
        "01_head-A06", "01_head-A07", "01_head-A08", "01_head-A09", "01_head-A10",
        "01_head-A11", "01_head-A12", "01_head-A13",
        "01_head-B01", "01_head-B02", "01_head-B03",
        "01_head-C01", "01_head-C02", "01_head-C03"
    };

    private static readonly string[] Countries =
    [
        "de", "at", "ch", "nl", "be", "fr", "es", "pt", "it", "gb",
        "ie", "se", "no", "dk", "fi", "pl", "cz", "hr", "rs", "gr",
        "tr", "br", "ar", "co", "mx", "us", "jp", "kr", "au", "lt"
    ];

    private static readonly string[] FirstNames =
    [
        "Liam", "Noah", "Finn", "Elias", "Jonas", "Leon", "Matteo", "Luca", "Paul", "Ben",
        "Maximilian", "Felix", "Emil", "Theo", "Niklas", "Oscar", "Anton", "Viktor", "Tobias", "Moritz",
        "Luis", "Hugo", "Carlos", "Diego", "Marco", "Stefan", "Daniel", "Lukas", "Timo", "Jan",
        "Sven", "Erik", "Mats", "Lars", "Axel", "Anders", "Bjorn", "Pavel", "Ivan", "Yuri",
        "Kenji", "Haruto", "Mateo", "Santiago", "Emiliano", "Raphael", "Alejandro", "Omar", "Andre", "Nelson"
    ];

    private static readonly string[] LastNames =
    [
        "Mueller", "Schmidt", "Schneider", "Fischer", "Weber", "Meyer", "Wagner", "Becker", "Hoffmann", "Richter",
        "Klein", "Wolf", "Neumann", "Schwarz", "Braun", "Krueger", "Hofmann", "Hartmann", "Lange", "Werner",
        "Moreno", "Garcia", "Lopez", "Martinez", "Rodriguez", "Fernandez", "Gonzalez", "Hernandez", "Torres", "Ramirez",
        "Eriksson", "Johansson", "Larsson", "Lindberg", "Petrov", "Novak", "Tanaka", "Watanabe", "Silva", "Santos",
        "Rossi", "Ricci", "Colombo", "De Vries", "Bakker", "Jansen", "O'Brien", "Murphy", "Walsh", "Kelly"
    ];

    // Internal transfer rows historically used legacy codes: 0=GK, 2=DEF, 4=MID, 6=FWD.
    // Public API responses are normalized to canonical 0=GK, 1=DEF, 2=MID, 3=FWD.
    private static readonly int[] PositionCodes = [0, 2, 4, 6];
    private static readonly string[] PositionNames = ["GK", "DEF", "MID", "FWD"];
    private const string SystemSellerName = "Goal Tactics";
    private const string DefaultSellerLogo = "trikot0";

    public async Task<(IReadOnlyList<TransferPlayerData> Items, int TotalCount)> SearchAsync(TransferSearchRequest request, CancellationToken ct = default)
    {
        await ExpireAuctionsAsync(ct);

        var now = DateTime.UtcNow;
        var query = dbContext.Auctions.AsNoTracking()
            .Where(a => a.Status == "Active" || (a.Status == "Sold" && a.EndDateUtc >= now.AddMinutes(-5)));

        if (request.Age is not null)
        {
            if (request.Age.Min is not null)
                query = query.Where(a => a.PlayerAge >= request.Age.Min);
            if (request.Age.Max is not null)
                query = query.Where(a => a.PlayerAge <= request.Age.Max);
        }

        if (request.Strength is not null)
        {
            if (request.Strength.Min is not null)
                query = query.Where(a => a.PlayerStrength >= request.Strength.Min);
            if (request.Strength.Max is not null)
                query = query.Where(a => a.PlayerStrength <= request.Strength.Max);
        }

        if (request.Talent is not null)
        {
            if (request.Talent.Min is not null)
                query = query.Where(a => a.PlayerTalent >= request.Talent.Min);
            if (request.Talent.Max is not null)
                query = query.Where(a => a.PlayerTalent <= request.Talent.Max);
        }

        if (request.Budget is not null)
            query = query.Where(a => a.CurrentBid <= (long)request.Budget || (a.CurrentBid == 0 && a.MinimumBid <= (long)request.Budget));

        if (request.SkillIndex >= 0)
        {
            var posCode = PositionCodeFromSkillIndex(request.SkillIndex);
            if (posCode >= 0)
                query = query.Where(a => a.PlayerPosition == posCode);
        }

        if (request.OnlyKeeper is true)
            query = query.Where(a => a.PlayerPosition == 0);

        var ordered = query.OrderBy(a => a.EndDateUtc);

        var totalCount = await ordered.CountAsync(ct);

        var page = request.SafePage;
        var pageSize = request.SafePageSize;

        var auctions = await ordered
            .Skip((page - 1) * pageSize)
            .Take(pageSize)
            .ToListAsync(ct);

        var mapped = await MapAuctionsAsync(auctions, ct);
        return (mapped, totalCount);
    }

    public async Task<TransferPlayerData?> GetAuctionAsync(Guid auctionId, CancellationToken ct = default)
    {
        await ExpireAuctionsAsync(ct);

        var auction = await dbContext.Auctions.AsNoTracking()
            .FirstOrDefaultAsync(a => a.Id == auctionId.ToString("N"), ct);
        if (auction is null)
        {
            return null;
        }

        var mapped = await MapAuctionsAsync([auction], ct);
        return mapped.Count > 0 ? mapped[0] : null;
    }

    public async Task<bool> PlaceBidAsync(Guid auctionId, string teamId, string teamName, string? teamLogo,
        long amount, CancellationToken ct = default)
    {
        // Ensure auctions that have reached end time are settled before allowing bids.
        await ExpireAuctionsAsync(ct);

        var now = DateTime.UtcNow;

        var auction = await dbContext.Auctions
            .FirstOrDefaultAsync(a => a.Id == auctionId.ToString("N"), ct);

        if (auction is null) return false;
        if (auction.Status != "Active" || auction.EndDateUtc <= now) return false;

        // Validate bid
        var effectiveCurrent = auction.CurrentBid > 0 ? auction.CurrentBid : auction.MinimumBid;
        if (amount < auction.MinimumBid || (auction.CurrentBid > 0 && amount <= auction.CurrentBid))
            return false;

        // Cannot bid on own auction
        if (auction.SellerTeamId == teamId)
            return false;

        var previousBidderTeamId = auction.CurrentBidderTeamId;

        // Record bid
        auction.CurrentBid = amount;
        auction.CurrentBidderTeamId = teamId;
        auction.CurrentBidderTeamName = teamName;
        auction.CurrentBidderTeamLogo = teamLogo;

        // Extend timer if less than 20 seconds remain
        var remaining = auction.EndDateUtc - DateTime.UtcNow;
        if (remaining < TimeSpan.FromSeconds(20))
        {
            auction.EndDateUtc = DateTime.UtcNow.AddSeconds(20);
        }

        dbContext.AuctionBids.Add(new AuctionBidEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            AuctionId = auction.Id,
            TeamId = teamId,
            TeamName = teamName,
            Amount = amount,
            CreatedAtUtc = DateTime.UtcNow
        });

        if (!string.IsNullOrWhiteSpace(previousBidderTeamId)
            && !string.Equals(previousBidderTeamId, teamId, StringComparison.Ordinal))
        {
            await AddAuctionMailForTeamAsync(
                previousBidderTeamId,
                subject: "Transfer market: You were outbid",
                message: $"Your bid for {auction.PlayerName} was outbid by {teamName}.",
                requiresAuctionOverbid: true,
                requiresAuctionEnd: false,
                ct);
        }

        await dbContext.SaveChangesAsync(ct);
        return true;
    }

    public async Task<IReadOnlyList<TransferPlayerData>> GetFavoritesAsync(string userId, CancellationToken ct = default)
    {
        await ExpireAuctionsAsync(ct);

        var now = DateTime.UtcNow;
        var favorites = await dbContext.AuctionFavorites.AsNoTracking()
            .Where(f => f.UserId == userId)
            .Join(dbContext.Auctions.AsNoTracking(),
                f => f.AuctionId,
                a => a.Id,
                (_, a) => a)
            .Where(a => a.Status == "Active" || (a.Status == "Sold" && a.EndDateUtc >= now.AddMinutes(-5)))
            .ToListAsync(ct);

        return await MapAuctionsAsync(favorites, ct);
    }

    public async Task ToggleFavoriteAsync(string userId, Guid auctionId, CancellationToken ct = default)
    {
        var auctionIdStr = auctionId.ToString("N");
        var existing = await dbContext.AuctionFavorites
            .FirstOrDefaultAsync(f => f.UserId == userId && f.AuctionId == auctionIdStr, ct);

        if (existing is not null)
        {
            dbContext.AuctionFavorites.Remove(existing);
        }
        else
        {
            dbContext.AuctionFavorites.Add(new AuctionFavoriteEntity
            {
                UserId = userId,
                AuctionId = auctionIdStr
            });
        }

        await dbContext.SaveChangesAsync(ct);
    }

    public async Task<IReadOnlyList<TransferPlayerData>> GetSellingsAsync(string teamId, CancellationToken ct = default)
    {
        await ExpireAuctionsAsync(ct);

        var now = DateTime.UtcNow;
        var sellings = await dbContext.Auctions.AsNoTracking()
            .Where(a => a.SellerTeamId == teamId && (a.Status == "Active" || (a.Status == "Sold" && a.EndDateUtc >= now.AddMinutes(-5))))
            .ToListAsync(ct);

        return await MapAuctionsAsync(sellings, ct);
    }

    public async Task<int> SettleExpiredAuctionsAsync(CancellationToken ct = default)
    {
        var now = DateTime.UtcNow;
        var expired = await dbContext.Auctions
            .Where(a => a.Status == "Active" && a.EndDateUtc <= now)
            .ToListAsync(ct);

        if (expired.Count == 0) return 0;

        foreach (var auction in expired)
        {
            if (auction.CurrentBidderTeamId is not null)
            {
                // Auction won — transfer player to winning team
                auction.Status = "Sold";

                // If this was a real team player listing, move the player
                if (auction.PlayerId is not null)
                {
                    var player = await dbContext.TeamPlayers
                        .FirstOrDefaultAsync(p => p.Id == auction.PlayerId, ct);
                    if (player is not null)
                    {
                        player.TeamId = auction.CurrentBidderTeamId;
                        // Assign new shirt number
                        var existingShirts = await dbContext.TeamPlayers
                            .Where(p => p.TeamId == auction.CurrentBidderTeamId && !p.IsScouted)
                            .Select(p => p.ShirtNumber)
                            .ToListAsync(ct);
                        player.ShirtNumber = Enumerable.Range(1, 99).First(n => !existingShirts.Contains(n));
                    }
                }
                else
                {
                    // System-generated auction — create a new player for the winning team
                    var existingShirts = await dbContext.TeamPlayers
                        .Where(p => p.TeamId == auction.CurrentBidderTeamId && !p.IsScouted)
                        .Select(p => p.ShirtNumber)
                        .ToListAsync(ct);
                    var posName = auction.PlayerPosition switch
                    {
                        0 => "GK",
                        2 => "DEF",
                        4 => "MID",
                        6 => "FWD",
                        _ => "MID"
                    };

                    dbContext.TeamPlayers.Add(new TeamPlayerEntity
                    {
                        Id = Guid.NewGuid().ToString("N"),
                        TeamId = auction.CurrentBidderTeamId,
                        Name = auction.PlayerName,
                        Origin = auction.PlayerCountry.ToUpperInvariant(),
                        Position = posName,
                        ShirtNumber = Enumerable.Range(1, 99).First(n => !existingShirts.Contains(n)),
                        Age = auction.PlayerAge,
                        Talent = auction.PlayerTalent,
                        Strength = auction.PlayerStrength,
                        Experience = LegacyAppCompatibility.BuildExperience(auction.PlayerStrength, auction.PlayerAge, 0),
                        Fitness = 100,
                        ContractEndUtc = DateTime.UtcNow.AddDays(180)
                    });
                }

                // Deduct money from buyer's team
                var buyerTeam = await dbContext.Teams.FirstOrDefaultAsync(t => t.Id == auction.CurrentBidderTeamId, ct);
                if (buyerTeam is not null)
                {
                    var buyerResources = await dbContext.TeamResources
                        .FirstOrDefaultAsync(r => r.TeamId == buyerTeam.Id, ct);
                    if (buyerResources is not null)
                    {
                        buyerResources.Money -= auction.CurrentBid;
                    }
                }

                // Credit money to seller's team if applicable
                if (auction.SellerTeamId is not null)
                {
                    var sellerResources = await dbContext.TeamResources
                        .FirstOrDefaultAsync(r => r.TeamId == auction.SellerTeamId, ct);
                    if (sellerResources is not null)
                    {
                        sellerResources.Money += auction.CurrentBid;
                    }
                }

                await AddAuctionMailForTeamAsync(
                    auction.CurrentBidderTeamId,
                    subject: "Transfer market: Auction won",
                    message: $"You won {auction.PlayerName} for {auction.CurrentBid:N0}.",
                    requiresAuctionOverbid: false,
                    requiresAuctionEnd: true,
                    ct);

                if (!string.IsNullOrWhiteSpace(auction.SellerTeamId))
                {
                    await AddAuctionMailForTeamAsync(
                        auction.SellerTeamId,
                        subject: "Transfer market: Player sold",
                        message: $"{auction.PlayerName} was sold for {auction.CurrentBid:N0}.",
                        requiresAuctionOverbid: false,
                        requiresAuctionEnd: true,
                        ct);
                }
            }
            else
            {
                // No bids — auction expired without sale
                auction.Status = "Expired";

                if (!string.IsNullOrWhiteSpace(auction.SellerTeamId))
                {
                    await AddAuctionMailForTeamAsync(
                        auction.SellerTeamId,
                        subject: "Transfer market: Auction ended",
                        message: $"No bids were placed for {auction.PlayerName}.",
                        requiresAuctionOverbid: false,
                        requiresAuctionEnd: true,
                        ct);
                }
            }
        }

        await dbContext.SaveChangesAsync(ct);
        return expired.Count;
    }

    public async Task<Guid> ListPlayerAsync(string sellerTeamId, string playerId, long minimumBid,
        TimeSpan duration, CancellationToken ct = default)
    {
        var alreadyListed = await dbContext.Auctions.AsNoTracking()
            .AnyAsync(a => a.PlayerId == playerId && a.Status == "Active", ct);
        if (alreadyListed)
        {
            throw new InvalidOperationException("Player is already listed on the transfer market.");
        }

        var player = await dbContext.TeamPlayers
            .FirstOrDefaultAsync(p => p.Id == playerId && p.TeamId == sellerTeamId && !p.IsScouted, ct)
            ?? throw new InvalidOperationException("Player not found or not owned by team.");

        var team = await dbContext.Teams.FirstOrDefaultAsync(t => t.Id == sellerTeamId, ct);
        var posCode = player.Position switch
        {
            "GK" => 0,
            "DEF" => 2,
            "MID" => 4,
            "FWD" => 6,
            _ => 4
        };

        var auctionId = Guid.NewGuid();
        var now = DateTime.UtcNow;

        dbContext.Auctions.Add(new AuctionEntity
        {
            Id = auctionId.ToString("N"),
            PlayerId = playerId,
            SellerTeamId = sellerTeamId,
            PlayerName = player.Name,
            PlayerCountry = player.Origin.ToLowerInvariant(),
            PlayerHead = "01_head-A01",
            PlayerPosition = posCode,
            PlayerStrength = player.Strength,
            PlayerTalent = player.Talent,
            PlayerAge = player.Age,
            MinimumBid = minimumBid,
            CurrentBid = 0,
            EndDateUtc = now.Add(duration),
            Status = "Active",
            CreatedAtUtc = now
        });

        await dbContext.SaveChangesAsync(ct);
        return auctionId;
    }

    public async Task EnsureSystemAuctionsAsync(int minimumCount, CancellationToken ct = default)
    {
        var activeCount = await dbContext.Auctions.CountAsync(a => a.Status == "Active", ct);
        var toGenerate = minimumCount - activeCount;
        if (toGenerate <= 0) return;

        var now = DateTime.UtcNow;
        var rng = new Random(now.DayOfYear * 1000 + now.Hour * 60 + now.Minute + activeCount);

        for (var i = 0; i < toGenerate; i++)
        {
            var posIndex = rng.Next(PositionCodes.Length);
            var position = PositionCodes[posIndex];
            var age = rng.Next(17, 34);
            var talent = rng.Next(3, 10);
            var baseStrength = 40 + talent * 6 + rng.Next(-5, 15);
            var strength = Math.Round((decimal)(baseStrength + rng.NextDouble() * 10), 4);
            var minimumBid = (long)(strength * 800 + rng.Next(1000, 5000));

            var firstName = FirstNames[rng.Next(FirstNames.Length)];
            var lastName = LastNames[rng.Next(LastNames.Length)];
            var country = Countries[rng.Next(Countries.Length)];
            var head = HeadVariants[rng.Next(HeadVariants.Length)];

            // Vary auction duration between 1 and 4 hours
            var durationMinutes = rng.Next(60, 240);

            dbContext.Auctions.Add(new AuctionEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                PlayerId = null,
                SellerTeamId = null,
                PlayerName = $"{firstName} {lastName}",
                PlayerCountry = country,
                PlayerHead = head,
                PlayerPosition = position,
                PlayerStrength = strength,
                PlayerTalent = talent,
                PlayerAge = age,
                MinimumBid = minimumBid,
                CurrentBid = 0,
                EndDateUtc = now.AddMinutes(durationMinutes),
                Status = "Active",
                CreatedAtUtc = now
            });
        }

        await dbContext.SaveChangesAsync(ct);
    }

    private async Task ExpireAuctionsAsync(CancellationToken ct = default)
    {
        var now = DateTime.UtcNow;
        var expired = await dbContext.Auctions
            .Where(a => a.Status == "Active" && a.EndDateUtc <= now)
            .ToListAsync(ct);

        if (expired.Count == 0) return;

        foreach (var auction in expired)
        {
            if (auction.CurrentBidderTeamId is not null)
            {
                auction.Status = "Sold";
            }
            else
            {
                auction.Status = "Expired";
            }
            auction.EndDateUtc = now;
        }

        await dbContext.SaveChangesAsync(ct);
    }

    private async Task<IReadOnlyList<TransferPlayerData>> MapAuctionsAsync(IReadOnlyList<AuctionEntity> auctions, CancellationToken ct)
    {
        if (auctions.Count == 0)
        {
            return [];
        }

        var sellerIds = auctions
            .Select(a => a.SellerTeamId)
            .Where(id => !string.IsNullOrWhiteSpace(id))
            .Distinct(StringComparer.Ordinal)
            .ToArray();

        var sellers = sellerIds.Length == 0
            ? new Dictionary<string, TeamEntity>(StringComparer.Ordinal)
            : await dbContext.Teams.AsNoTracking()
                .Where(t => sellerIds.Contains(t.Id))
                .ToDictionaryAsync(t => t.Id, t => t, StringComparer.Ordinal, ct);

        return auctions
            .Select(a => ToTransferPlayerData(a, sellers))
            .ToArray();
    }

    private static TransferPlayerData ToTransferPlayerData(AuctionEntity a, IReadOnlyDictionary<string, TeamEntity> sellers)
    {
        var auctionGuid = Guid.TryParse(a.Id, out var g) ? g : Guid.Empty;
        var bidTeamId = Guid.TryParse(a.CurrentBidderTeamId, out var parsedBidTeamId) ? parsedBidTeamId : Guid.Empty;
        var sellerTeamId = Guid.TryParse(a.SellerTeamId, out var parsedSellerTeamId) ? parsedSellerTeamId : Guid.Empty;

        TeamEntity? seller = null;
        if (!string.IsNullOrWhiteSpace(a.SellerTeamId))
        {
            sellers.TryGetValue(a.SellerTeamId, out seller);
        }

        var sellerName = seller?.Name;
        if (string.IsNullOrWhiteSpace(sellerName))
        {
            sellerName = SystemSellerName;
        }

        var sellerLogo = !string.IsNullOrWhiteSpace(seller?.SelectedShirt)
            ? seller.SelectedShirt
            : DefaultSellerLogo;

        return new TransferPlayerData
        {
            Id = auctionGuid,
            AuctionId = auctionGuid,
            Name = a.PlayerName ?? string.Empty,
            Country = NormalizeCountry(a.PlayerCountry),
            Head = NormalizeHead(a.PlayerHead),
            Position = NormalizePosition(a.PlayerPosition),
            Strength = a.PlayerStrength,
            Talent = a.PlayerTalent,
            Age = a.PlayerAge,
            Bid = a.CurrentBid > 0 ? a.CurrentBid : a.MinimumBid,
            EndDate = a.EndDateUtc.ToString("O"),
            IsFrozen = a.Status != "Active",
            BidTeamId = bidTeamId,
            BidTeamName = a.CurrentBidderTeamName ?? string.Empty,
            BidTeamLogo = a.CurrentBidderTeamLogo ?? string.Empty,
            SellerTeamId = sellerTeamId,
            SellerTeamName = sellerName,
            SellerTeamLogo = sellerLogo
        };
    }

    private static string NormalizeCountry(string? value)
    {
        if (string.IsNullOrWhiteSpace(value))
        {
            return "de";
        }

        var normalized = value.Trim().ToLowerInvariant();
        return SafeCountryCodes.Contains(normalized) ? normalized : "de";
    }

    private static string NormalizeHead(string? value)
    {
        if (!string.IsNullOrWhiteSpace(value) && SafeHeads.Contains(value))
        {
            return value;
        }

        return "01_head-A01";
    }

    private static int NormalizePosition(int value) => value switch
    {
        0 => 0,
        1 => 1,
        2 => 1,
        3 => 2,
        4 => 2,
        5 => 3,
        6 => 3,
        _ => 2
    };

    private static int PositionCodeFromSkillIndex(int skillIndex) => skillIndex switch
    {
        0 => 2,  // defender (main skill = defence)
        1 => 0,  // goalkeeper (main skill = keeping)
        2 => 6,  // forward (main skill = shots)
        3 => 4,  // midfielder (main skill = playmaking)
        _ => -1
    };

    private async Task AddAuctionMailForTeamAsync(
        string teamId,
        string subject,
        string message,
        bool requiresAuctionOverbid,
        bool requiresAuctionEnd,
        CancellationToken ct)
    {
        var team = await dbContext.Teams.AsNoTracking().FirstOrDefaultAsync(t => t.Id == teamId, ct);
        if (team is null)
        {
            return;
        }

        var preferences = await dbContext.UserPreferences.AsNoTracking().FirstOrDefaultAsync(x => x.UserId == team.UserId, ct);
        if (preferences is not null)
        {
            if (!preferences.SystemNotifications)
            {
                return;
            }

            if (requiresAuctionOverbid && !preferences.AuctionOverbid)
            {
                return;
            }

            if (requiresAuctionEnd && !preferences.AuctionEnd)
            {
                return;
            }
        }

        // Prefer realtime push notifications; fallback to team mail when push service is unavailable.
        if (notificationService is not null)
        {
            await notificationService.SendUserNotificationAsync(team.UserId, subject, message, ct);
            return;
        }

        dbContext.TeamMail.Add(new TeamMailEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            UserId = team.UserId,
            DateText = DateTime.UtcNow.ToString("yyyy-MM-dd"),
            Subject = subject,
            Sender = "Transfermarket",
            Message = message,
            IsNew = true,
            SenderType = 0
        });
    }
}
