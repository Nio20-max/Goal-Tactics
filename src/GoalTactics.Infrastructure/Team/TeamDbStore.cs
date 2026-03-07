using GoalTactics.Application.Team;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Stadium;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Team;

public sealed class TeamDbStore(
    GoalTacticsDbContext dbContext,
    StadiumEconomyService stadiumEconomy,
    TrainingProgressService trainingProgress,
    TeamStrengthCalculator strengthCalculator) : ITeamStore
{
    private const int FacilityMaxLevel = 20;
    private const int SeasonLengthDays = 30;
    private const int IndividualTrainingWeeklyStars = 1_000;

    public async Task<TeamRecord> GetOrCreateMyTeamAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (team is null)
        {
            var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken)
                ?? throw new InvalidOperationException("User not found for team initialization");

            team = new TeamEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = userId,
                Name = string.IsNullOrWhiteSpace(user.ManagerName) ? "My Team" : user.ManagerName,
                Country = "DE",
                CountryName = "Germany",
                LeagueName = "Amateur",
                MarketValue = 100000,
                Mood = 50,
                TeamMood = "Neutral",
                Wins = 0,
                Losses = 0,
                Fans = 100,
                Members = 100,
                Strength = 50,
                MatchTrend = "Stable"
            };
            dbContext.Teams.Add(team);

            dbContext.TeamResources.Add(new TeamResourcesEntity
            {
                TeamId = team.Id,
                Money = 50000,
                Medipacks = 3,
                GTStars = 0,
                LastEconomyTickUtc = DateTime.UtcNow,
                LastTrainingTickUtc = DateTime.UtcNow,
                ProgressDayCounter = 0
            });

            dbContext.TeamTrainingStates.Add(new TeamTrainingStateEntity
            {
                TeamId = team.Id,
                MainSkillIndex = 0,
                SubSkillIndex = 2,
                CampType = string.Empty,
                CampActiveUntilUtc = null
            });

            foreach (var player in BuildInitialPlayers(team.Id))
            {
                dbContext.TeamPlayers.Add(player);
            }

            dbContext.TeamNews.Add(new TeamNewsEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                TeamId = team.Id,
                DateText = DateTime.UtcNow.ToString("yyyy-MM-dd"),
                Title = "Welcome",
                Text = "Your club has been founded."
            });

            dbContext.TeamMail.Add(new TeamMailEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = userId,
                DateText = DateTime.UtcNow.ToString("yyyy-MM-dd"),
                Subject = "Welcome",
                Sender = "Board",
                Message = "Welcome to Goal Tactics.",
                IsNew = true,
                SenderType = 0
            });

            dbContext.TeamFinanceHistory.Add(new TeamFinanceHistoryEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = userId,
                Date = DateTime.UtcNow.Date,
                Income = 50000,
                Outcome = 0,
                Balance = 50000
            });

            await dbContext.SaveChangesAsync(cancellationToken);
        }

        var profile = await dbContext.Users.AsNoTracking().FirstAsync(x => x.Id == userId, cancellationToken);
        return ToRecord(team, profile.Email, profile.CreatedAtUtc, profile.LastActivityAtUtc);
    }

    public async Task<TeamRecord?> GetTeamByIdAsync(string teamId, CancellationToken cancellationToken = default)
    {
        var team = await dbContext.Teams.AsNoTracking().FirstOrDefaultAsync(x => x.Id == teamId, cancellationToken);
        if (team is null)
        {
            return null;
        }

        var user = await dbContext.Users.AsNoTracking().FirstAsync(x => x.Id == team.UserId, cancellationToken);
        return ToRecord(team, user.Email, user.CreatedAtUtc, user.LastActivityAtUtc);
    }

    public async Task<TeamResourcesRecord> GetTeamResourcesAsync(string teamId, CancellationToken cancellationToken = default)
    {
        await ApplyProgressionTicksAsync(teamId, cancellationToken);
        var resources = await dbContext.TeamResources.AsNoTracking().FirstAsync(x => x.TeamId == teamId, cancellationToken);
        return new TeamResourcesRecord(resources.Money, resources.Medipacks, resources.GTStars);
    }

    public async Task<IReadOnlyList<TeamNewsRecord>> GetTeamNewsAsync(string teamId, CancellationToken cancellationToken = default)
    {
        var items = await dbContext.TeamNews.AsNoTracking().Where(x => x.TeamId == teamId).OrderByDescending(x => x.DateText).ToListAsync(cancellationToken);
        return items.Select(x => new TeamNewsRecord(x.DateText, x.Title, x.Text)).ToArray();
    }

    public async Task<IReadOnlyList<TeamMailRecord>> GetMyMailAsync(string userId, CancellationToken cancellationToken = default)
    {
        var mails = await dbContext.TeamMail.AsNoTracking().Where(x => x.UserId == userId).OrderByDescending(x => x.DateText).ToListAsync(cancellationToken);
        return mails.Select(x => new TeamMailRecord(x.Id, x.DateText, x.Subject, x.Sender, x.Message, x.Extra, x.IsNew, x.SenderType)).ToArray();
    }

    public async Task MarkMailAsReadAsync(string userId, string mailId, CancellationToken cancellationToken = default)
    {
        var mail = await dbContext.TeamMail.FirstOrDefaultAsync(x => x.UserId == userId && x.Id == mailId, cancellationToken);
        if (mail is null)
        {
            return;
        }

        mail.IsNew = false;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task MarkAllMailAsReadAsync(string userId, CancellationToken cancellationToken = default)
    {
        var mails = await dbContext.TeamMail.Where(x => x.UserId == userId && x.IsNew).ToListAsync(cancellationToken);
        foreach (var mail in mails)
        {
            mail.IsNew = false;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task DeleteMailAsync(string userId, string mailId, CancellationToken cancellationToken = default)
    {
        var mail = await dbContext.TeamMail.FirstOrDefaultAsync(x => x.UserId == userId && x.Id == mailId, cancellationToken);
        if (mail is null)
        {
            return;
        }

        dbContext.TeamMail.Remove(mail);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task DeleteAllReadMailAsync(string userId, CancellationToken cancellationToken = default)
    {
        var mails = await dbContext.TeamMail.Where(x => x.UserId == userId && !x.IsNew).ToListAsync(cancellationToken);
        dbContext.TeamMail.RemoveRange(mails);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<FinanceHistoryRecord>> GetFinanceHistoryAsync(string userId, CancellationToken cancellationToken = default)
    {
        var rows = await dbContext.TeamFinanceHistory.AsNoTracking().Where(x => x.UserId == userId).OrderByDescending(x => x.Date).ToListAsync(cancellationToken);
        return rows.Select(x => new FinanceHistoryRecord(x.Date, x.Income, x.Outcome, x.Balance)).ToArray();
    }

    public async Task<FinancesRecord> GetFinancesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var history = await GetFinanceHistoryAsync(userId, cancellationToken);
        var today = history.FirstOrDefault();
        var yesterday = history.Skip(1).FirstOrDefault();

        var todays = today is null
            ? Array.Empty<FinanceEntryRecord>()
            : new[]
            {
                new FinanceEntryRecord("Income", today.Income, "Daily income", true),
                new FinanceEntryRecord("Outcome", today.Outcome, "Daily outcome", false)
            };

        var yesterdays = yesterday is null
            ? Array.Empty<FinanceEntryRecord>()
            : new[]
            {
                new FinanceEntryRecord("Income", yesterday.Income, "Daily income", true),
                new FinanceEntryRecord("Outcome", yesterday.Outcome, "Daily outcome", false)
            };

        return new FinancesRecord((int)(today?.Balance ?? 0), (int)(yesterday?.Balance ?? 0), todays, yesterdays);
    }

    public async Task<IReadOnlyList<AccomplishmentRecord>> GetAccomplishmentsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        return new[]
        {
            new AccomplishmentRecord($"Founder of {team.Name}", "founder")
        };
    }

    public async Task RenameTeamAsync(string userId, string teamId, string name, CancellationToken cancellationToken = default)
    {
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId && x.Id == teamId, cancellationToken);
        if (team is null)
        {
            return;
        }

        team.Name = name;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<StadiumStateRecord> GetStadiumStateAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);

        var teamEntity = await dbContext.Teams.AsNoTracking().FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        var resources = await dbContext.TeamResources.AsNoTracking().FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        var capacity = resources.StadiumVipSeats + resources.StadiumSitSeats + resources.StadiumStandSeats;

        var earningsAverage = resources.StadiumMatchesCount == 0
            ? 0
            : (int)Math.Round(resources.StadiumEarningsTotal / resources.StadiumMatchesCount);

        var visitorsAverage = resources.StadiumMatchesCount == 0
            ? 0
            : (long)Math.Round((decimal)resources.StadiumVisitorsTotal / resources.StadiumMatchesCount);

        return new StadiumStateRecord(
            teamEntity.StadiumName,
            teamEntity.GrassQuality,
            capacity,
            earningsAverage,
            resources.StadiumVisitorsLastMatch,
            visitorsAverage,
            resources.StadiumVisitorsTotal,
            resources.StadiumEarningsLastMatch,
            resources.StadiumEarningsTotal);
    }

    public async Task<IReadOnlyList<BuildPlaceRecord>> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var resources = await dbContext.TeamResources.AsNoTracking().FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);

        return
        [
            ToBuildPlace(StadiumBuildingCatalog.Office, "Office", resources.OfficeLevel, resources.OfficeLevel < FacilityMaxLevel),
            ToBuildPlace(StadiumBuildingCatalog.TrainingCenter, "TrainingCenter", resources.TrainingCenterLevel, CanUpgrade(resources.TrainingCenterLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.MedicalCenter, "MedicalCenter", resources.MedicalCenterLevel, CanUpgrade(resources.MedicalCenterLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.YouthAcademy, "YouthAcademy", resources.YouthAcademyLevel, CanUpgrade(resources.YouthAcademyLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.FanShop, "FanShop", resources.FanShopLevel, CanUpgrade(resources.FanShopLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.Parking, "Parking", resources.ParkingLevel, CanUpgrade(resources.ParkingLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.StadiumStands, "StadiumStands", resources.StadiumStandSeats, CanUpgradeStadium(resources, resources.OfficeLevel, StadiumBuildingCatalog.StadiumStands)),
            ToBuildPlace(StadiumBuildingCatalog.StadiumSeats, "StadiumSeats", resources.StadiumSitSeats, CanUpgradeStadium(resources, resources.OfficeLevel, StadiumBuildingCatalog.StadiumSeats)),
            ToBuildPlace(StadiumBuildingCatalog.StadiumVips, "StadiumVips", resources.StadiumVipSeats, CanUpgradeStadium(resources, resources.OfficeLevel, StadiumBuildingCatalog.StadiumVips))
        ];
    }

    public async Task<bool> BuildPlaceAsync(string userId, Guid placeId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var teamEntity = await dbContext.Teams.FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        var teamIdGuid = BuildDeterministicGuid(team.TeamId);

        if (placeId == StadiumBuildingCatalog.Office)
        {
            if (resources.OfficeLevel >= FacilityMaxLevel)
            {
                return false;
            }

            var cost = GetFacilityUpgradeCost(resources.OfficeLevel, teamIdGuid, 4_000m, 1_250m);
            if (resources.Money < cost)
            {
                return false;
            }

            resources.Money -= cost;
            resources.OfficeLevel++;
            await AddFinanceHistoryAsync(userId, income: 0m, outcome: cost, resources.Money, cancellationToken);
            await dbContext.SaveChangesAsync(cancellationToken);
            return true;
        }

        if (placeId == StadiumBuildingCatalog.StadiumVips || placeId == StadiumBuildingCatalog.StadiumSeats || placeId == StadiumBuildingCatalog.StadiumStands)
        {
            if (!CanUpgradeStadium(resources, resources.OfficeLevel, placeId))
            {
                return false;
            }

            var seatBlock = placeId == StadiumBuildingCatalog.StadiumVips ? 100 : (placeId == StadiumBuildingCatalog.StadiumSeats ? 1000 : 1500);
            var currentLevel = placeId == StadiumBuildingCatalog.StadiumVips
                ? resources.StadiumVipSeats / 100
                : (placeId == StadiumBuildingCatalog.StadiumSeats ? resources.StadiumSitSeats / 1000 : resources.StadiumStandSeats / 1500);

            var cost = GetFacilityUpgradeCost(currentLevel, teamIdGuid, 8_500m, 2_200m);
            if (resources.Money < cost)
            {
                return false;
            }

            resources.Money -= cost;
            if (placeId == StadiumBuildingCatalog.StadiumVips)
            {
                resources.StadiumVipSeats += seatBlock;
            }
            else if (placeId == StadiumBuildingCatalog.StadiumSeats)
            {
                resources.StadiumSitSeats += seatBlock;
            }
            else
            {
                resources.StadiumStandSeats += seatBlock;
            }

            await AddFinanceHistoryAsync(userId, income: 0m, outcome: cost, resources.Money, cancellationToken);
            await dbContext.SaveChangesAsync(cancellationToken);
            return true;
        }

        var result = placeId switch
        {
            _ when placeId == StadiumBuildingCatalog.TrainingCenter => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.TrainingCenterLevel, teamIdGuid),
            _ when placeId == StadiumBuildingCatalog.MedicalCenter => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.MedicalCenterLevel, teamIdGuid),
            _ when placeId == StadiumBuildingCatalog.YouthAcademy => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.YouthAcademyLevel, teamIdGuid),
            _ when placeId == StadiumBuildingCatalog.FanShop => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.FanShopLevel, teamIdGuid),
            _ when placeId == StadiumBuildingCatalog.Parking => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.ParkingLevel, teamIdGuid),
            _ => (Success: false, Cost: 0m, NewLevel: 0)
        };

        if (!result.Success)
        {
            return false;
        }

        if (resources.Money < result.Cost)
        {
            return false;
        }

        if (placeId == StadiumBuildingCatalog.TrainingCenter)
        {
            resources.TrainingCenterLevel = result.NewLevel;
        }
        else if (placeId == StadiumBuildingCatalog.MedicalCenter)
        {
            resources.MedicalCenterLevel = result.NewLevel;
        }
        else if (placeId == StadiumBuildingCatalog.YouthAcademy)
        {
            resources.YouthAcademyLevel = result.NewLevel;
        }
        else if (placeId == StadiumBuildingCatalog.FanShop)
        {
            resources.FanShopLevel = result.NewLevel;
        }
        else if (placeId == StadiumBuildingCatalog.Parking)
        {
            resources.ParkingLevel = result.NewLevel;
        }

        resources.Money -= result.Cost;
        await AddFinanceHistoryAsync(userId, income: 0m, outcome: result.Cost, resources.Money, cancellationToken);
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task RenewGrassAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var teamEntity = await dbContext.Teams.FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);

        var cost = 15_000m + (1_250m * Math.Max(0, 100 - teamEntity.GrassQuality) / 10m);
        if (resources.Money < cost)
        {
            return;
        }

        resources.Money -= cost;
        teamEntity.GrassQuality = 100;
        await AddFinanceHistoryAsync(userId, income: 0m, outcome: cost, resources.Money, cancellationToken);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task RenameStadiumAsync(string userId, string name, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var teamEntity = await dbContext.Teams.FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        teamEntity.StadiumName = string.IsNullOrWhiteSpace(name) ? "My Stadium" : name.Trim();
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<TeamTrainingStateRecord> GetTrainingStateAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);

        var resources = await dbContext.TeamResources.AsNoTracking().FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        var state = await EnsureTrainingStateAsync(team.TeamId, cancellationToken);
        var efficiency = trainingProgress.CalculateEfficiencyValue(resources.TrainingCenterLevel);
        var trainPrice = IndividualTrainingWeeklyStars;

        return new TeamTrainingStateRecord(
            state.MainSkillIndex,
            state.SubSkillIndex,
            GetEfficiencyText(efficiency),
            efficiency,
            trainPrice);
    }

    public async Task SaveTeamTrainingAsync(string userId, int mainSkillIndex, int subSkillIndex, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var state = await EnsureTrainingStateAsync(team.TeamId, cancellationToken);

        state.MainSkillIndex = Math.Clamp(mainSkillIndex, 0, 3);
        state.SubSkillIndex = Math.Clamp(subSkillIndex, 0, 9);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<bool> BookCampAsync(string userId, string campType, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        var state = await EnsureTrainingStateAsync(team.TeamId, cancellationToken);

        if (resources.Money >= 200_000m)
        {
            resources.Money -= 200_000m;
            await AddFinanceHistoryAsync(userId, income: 0m, outcome: 200_000m, resources.Money, cancellationToken);
        }
        else if (resources.GTStars >= 1_000m)
        {
            resources.GTStars -= 1_000m;
        }
        else
        {
            return false;
        }

        state.CampType = string.IsNullOrWhiteSpace(campType) ? "generic" : campType.Trim();
        state.CampActiveUntilUtc = DateTime.UtcNow.Date.AddDays(7);
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<IReadOnlyList<SquadPlayerRecord>> GetSquadPlayersAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);

        var players = await dbContext.TeamPlayers.AsNoTracking()
            .Where(x => x.TeamId == team.TeamId)
            .OrderBy(x => x.ShirtNumber)
            .ToListAsync(cancellationToken);

        return players.Select(MapPlayer).ToArray();
    }

    public async Task<SquadPlayerRecord?> GetSquadPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);

        var key = playerId.ToString("N");
        var player = await dbContext.TeamPlayers.AsNoTracking()
            .FirstOrDefaultAsync(x => x.TeamId == team.TeamId && x.Id == key, cancellationToken);

        return player is null ? null : MapPlayer(player);
    }

    public async Task<bool> SaveIndividualTrainingAsync(string userId, Guid playerId, string? skillType, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var player = await dbContext.TeamPlayers.FirstOrDefaultAsync(
            x => x.TeamId == team.TeamId && x.Id == playerId.ToString("N"),
            cancellationToken);

        if (player is null)
        {
            return false;
        }

        player.IndividualTrainingSkill = string.IsNullOrWhiteSpace(skillType) ? null : skillType.Trim();
        player.IndividualTrainingUntilUtc = player.IndividualTrainingSkill is null
            ? null
            : DateTime.UtcNow.Date.AddDays(7);

        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<int> RenewIndividualTrainingAsync(string userId, Guid? playerId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);

        var query = dbContext.TeamPlayers.Where(x => x.TeamId == team.TeamId && x.IndividualTrainingSkill != null);
        if (playerId.HasValue)
        {
            var key = playerId.Value.ToString("N");
            query = query.Where(x => x.Id == key);
        }

        var players = await query.ToListAsync(cancellationToken);
        if (players.Count == 0)
        {
            return 0;
        }

        var cost = players.Count * IndividualTrainingWeeklyStars;
        if (resources.GTStars < cost)
        {
            return 0;
        }

        resources.GTStars -= cost;
        var until = DateTime.UtcNow.Date.AddDays(7);
        foreach (var player in players)
        {
            player.IndividualTrainingUntilUtc = until;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
        return players.Count;
    }

    public async Task<bool> UpdatePlayerNameAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default)
    {
        var sanitized = string.IsNullOrWhiteSpace(value) ? string.Empty : value.Trim();
        if (sanitized.Length > 64)
        {
            sanitized = sanitized[..64];
        }

        return await UpdatePlayerAsync(userId, playerId, player =>
        {
            if (string.IsNullOrWhiteSpace(sanitized))
            {
                return false;
            }

            player.Name = sanitized;
            return true;
        }, cancellationToken);
    }

    public async Task<bool> UpdatePlayerOriginAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default)
    {
        var sanitized = string.IsNullOrWhiteSpace(value) ? string.Empty : value.Trim().ToUpperInvariant();
        if (sanitized.Length > 8)
        {
            sanitized = sanitized[..8];
        }

        return await UpdatePlayerAsync(userId, playerId, player =>
        {
            if (string.IsNullOrWhiteSpace(sanitized))
            {
                return false;
            }

            player.Origin = sanitized;
            return true;
        }, cancellationToken);
    }

    public Task<bool> UpdatePlayerShirtAsync(string userId, Guid playerId, int shirtNumber, CancellationToken cancellationToken = default)
    {
        var safeNumber = Math.Clamp(shirtNumber, 1, 99);
        return UpdatePlayerAsync(userId, playerId, player =>
        {
            player.ShirtNumber = safeNumber;
            return true;
        }, cancellationToken);
    }

    private async Task<bool> UpdatePlayerAsync(string userId, Guid playerId, Func<TeamPlayerEntity, bool> mutate, CancellationToken cancellationToken)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var player = await dbContext.TeamPlayers.FirstOrDefaultAsync(
            x => x.TeamId == team.TeamId && x.Id == playerId.ToString("N"),
            cancellationToken);

        if (player is null)
        {
            return false;
        }

        if (!mutate(player))
        {
            return false;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    private async Task ApplyProgressionTicksAsync(string teamId, CancellationToken cancellationToken)
    {
        var now = DateTime.UtcNow;

        var team = await dbContext.Teams.FirstAsync(x => x.Id == teamId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == teamId, cancellationToken);
        var training = await EnsureTrainingStateAsync(teamId, cancellationToken);
        var players = await dbContext.TeamPlayers.Where(x => x.TeamId == teamId).ToListAsync(cancellationToken);
        if (players.Count == 0)
        {
            foreach (var player in BuildInitialPlayers(teamId))
            {
                dbContext.TeamPlayers.Add(player);
                players.Add(player);
            }
        }

        var economyDays = FullDaysElapsed(resources.LastEconomyTickUtc, now);
        if (economyDays > 0)
        {
            var totalIncome = 0m;
            for (var i = 0; i < economyDays; i++)
            {
                var economy = stadiumEconomy.CalculateMatchday(
                    team.LeagueTier,
                    team.Wins,
                    team.Losses,
                    resources.StadiumVipSeats,
                    resources.StadiumSitSeats,
                    resources.StadiumStandSeats,
                    resources.FanShopLevel,
                    resources.ParkingLevel,
                    resources.OfficeLevel);

                resources.StadiumVisitorsLastMatch = economy.Visitors;
                resources.StadiumVisitorsTotal += economy.Visitors;
                resources.StadiumEarningsLastMatch = economy.Earnings;
                resources.StadiumEarningsTotal += economy.Earnings;
                resources.StadiumMatchesCount++;
                resources.Money += economy.Earnings;
                totalIncome += economy.Earnings;

                // Grass degrades slowly with usage and should be renewed periodically.
                team.GrassQuality = Math.Max(45, team.GrassQuality - 1);
            }

            AddFinanceHistoryForTeam(team.UserId, totalIncome, 0m, resources.Money);
            resources.LastEconomyTickUtc = now.Date;
        }

        var trainingDays = FullDaysElapsed(resources.LastTrainingTickUtc, now);
        if (trainingDays > 0)
        {
            for (var i = 0; i < trainingDays; i++)
            {
                var tickDate = now.Date.AddDays(-trainingDays + i + 1);
                ApplyDailyTrainingTick(players, resources, training, tickDate);
                resources.ProgressDayCounter++;

                if (resources.ProgressDayCounter >= SeasonLengthDays)
                {
                    resources.ProgressDayCounter -= SeasonLengthDays;
                    foreach (var player in players)
                    {
                        player.Age++;
                    }
                }
            }

            resources.LastTrainingTickUtc = now.Date;
            team.Strength = RecalculateTeamStrength(players);
        }

        if (economyDays > 0 || trainingDays > 0)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    private void ApplyDailyTrainingTick(
        IReadOnlyList<TeamPlayerEntity> players,
        TeamResourcesEntity resources,
        TeamTrainingStateEntity training,
        DateTime tickDate)
    {
        var hasCamp = training.CampActiveUntilUtc.HasValue && training.CampActiveUntilUtc.Value.Date >= tickDate.Date;

        foreach (var player in players)
        {
            var individualActive =
                !string.IsNullOrWhiteSpace(player.IndividualTrainingSkill)
                && player.IndividualTrainingUntilUtc.HasValue
                && player.IndividualTrainingUntilUtc.Value.Date >= tickDate.Date;

            var gain = trainingProgress.CalculateDailyTotalGain(
                player.Age,
                player.Talent,
                player.Fitness,
                resources.TrainingCenterLevel,
                individualActive,
                hasCamp);

            player.Strength = Math.Min(700m, player.Strength + gain);

            // Fitness climbs over time; at training center level 20, daily gain reaches +4.
            var fitnessGain = Math.Max(1, (int)Math.Round(resources.TrainingCenterLevel / 5.0, MidpointRounding.AwayFromZero));
            player.Fitness = Math.Min(100, player.Fitness + fitnessGain);
        }
    }

    private int RecalculateTeamStrength(IReadOnlyList<TeamPlayerEntity> players)
    {
        if (players.Count == 0)
        {
            return 1;
        }

        var baseStrength = (int)Math.Round(players.Average(x => x.Strength));
        var fitnessAverage = (int)Math.Round(players.Average(x => x.Fitness));
        return strengthCalculator.Calculate(baseStrength, tacticBonus: 0, fitnessAverage);
    }

    private async Task<TeamTrainingStateEntity> EnsureTrainingStateAsync(string teamId, CancellationToken cancellationToken)
    {
        var state = await dbContext.TeamTrainingStates.FirstOrDefaultAsync(x => x.TeamId == teamId, cancellationToken);
        if (state is not null)
        {
            return state;
        }

        state = new TeamTrainingStateEntity
        {
            TeamId = teamId,
            MainSkillIndex = 0,
            SubSkillIndex = 2,
            CampType = string.Empty
        };

        dbContext.TeamTrainingStates.Add(state);
        await dbContext.SaveChangesAsync(cancellationToken);
        return state;
    }

    private Task AddFinanceHistoryAsync(string userId, decimal income, decimal outcome, decimal balance, CancellationToken cancellationToken)
    {
        AddFinanceHistoryForTeam(userId, income, outcome, balance);
        return Task.CompletedTask;
    }

    private void AddFinanceHistoryForTeam(string userId, decimal income, decimal outcome, decimal balance)
    {
        dbContext.TeamFinanceHistory.Add(new TeamFinanceHistoryEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            UserId = userId,
            Date = DateTime.UtcNow.Date,
            Income = income,
            Outcome = outcome,
            Balance = balance
        });
    }

    private static int FullDaysElapsed(DateTime? fromUtc, DateTime nowUtc)
    {
        if (!fromUtc.HasValue)
        {
            return 0;
        }

        var days = (int)(nowUtc.Date - fromUtc.Value.Date).TotalDays;
        return Math.Max(0, days);
    }

    private static Guid BuildDeterministicGuid(string teamId)
    {
        Span<byte> bytes = stackalloc byte[16];
        var hash = teamId.GetHashCode(StringComparison.Ordinal);
        BitConverter.TryWriteBytes(bytes[..4], hash);
        BitConverter.TryWriteBytes(bytes[4..8], hash ^ 0x5a5a5a5a);
        BitConverter.TryWriteBytes(bytes[8..12], hash ^ 0xa5a5a5a5);
        BitConverter.TryWriteBytes(bytes[12..16], hash ^ unchecked((int)0xdeadc0de));
        return new Guid(bytes);
    }

    private static decimal GetFacilityUpgradeCost(int currentLevel, Guid seed, decimal baseCost, decimal growth)
    {
        var randomizer = Math.Abs(HashCode.Combine(seed, currentLevel)) % 7;
        return Math.Round(baseCost + (growth * currentLevel * currentLevel) + (randomizer * 150m), 0);
    }

    private static bool CanUpgrade(int level, int officeLevel)
    {
        if (level >= FacilityMaxLevel)
        {
            return false;
        }

        // Decompiled clue: requiredOfficeLevel = building.Level + 1.
        return officeLevel >= (level + 1);
    }

    private static bool CanUpgradeStadium(TeamResourcesEntity resources, int officeLevel, Guid placeId)
    {
        if (officeLevel < 1)
        {
            return false;
        }

        return placeId switch
        {
            _ when placeId == StadiumBuildingCatalog.StadiumVips => resources.StadiumVipSeats < (officeLevel * 140),
            _ when placeId == StadiumBuildingCatalog.StadiumSeats => resources.StadiumSitSeats < (officeLevel * 1750),
            _ when placeId == StadiumBuildingCatalog.StadiumStands => true,
            _ => false
        };
    }

    private static (bool Success, decimal Cost, int NewLevel) TryUpgradeFacility(
        TeamResourcesEntity resources,
        int officeLevel,
        Func<TeamResourcesEntity, int> getter,
        Guid seed)
    {
        var level = getter(resources);
        if (!CanUpgrade(level, officeLevel))
        {
            return (false, 0m, level);
        }

        var cost = GetFacilityUpgradeCost(level, seed, 12_000m, 2_400m);
        return (true, cost, level + 1);
    }

    private static IReadOnlyList<TeamPlayerEntity> BuildInitialPlayers(string teamId)
    {
        var seed = HashCode.Combine(teamId, "squad-seed");
        var random = new Random(seed);
        var positions = new[] { "GK", "DEF", "DEF", "DEF", "DEF", "MID", "MID", "MID", "FWD", "FWD", "FWD", "DEF", "MID", "FWD", "GK", "MID" };

        var result = new List<TeamPlayerEntity>(positions.Length);
        for (var i = 0; i < positions.Length; i++)
        {
            var age = random.Next(16, 33);
            var talent = random.Next(1, 11);
            var fitness = random.Next(82, 99);
            var strength = Math.Clamp(60m + random.Next(-5, 11) + (talent >= 9 ? random.Next(0, 8) : 0), 50m, 90m);

            result.Add(new TeamPlayerEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                TeamId = teamId,
                Name = $"Player {i + 1}",
                Origin = "DE",
                Position = positions[i],
                ShirtNumber = i + 1,
                Age = age,
                Talent = talent,
                Strength = strength,
                Fitness = fitness
            });
        }

        return result;
    }

    private static SquadPlayerRecord MapPlayer(TeamPlayerEntity player)
    {
        return new SquadPlayerRecord(
            Guid.TryParse(player.Id, out var id) ? id : Guid.Empty,
            player.Name,
            player.Origin,
            player.Position,
            player.ShirtNumber,
            player.Age,
            player.Talent,
            (int)Math.Round(player.Strength),
            player.Fitness,
            player.Matches,
            player.Goals,
            player.YellowCards,
            player.RedCards,
            player.IndividualTrainingSkill,
            player.IndividualTrainingUntilUtc);
    }

    private static BuildPlaceRecord ToBuildPlace(Guid id, string type, int level, bool canBuild)
    {
        return new BuildPlaceRecord(id, type, level, canBuild);
    }

    private static string GetEfficiencyText(int value)
    {
        return value switch
        {
            >= 90 => "Excellent",
            >= 75 => "Very good",
            >= 60 => "Good",
            >= 45 => "Average",
            _ => "Weak"
        };
    }

    private static TeamRecord ToRecord(TeamEntity team, string userEmail, DateTime userCreatedAtUtc, DateTime? userLastActivityAtUtc)
    {
        return new TeamRecord(
            team.Id,
            team.UserId,
            team.Name,
            team.Country,
            team.CountryName,
            team.LeagueName,
            team.MarketValue,
            team.Mood,
            team.TeamMood,
            team.Wins,
            team.Losses,
            team.Fans,
            team.Members,
            team.Strength,
            team.MatchTrend,
            userEmail,
            userCreatedAtUtc,
            userLastActivityAtUtc);
    }
}
