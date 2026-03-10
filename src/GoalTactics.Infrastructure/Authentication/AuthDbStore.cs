using GoalTactics.Application.Auth;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace GoalTactics.Infrastructure.Authentication;

public sealed class AuthDbStore(GoalTacticsDbContext dbContext) : IAuthStore
{
    private const int ClubsPerLeague = 16;
    private static readonly IReadOnlyDictionary<int, int> LeagueGroupsPerTier = new Dictionary<int, int>
    {
        [1] = 1,
        [2] = 5,
        [3] = 15,
        [4] = 45
    };

    public async Task<AuthUserRecord?> GetUserByEmailAsync(string email, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Email == email, cancellationToken);
        return user is null
            ? null
            : new AuthUserRecord(user.Id, user.Email, user.PasswordHash, user.ManagerName);
    }

    public async Task<AuthUserRecord?> GetUserByIdAsync(string userId, CancellationToken cancellationToken = default)
    {
        var user = await dbContext.Users.AsNoTracking().FirstOrDefaultAsync(x => x.Id == userId, cancellationToken);
        return user is null
            ? null
            : new AuthUserRecord(user.Id, user.Email, user.PasswordHash, user.ManagerName);
    }

    public async Task<bool> IsManagerNameTakenAsync(string managerName, CancellationToken cancellationToken = default)
    {
        return await dbContext.Users.AnyAsync(x => x.ManagerName == managerName, cancellationToken);
    }

    public async Task<bool> AddUserAsync(AuthUserRecord user, CancellationToken cancellationToken = default)
    {
        var exists = await dbContext.Users.AnyAsync(x => x.Email == user.Email, cancellationToken);
        if (exists)
        {
            return false;
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
        await AssignUserToThirdLeagueBotTeamAsync(user.UserId, cancellationToken);

        await tx.CommitAsync(cancellationToken);
        return true;
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
            DeviceId = session.DeviceId
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

    private async Task EnsureLeaguePyramidSeededAsync(CancellationToken cancellationToken)
    {
        foreach (var tierEntry in LeagueGroupsPerTier)
        {
            var tier = tierEntry.Key;
            var groups = tierEntry.Value;

            for (var groupNumber = 1; groupNumber <= groups; groupNumber++)
            {
                var league = await dbContext.Leagues.FirstOrDefaultAsync(
                    x => x.Tier == tier && x.GroupNumber == groupNumber,
                    cancellationToken);

                if (league is null)
                {
                    league = new LeagueEntity
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
                }
                else
                {
                    league.Name = BuildLeagueName(tier, groupNumber);
                    league.Mount = GetMountForTier(tier);
                    league.Dismount = GetDismountForTier(tier);
                    await dbContext.SaveChangesAsync(cancellationToken);
                }

                var existingSlots = await dbContext.LeagueTeams
                    .Where(x => x.LeagueId == league.Id)
                    .OrderBy(x => x.Id)
                    .ToListAsync(cancellationToken);

                for (var slotIndex = existingSlots.Count + 1; slotIndex <= ClubsPerLeague; slotIndex++)
                {
                    await CreateBotLeagueSlotAsync(league, slotIndex, cancellationToken);
                }
            }
        }
    }

    private async Task CreateBotLeagueSlotAsync(LeagueEntity league, int slotIndex, CancellationToken cancellationToken)
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
            MainSkillIndex = random.Next(0, 5),
            SubSkillIndex = random.Next(0, 5),
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
            Logo = "logo_bot",
            IsOnline = false,
            MatchesHome = 15,
            MatchesAway = 15,
            WinsHome = random.Next(0, 8),
            WinsAway = random.Next(0, 8),
            LossesHome = random.Next(0, 8),
            LossesAway = random.Next(0, 8),
            DrawsHome = random.Next(0, 8),
            DrawsAway = random.Next(0, 8),
            GoalsScoredHome = random.Next(10, 40),
            GoalsScoredAway = random.Next(8, 36),
            GoalsReceivedHome = random.Next(8, 36),
            GoalsReceivedAway = random.Next(8, 36),
            PointsHome = random.Next(0, 45),
            PointsAway = random.Next(0, 45)
        });

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private async Task AssignUserToThirdLeagueBotTeamAsync(string userId, CancellationToken cancellationToken)
    {
        var existingTeam = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (existingTeam is not null)
        {
            return;
        }

        var targetSlot = await dbContext.LeagueTeams
            .Join(dbContext.Leagues, lt => lt.LeagueId, l => l.Id, (lt, l) => new { Slot = lt, League = l })
            .Where(x => x.League.Tier == 3 && x.Slot.IsBot && x.Slot.TeamId != null)
            .OrderBy(x => x.League.GroupNumber)
            .ThenBy(x => x.Slot.TeamName)
            .FirstOrDefaultAsync(cancellationToken);

        if (targetSlot is null)
        {
            targetSlot = await dbContext.LeagueTeams
                .Join(dbContext.Leagues, lt => lt.LeagueId, l => l.Id, (lt, l) => new { Slot = lt, League = l })
                .Where(x => x.Slot.IsBot && x.Slot.TeamId != null)
                .OrderBy(x => x.League.Tier)
                .ThenBy(x => x.League.GroupNumber)
                .ThenBy(x => x.Slot.TeamName)
                .FirstOrDefaultAsync(cancellationToken);
        }

        if (targetSlot is null || string.IsNullOrWhiteSpace(targetSlot.Slot.TeamId))
        {
            return;
        }

        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.Id == targetSlot.Slot.TeamId, cancellationToken);
        if (team is null)
        {
            return;
        }

        var previousBotUserId = team.UserId;

        team.UserId = userId;
        team.LeagueName = targetSlot.League.Name;
        team.LeagueTier = targetSlot.League.Tier;
        team.StadiumName = "My Stadium";
        team.GrassQuality = 80;

        var resources = await dbContext.TeamResources.FirstOrDefaultAsync(x => x.TeamId == team.Id, cancellationToken);
        if (resources is not null)
        {
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
        }

        targetSlot.Slot.IsBot = false;
        targetSlot.Slot.IsOnline = true;
        targetSlot.Slot.TeamName = team.Name;
        targetSlot.Slot.Strength = team.Strength;
        targetSlot.Slot.Country = team.Country;
        targetSlot.Slot.Logo = "logo_default";

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
            1 => 0,
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
            1 => 5,
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
        var players = new List<TeamPlayerEntity>(16);
        var positions = new[] { "GK", "DEF", "DEF", "DEF", "DEF", "MID", "MID", "MID", "MID", "FWD", "FWD", "MID", "DEF", "MID", "FWD", "DEF" };

        for (var i = 0; i < positions.Length; i++)
        {
            players.Add(new TeamPlayerEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                TeamId = teamId,
                Name = $"Bot Player {i + 1}",
                Origin = "DE",
                Position = positions[i],
                ShirtNumber = i + 1,
                Age = random.Next(18, 34),
                Talent = random.Next(40, 95),
                Strength = random.Next(35, 85),
                Fitness = random.Next(70, 101),
                Matches = random.Next(0, 30),
                Goals = positions[i] == "FWD" ? random.Next(0, 20) : random.Next(0, 6),
                YellowCards = random.Next(0, 6),
                RedCards = random.Next(0, 2)
            });
        }

        return players;
    }
}
