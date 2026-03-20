using GoalTactics.Application.Auth;
using GoalTactics.Application.Common;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace GoalTactics.Infrastructure.Authentication;

public sealed class AuthDbStore(GoalTacticsDbContext dbContext) : IAuthStore
{
    private const int ClubsPerLeague = 16;
    private const int PreferredHumanTier = 3;
    private const int StartingMoney = 10_000_000;
    private const int StartingMedipacks = 3;
    private const int StartingGtStars = 5_000;
    private static readonly IReadOnlyDictionary<int, int> LeagueGroupsPerTier = new Dictionary<int, int>
    {
        [1] = 1,
        [2] = 5,
        [3] = 15,
        [4] = 45
    };

    public async Task<AuthUserRecord?> GetUserByEmailAsync(string email, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Email == email && x.DeletedAtUtc == null, cancellationToken)
            ?? await dbContext.Users.AsNoTracking().FirstOrDefaultAsync(x => x.ManagerName == email && x.DeletedAtUtc == null, cancellationToken);
        return user is null
            ? null
            : new AuthUserRecord(user.Id, user.Email, user.PasswordHash, user.ManagerName,
                user.FailedLoginAttempts, user.LockedUntilUtc, user.EmailVerified);
    }

    public async Task<AuthUserRecord?> GetUserByIdAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Id == userId && x.DeletedAtUtc == null, cancellationToken);
        return user is null
            ? null
            : new AuthUserRecord(user.Id, user.Email, user.PasswordHash, user.ManagerName,
                user.FailedLoginAttempts, user.LockedUntilUtc, user.EmailVerified);
    }

    public async Task<bool> IsManagerNameTakenAsync(string managerName, CancellationToken cancellationToken = default)
    {
        return await dbContext.Users.AnyAsync(x => x.ManagerName == managerName && x.DeletedAtUtc == null, cancellationToken);
    }

    public async Task<bool> AddUserAsync(AuthUserRecord user, CancellationToken cancellationToken = default)
    {
        var existing = await dbContext.Users.FirstOrDefaultAsync(x => x.Email == user.Email, cancellationToken);
        if (existing is not null && existing.DeletedAtUtc is null)
        {
            return false;
        }

        if (existing is not null)
        {
            TombstoneDeletedUser(existing);
            await dbContext.SaveChangesAsync(cancellationToken);
        }

        await using var tx = await dbContext.Database.BeginTransactionAsync(cancellationToken);

        dbContext.Users.Add(new UserEntity
        {
            Id = user.UserId,
            Email = user.Email,
            PasswordHash = user.PasswordHash,
            ManagerName = user.ManagerName,
            CreatedAtUtc = DateTime.UtcNow
        });
        await dbContext.SaveChangesAsync(cancellationToken);

        await EnsureLeaguePyramidSeededAsync(cancellationToken);
        await AssignUserToNextAvailableBotSlotAsync(user.UserId, cancellationToken);

        await tx.CommitAsync(cancellationToken);
        return true;
    }

    private static void TombstoneDeletedUser(UserEntity user)
    {
        var deletedStamp = DateTime.UtcNow.ToString("yyyyMMddHHmmss", CultureInfo.InvariantCulture);
        var idPrefix = user.Id.Length >= 8 ? user.Id[..8] : user.Id;

        user.Email = $"deleted_{deletedStamp}_{idPrefix}@deleted.goaltactics.local";
        user.ManagerName = $"Deleted {idPrefix}";
    }

    public async Task AddSessionAsync(AuthSessionRecord session, CancellationToken cancellationToken = default)
    {
        dbContext.UserSessions.Add(new UserSessionEntity
        {
            Id = session.SessionId,
            UserId = session.UserId,
            TokenId = session.TokenId,
            IssuedAtUtc = session.IssuedAtUtc,
            ExpiresAtUtc = session.ExpiresAtUtc,
            RevokedAtUtc = session.RevokedAtUtc,
            ClientVersion = session.ClientVersion,
            Capabilities = session.Capabilities,
            Platform = session.Platform,
            DeviceId = session.DeviceId,
            RefreshToken = session.RefreshToken,
            RefreshTokenExpiresUtc = session.RefreshTokenExpiresUtc,
            RefreshTokenUsed = false
        });

        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == session.UserId, cancellationToken);
        if (user is not null)
        {
            user.LastLoginAtUtc = session.IssuedAtUtc;
            user.LastActivityAtUtc = session.IssuedAtUtc;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public Task<bool> IsSessionActiveAsync(string tokenId, CancellationToken cancellationToken = default)
    {
        var now = DateTime.UtcNow;
        return dbContext.UserSessions.AnyAsync(
            x => x.TokenId == tokenId && x.RevokedAtUtc == null && x.ExpiresAtUtc > now,
            cancellationToken);
    }

    public async Task RevokeSessionAsync(string tokenId, CancellationToken cancellationToken = default)
    {
        var session = await dbContext.UserSessions.FirstOrDefaultAsync(x => x.TokenId == tokenId, cancellationToken);
        if (session is null || session.RevokedAtUtc is not null)
        {
            return;
        }

        session.RevokedAtUtc = DateTime.UtcNow;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task RecordFailedLoginAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user is not null)
        {
            user.FailedLoginAttempts++;
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    public async Task ResetFailedLoginsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user is not null)
        {
            user.FailedLoginAttempts = 0;
            user.LockedUntilUtc = null;
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    public async Task LockAccountAsync(string userId, DateTime lockedUntilUtc, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user is not null)
        {
            user.LockedUntilUtc = lockedUntilUtc;
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    public async Task SetEmailVerificationTokenAsync(string userId, string token, DateTime expiresUtc, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user is not null)
        {
            user.EmailVerificationToken = token;
            user.EmailVerificationTokenExpiresUtc = expiresUtc;
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    public async Task<bool> VerifyEmailAsync(string userId, string token, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user is null || user.EmailVerificationToken != token)
            return false;
        if (user.EmailVerificationTokenExpiresUtc.HasValue && user.EmailVerificationTokenExpiresUtc.Value < DateTime.UtcNow)
            return false;

        user.EmailVerified = true;
        user.EmailVerificationToken = null;
        user.EmailVerificationTokenExpiresUtc = null;
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task SetPasswordResetTokenAsync(string userId, string token, DateTime expiresUtc, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        if (user is not null)
        {
            user.PasswordResetToken = token;
            user.PasswordResetTokenExpiresUtc = expiresUtc;
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    public async Task<bool> ResetPasswordAsync(string email, string token, string newPasswordHash, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Email == email, cancellationToken);
        if (user is null || user.PasswordResetToken != token)
            return false;
        if (user.PasswordResetTokenExpiresUtc.HasValue && user.PasswordResetTokenExpiresUtc.Value < DateTime.UtcNow)
            return false;

        user.PasswordHash = newPasswordHash;
        user.PasswordResetToken = null;
        user.PasswordResetTokenExpiresUtc = null;
        user.FailedLoginAttempts = 0;
        user.LockedUntilUtc = null;
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<AuthSessionRecord?> GetSessionByRefreshTokenAsync(string refreshToken, CancellationToken cancellationToken = default)
    {
        var session = await dbContext.UserSessions.AsNoTracking()
            .FirstOrDefaultAsync(x => x.RefreshToken == refreshToken, cancellationToken);
        if (session is null) return null;
        return new AuthSessionRecord(
            session.Id, session.UserId, session.TokenId,
            session.IssuedAtUtc, session.ExpiresAtUtc, session.RevokedAtUtc,
            session.ClientVersion, session.Capabilities, session.Platform, session.DeviceId,
            session.RefreshToken, session.RefreshTokenExpiresUtc);
    }

    public async Task MarkRefreshTokenUsedAsync(string sessionId, CancellationToken cancellationToken = default)
    {
        var session = await dbContext.UserSessions.FirstOrDefaultAsync(x => x.Id == sessionId, cancellationToken);
        if (session is not null)
        {
            session.RefreshTokenUsed = true;
            session.RevokedAtUtc = DateTime.UtcNow;
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    private async Task EnsureLeaguePyramidSeededAsync(CancellationToken cancellationToken)
    {
        // Seed the minimal league structure needed for the first user.
        // The first league is created lazily; additional leagues are created on demand as users join.
        if (await dbContext.Leagues.AnyAsync(cancellationToken))
        {
            return;
        }

        // Seed the pyramid starting from tier 1 (highest), not tier 3.
        var tier = 1;
        var groupNumber = 1;

        var league = new LeagueEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            Tier = tier,
            GroupNumber = groupNumber,
            Name = BuildLeagueName(tier, groupNumber),
            Mount = GetMountForTier(tier),
            Dismount = GetDismountForTier(tier)
        };

        dbContext.Leagues.Add(league);
        await dbContext.SaveChangesAsync(cancellationToken);

        for (var slotIndex = 1; slotIndex <= ClubsPerLeague; slotIndex++)
        {
            await CreateBotLeagueSlotAsync(league, slotIndex, cancellationToken, saveChanges: false);
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private async Task CreateBotLeagueSlotAsync(LeagueEntity league, int slotIndex, CancellationToken cancellationToken, bool saveChanges = true)
    {
        var randomSeed = HashCode.Combine(league.Tier, league.GroupNumber, slotIndex);
        var random = new Random(randomSeed);

        var botUserId = Guid.NewGuid().ToString("N");
        var botTeamId = Guid.NewGuid().ToString("N");
        var botName = $"Bot FC {league.Tier}-{league.GroupNumber}-{slotIndex}";

        dbContext.Users.Add(new UserEntity
        {
            Id = botUserId,
            Email = $"bot+t{league.Tier}g{league.GroupNumber}s{slotIndex}@bots.goaltactics.local",
            PasswordHash = string.Empty,
            ManagerName = botName,
            CreatedAtUtc = DateTime.UtcNow
        });

        dbContext.Teams.Add(new TeamEntity
        {
            Id = botTeamId,
            UserId = botUserId,
            Name = botName,
            Country = "DE",
            CountryName = "Germany",
            LeagueName = league.Name,
            MarketValue = random.Next(80_000, 220_000),
            Mood = random.Next(35, 80),
            TeamMood = "Neutral",
            Wins = random.Next(0, 8),
            Losses = random.Next(0, 8),
            Fans = random.Next(300, 3_000),
            Members = random.Next(200, 2_000),
            Strength = random.Next(35, 88),
            MatchTrend = "Stable",
            LeagueTier = league.Tier
        });

        dbContext.TeamResources.Add(new TeamResourcesEntity
        {
            TeamId = botTeamId,
            Money = random.Next(30_000, 150_000),
            Medipacks = random.Next(0, 8),
            GTStars = random.Next(0, 200),
            OfficeLevel = random.Next(1, 8),
            TrainingCenterLevel = random.Next(1, 8),
            MedicalCenterLevel = random.Next(1, 8),
            YouthAcademyLevel = random.Next(1, 8),
            FanShopLevel = random.Next(1, 8),
            ParkingLevel = random.Next(1, 8),
            StadiumVipSeats = 200,
            StadiumSitSeats = 2500,
            StadiumStandSeats = 2300,
            LastEconomyTickUtc = DateTime.UtcNow,
            LastTrainingTickUtc = DateTime.UtcNow,
            ProgressDayCounter = random.Next(0, 30)
        });

        dbContext.TeamTrainingStates.Add(new TeamTrainingStateEntity
        {
            TeamId = botTeamId,
            MainSkillIndex = random.Next(0, 4),
            SubSkillIndex = random.Next(4, 14),
            CampType = string.Empty,
            CampActiveUntilUtc = null
        });

        foreach (var player in BuildInitialPlayers(botTeamId, random))
        {
            dbContext.TeamPlayers.Add(player);
        }

        dbContext.LeagueTeams.Add(new LeagueTeamEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            LeagueId = league.Id,
            TeamId = botTeamId,
            TeamName = botName,
            IsBot = true,
            Strength = random.Next(35, 88),
            Country = "DE",
            Logo = LegacyAppCompatibility.BuildLogoId(botTeamId),
            IsOnline = false,
            MatchesHome = 0,
            MatchesAway = 0,
            WinsHome = 0,
            WinsAway = 0,
            LossesHome = 0,
            LossesAway = 0,
            DrawsHome = 0,
            DrawsAway = 0,
            GoalsScoredHome = 0,
            GoalsScoredAway = 0,
            GoalsReceivedHome = 0,
            GoalsReceivedAway = 0,
            PointsHome = 0,
            PointsAway = 0
        });

        if (saveChanges)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    private async Task AssignUserToNextAvailableBotSlotAsync(string userId, CancellationToken cancellationToken)
    {
        var existingTeam = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (existingTeam is not null)
        {
            return;
        }

        // Use the league store's assignment logic so we always start at tier 1 and fill tiers top-down.
        var leagueStore = new GoalTactics.Infrastructure.League.LeagueDbStore(dbContext);
        var league = await leagueStore.FindOrCreateLeagueWithBotSlotAsync(cancellationToken);

        var targetSlot = await dbContext.LeagueTeams
            .Where(x => x.LeagueId == league.Id && x.IsBot)
            .OrderBy(x => x.Id)
            .FirstOrDefaultAsync(cancellationToken);

        if (targetSlot is null || string.IsNullOrWhiteSpace(targetSlot.TeamId))
        {
            return;
        }

        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.Id == targetSlot.TeamId, cancellationToken);
        if (team is null)
        {
            return;
        }

        var user = await dbContext.Users.FirstAsync(x => x.Id == userId, cancellationToken);
        var now = DateTime.UtcNow;

        var previousBotUserId = team.UserId;

        team.UserId = userId;
        team.Name = user.ManagerName;
        team.Country = "DE";
        team.LeagueName = league.Name;
        team.LeagueTier = league.Tier;
        team.CountryName = "Deutschland";
        team.MarketValue = 100000;
        team.Mood = 50;
        team.TeamMood = "Neutral";
        team.Wins = 0;
        team.Losses = 0;
        team.Fans = 100;
        team.Members = 100;
        team.MatchTrend = "Stable";
        team.StadiumName = "My Stadium";
        team.GrassQuality = 80;

        var resources = await dbContext.TeamResources.FirstOrDefaultAsync(x => x.TeamId == team.Id, cancellationToken);
        if (resources is not null)
        {
            resources.Money = StartingMoney;
            resources.Medipacks = StartingMedipacks;
            resources.GTStars = StartingGtStars;
            resources.OfficeLevel = 1;
            resources.TrainingCenterLevel = 1;
            resources.MedicalCenterLevel = 1;
            resources.YouthAcademyLevel = 1;
            resources.FanShopLevel = 1;
            resources.ParkingLevel = 1;
            resources.StadiumVipSeats = 200;
            resources.StadiumSitSeats = 2500;
            resources.StadiumStandSeats = 2300;
            resources.StadiumVisitorsLastMatch = 0;
            resources.StadiumVisitorsTotal = 0;
            resources.StadiumEarningsLastMatch = 0m;
            resources.StadiumEarningsTotal = 0m;
            resources.StadiumMatchesCount = 0;
            resources.LastEconomyTickUtc = now;
            resources.LastTrainingTickUtc = now;
            resources.LastSponsorPayoutUtc = now.Date;
            resources.ActiveConstructionId = null;
            resources.ActiveConstructionPlaceId = null;
            resources.ActiveConstructionType = null;
            resources.ActiveConstructionCurrentValue = 0;
            resources.ActiveConstructionNewValue = 0;
            resources.ActiveConstructionUpgradeCost = 0m;
            resources.ActiveConstructionUpgradeCostPremium = 0m;
            resources.ActiveConstructionStartUtc = null;
            resources.ActiveConstructionEndUtc = null;
            resources.ProgressDayCounter = 0;
        }

        var existingPlayers = await dbContext.TeamPlayers.Where(x => x.TeamId == team.Id).ToListAsync(cancellationToken);
        if (existingPlayers.Count > 0)
        {
            dbContext.TeamPlayers.RemoveRange(existingPlayers);
        }

        var playerSeed = new Random(HashCode.Combine(team.Id, userId, "human-assignment"));
        var rebuiltPlayers = BuildInitialPlayers(team.Id, playerSeed).ToArray();
        foreach (var player in rebuiltPlayers)
        {
            dbContext.TeamPlayers.Add(player);
        }

        team.Strength = rebuiltPlayers
            .OrderBy(player => player.ShirtNumber)
            .ThenByDescending(player => player.Strength)
            .Take(11)
            .Sum(player => (int)Math.Round(player.Strength, MidpointRounding.AwayFromZero));

        targetSlot.IsBot = false;
        targetSlot.IsOnline = true;
        targetSlot.TeamName = team.Name;
        targetSlot.Strength = team.Strength;
        targetSlot.Country = team.Country;
        targetSlot.Logo = team.SelectedEmblem ?? LegacyAppCompatibility.BuildLogoId(team.Id);

        await dbContext.SaveChangesAsync(cancellationToken);

        var oldBotUser = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == previousBotUserId, cancellationToken);
        if (oldBotUser is not null)
        {
            dbContext.Users.Remove(oldBotUser);
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    private static int GetMountForTier(int tier)
    {
        return tier switch
        {
            1 => 2,
            2 => 1,
            3 => 2,
            4 => 2,
            _ => 0
        };
    }

    private static int GetDismountForTier(int tier)
    {
        return tier switch
        {
            1 => 6,
            2 => 6,
            3 => 6,
            4 => 0,
            _ => 0
        };
    }

    private static string BuildLeagueName(int tier, int groupNumber)
    {
        var tierName = tier switch
        {
            1 => "1st League",
            2 => "2nd League",
            3 => "3rd League",
            4 => "4th League",
            _ => $"Tier {tier.ToString(CultureInfo.InvariantCulture)}"
        };

        return groupNumber == 1 ? tierName : $"{tierName} Group {groupNumber.ToString(CultureInfo.InvariantCulture)}";
    }

    private static IReadOnlyList<TeamPlayerEntity> BuildInitialPlayers(string teamId, Random random)
    {
        var firstNames = new[] { "Ehrmut", "Dragoljub", "Manuel", "Hendrik", "Calvin", "Nikolai", "Lukas", "Jonas", "David", "Mika", "Tobias", "Felix", "Marco", "Adrian", "Dominik", "Sebastian", "Florian", "Jan", "Leon", "Patrick" };
        var lastNames = new[] { "Hoschatt", "Kumer", "Neuer", "Haintzl", "Johnston", "Pfalz-Sulzbach", "Morante", "Raizgys", "Schneider", "Vogel", "Mertens", "Lindner", "Baumann", "Reiter", "Hartmann", "Keller", "Schuster", "Brandt", "Scholz", "Bergmann" };
        var origins = new[] { "Deutschland", "Osterreich", "Schweiz", "Slowenien", "Irland", "Litauen" };
        var positions = new[] { "GK", "GK", "DEF", "DEF", "DEF", "DEF", "DEF", "DEF", "MID", "MID", "MID", "MID", "MID", "MID", "FWD", "FWD", "FWD", "FWD" };
        var players = new List<TeamPlayerEntity>(positions.Length);

        for (var i = 0; i < positions.Length; i++)
        {
            var position = positions[i];
            var baseStrength = position switch
            {
                "GK" => 74,
                "DEF" => 68,
                "MID" => 69,
                "FWD" => 70,
                _ => 65
            };

            var playerId = Guid.NewGuid();
            var age = i < 4 ? random.Next(18, 24) : random.Next(18, 33);
            var talent = random.Next(4, 11);
            var fitness = random.Next(86, 101);
            var strength = Math.Clamp(baseStrength + random.Next(-6, 12) + random.Next(0, 6), 55m, 95m);
            var bonusSkills = LegacyAppCompatibility.BuildRandomBonusSkills(playerId);
            var skills = LegacyAppCompatibility.BuildSkills(strength, position, talent, age, bonusSkills);
            var calculatedStrength = PlayerValueCalculator.CalculateStrength(skills, position, fitness, age, talent, bonusSkills);
            var marketValue = PlayerValueCalculator.CalculateMarketValue(skills, position, fitness, age, talent, bonusSkills);

            players.Add(new TeamPlayerEntity
            {
                Id = playerId.ToString("N"),
                TeamId = teamId,
                Name = $"{firstNames[(random.Next(firstNames.Length) + i) % firstNames.Length]} {lastNames[(random.Next(lastNames.Length) + (i * 3)) % lastNames.Length]}",
                Origin = origins[(random.Next(origins.Length) + i) % origins.Length],
                Position = position,
                ShirtNumber = i + 1,
                Age = age,
                Talent = talent,
                Strength = calculatedStrength,
                MarketValue = marketValue,
                Skill0 = skills[0],
                Skill1 = skills[1],
                Skill2 = skills[2],
                Skill3 = skills[3],
                Skill4 = skills[4],
                Skill5 = skills[5],
                Skill6 = skills[6],
                Skill7 = skills[7],
                Skill8 = skills[8],
                Skill9 = skills[9],
                Skill10 = skills[10],
                Skill11 = skills[11],
                Skill12 = skills[12],
                Skill13 = skills[13],
                Fitness = fitness,
                Matches = random.Next(0, 30),
                Goals = position == "FWD" ? random.Next(0, 20) : random.Next(0, 6),
                YellowCards = 0,
                RedCards = 0,
                SuspensionMatchesRemaining = 0,
                ContractEndUtc = DateTime.UtcNow.AddDays(random.Next(15, 90)),
                Experience = LegacyAppCompatibility.BuildExperience(calculatedStrength, age, random.Next(0, 30)),
                Head = LegacyAppCompatibility.BuildHeadId(playerId),
                Body = LegacyAppCompatibility.BuildBodyId(playerId),
                Gloves = LegacyAppCompatibility.BuildGlovesId(playerId, position == "GK"),
                Shoes = LegacyAppCompatibility.BuildShoesId(playerId)
            });
        }

        return players;
    }
}
