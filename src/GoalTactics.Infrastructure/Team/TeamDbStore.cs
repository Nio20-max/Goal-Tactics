using GoalTactics.Application.Team;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Stadium;
using GoalTactics.Application.Common;
using GoalTactics.Application.League;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace GoalTactics.Infrastructure.Team;

public sealed class TeamDbStore(
    GoalTacticsDbContext dbContext,
    StadiumEconomyService stadiumEconomy,
    TrainingProgressService trainingProgress,
    TeamStrengthCalculator strengthCalculator,
    IConfiguration configuration,
    ILeagueStore leagueStore) : ITeamStore
{
    private readonly IConfiguration _configuration = configuration;
    private readonly ILeagueStore _leagueStore = leagueStore;

    private const int FacilityMaxLevel = 20;
    private const int SeasonLengthDays = 30;
    private const int IndividualTrainingWeeklyStars = 1_000;
    private const int DailyMainSponsorStars = 300;
    private const int DailySecondarySponsorStars = 200;
    private const int TransferBidStarsCost = 200;
    private const int StartingMoney = 10_000_000;
    private const int StartingGtStars = 5_000;

    private const int TeamsPerLeague = 16;
    private static readonly string DefaultShirt = EquipmentCatalog.Shirts[0];
    private static readonly string DefaultEmblem = EquipmentCatalog.Emblems[0];
    private static readonly string[] InitialSquadPositions = ["GK", "GK", "DEF", "DEF", "DEF", "DEF", "DEF", "DEF", "MID", "MID", "MID", "MID", "MID", "MID", "FWD", "FWD", "FWD", "FWD"];
    private static readonly string[] FirstNames = [
        "Ehrmut", "Dragoljub", "Manuel", "Hendrik", "Calvin", "Nikolai", "Lukas", "Jonas", "David", "Mika",
        "Tobias", "Felix", "Marco", "Adrian", "Dominik", "Sebastian", "Florian", "Jan", "Leon", "Patrick",
        "Simon", "Konrad", "Maximilian", "Philipp", "Julian", "Vincent", "Benjamin", "Moritz", "Fabian", "Nico",
        "Samuel", "Luis", "Tom", "Mats", "Noah", "Finn", "Robin", "Pascal", "Levi", "Henrik",
        "Malte", "Marius", "Dennis", "Jannik", "Oliver", "Anton", "Phil", "Alex", "Oliver", "Timo",
        "Matteo", "Lennard", "Jonas", "Kai", "Nils", "Julius", "Jannik", "Robin", "Jonas", "Luca",
        "Simon", "Mika", "Louis", "Fabio", "Emil", "Fabian", "Elias", "Janik", "Sven", "Philipp",
        "Niklas", "Tobias", "Alexander", "Johannes", "Lennart", "Sören", "Dennis", "Alexander", "Lars", "Jakob",
        "Rune", "Milan", "Rafael", "Victor", "Samuel", "Lukas", "Noah", "Finn", "Mats", "Tom"
    ];
    private static readonly string[] LastNames = [
        "Hoschatt", "Kumer", "Neuer", "Haintzl", "Johnston", "Pfalz-Sulzbach", "Morante", "Raizgys", "Schneider", "Vogel",
        "Mertens", "Lindner", "Baumann", "Reiter", "Hartmann", "Keller", "Schuster", "Brandt", "Scholz", "Bergmann",
        "Fischer", "Müller", "Schulz", "Weber", "Meier", "Wagner", "Becker", "Hoffmann", "Schäfer", "Koch",
        "Richter", "Klein", "Wolf", "Schröder", "Neumann", "Schmitt", "Zimmermann", "Jäger", "Kaiser", "Schwarz",
        "Braun", "Krüger", "Hofmann", "Walter", "Kühne", "Lange", "Schubert", "Simon", "Bauer", "König",
        "Busch", "Schmitt", "Friedrich", "Köhler", "Bauer", "Peters", "Meyer", "Schneider", "Weiss", "Graf",
        "Köhler", "Brand", "Stein", "Vogel", "Hahn", "Krause", "Roth", "Schreiber", "Winter", "Winkler",
        "Frank", "Voigt", "Graf", "Horn", "Fuchs", "Pohl", "Paul", "Schreiber", "Heinrich", "Bolz",
        "Ludwig", "Schiller", "Baumann", "Ulrich", "Döring", "Bremer", "Buchholz", "Dietrich", "Schindler", "Mayr"
    ];
    private static readonly string[] Origins = ["Deutschland", "\u00d6sterreich", "Schweiz", "Slowenien", "Irland", "Litauen", "Frankreich", "Spanien", "Italien", "Niederlande", "Belgien", "Portugal", "Schweden", "Brasilien", "Argentinien"];

    public async Task<TeamRecord> GetOrCreateMyTeamAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (team is null)
        {
            var now = DateTime.UtcNow;
            var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken)
                ?? throw new InvalidOperationException("User not found for team initialization");

            team = new TeamEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = userId,
                Name = string.IsNullOrWhiteSpace(user.ManagerName) ? "My Team" : user.ManagerName,
                Country = "DE",
                CountryName = "Deutschland",
                LeagueName = "Amateur",
                MarketValue = 100000,
                Mood = 50,
                TeamMood = "Neutral",
                Wins = 0,
                Losses = 0,
                Fans = 100,
                Members = 100,
                Strength = 50,
                MatchTrend = "Stable",
                SelectedShirt = DefaultShirt,
                SelectedEmblem = DefaultEmblem
            };
            dbContext.Teams.Add(team);

            dbContext.TeamEquipment.Add(new TeamEquipmentEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = userId,
                Image = DefaultShirt,
                EquipmentType = "shirt",
                IsActive = true
            });

            dbContext.TeamEquipment.Add(new TeamEquipmentEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = userId,
                Image = DefaultEmblem,
                EquipmentType = "emblem",
                IsActive = true
            });

            dbContext.TeamResources.Add(new TeamResourcesEntity
            {
                TeamId = team.Id,
                Money = StartingMoney,
                Medipacks = 3,
                GTStars = StartingGtStars,
                LastEconomyTickUtc = now,
                LastTrainingTickUtc = now,
                LastSponsorPayoutUtc = now.Date,
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

            var initialPlayers = BuildInitialPlayers(team.Id);
            foreach (var player in initialPlayers)
            {
                dbContext.TeamPlayers.Add(player);
            }

            team.Strength = RecalculateTeamStrength(initialPlayers);
            team.MarketValue = RecalculateTeamMarketValue(initialPlayers);

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

            // Give new accounts a starting set of skill cards.
            foreach (var card in BuildInitialSkillCards(team.Id))
            {
                dbContext.TeamSkillCards.Add(new TeamSkillCardEntity
                {
                    Id = Guid.NewGuid().ToString("N"),
                    TeamId = team.Id,
                    Skill = card.Skill,
                    Rarity = card.Rarity,
                    Count = card.Count,
                    Bonus = card.Bonus
                });
            }

            await dbContext.SaveChangesAsync(cancellationToken);
        }

        await EnsureDefaultEquipmentStateAsync(team, cancellationToken);

        var profile = await dbContext.Users.AsNoTracking().FirstAsync(x => x.Id == userId, cancellationToken);
        return ToRecord(team, profile.ManagerName, profile.Email, profile.CreatedAtUtc, profile.LastActivityAtUtc);
    }

    public async Task<TeamRecord?> GetTeamByIdAsync(string teamId, CancellationToken cancellationToken = default)
    {
        var team = await dbContext.Teams.AsNoTracking().FirstOrDefaultAsync(x => x.Id == teamId, cancellationToken);
        if (team is null)
        {
            return null;
        }

        var user = await dbContext.Users.AsNoTracking().FirstAsync(x => x.Id == team.UserId, cancellationToken);
        return ToRecord(team, user.ManagerName, user.Email, user.CreatedAtUtc, user.LastActivityAtUtc);
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
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);

        // Find the latest 2 matchdays that have ledger entries
        var recentMatchdays = await dbContext.TeamFinanceLedger.AsNoTracking()
            .Where(x => x.UserId == userId)
            .Select(x => x.Matchday)
            .Distinct()
            .OrderByDescending(x => x)
            .Take(2)
            .ToListAsync(cancellationToken);

        var todayMatchday = recentMatchdays.Count > 0 ? recentMatchdays[0] : 0;
        var yesterdayMatchday = recentMatchdays.Count > 1 ? recentMatchdays[1] : 0;

        var ledger = recentMatchdays.Count > 0
            ? await dbContext.TeamFinanceLedger.AsNoTracking()
                .Where(x => x.UserId == userId && (x.Matchday == todayMatchday || x.Matchday == yesterdayMatchday))
                .ToListAsync(cancellationToken)
            : [];

        var todays = ledger.Where(x => x.Matchday == todayMatchday)
            .Select(x => new FinanceEntryRecord(x.BookingType, x.Value, x.Description, x.IsEarning))
            .ToArray();

        var yesterdays = ledger.Where(x => x.Matchday == yesterdayMatchday && yesterdayMatchday != todayMatchday)
            .Select(x => new FinanceEntryRecord(x.BookingType, x.Value, x.Description, x.IsEarning))
            .ToArray();

        return new FinancesRecord(todayMatchday, yesterdayMatchday, todays, yesterdays);
    }

    public async Task<IReadOnlyList<AccomplishmentRecord>> GetAccomplishmentsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var items = await dbContext.TeamAccomplishments.AsNoTracking()
            .Where(x => x.TeamId == team.TeamId)
            .OrderByDescending(x => x.CreatedAtUtc)
            .ToListAsync(cancellationToken);

        var records = items.Select(x => new AccomplishmentRecord(x.Name, x.Image)).ToList();
        // Always include the founder accomplishment as a fallback/first item
        records.Insert(0, new AccomplishmentRecord($"Gründer\0{team.Name}", "founder"));
        return records;
    }

    public async Task AddAccomplishmentAsync(string userId, string name, string image, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        // avoid duplicates of identical name for this team
        var exists = await dbContext.TeamAccomplishments.AnyAsync(x => x.TeamId == team.TeamId && x.Name == name, cancellationToken);
        if (exists)
        {
            return;
        }

        var entity = new TeamAccomplishmentEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            TeamId = team.TeamId,
            Name = name,
            Image = image,
            CreatedAtUtc = DateTime.UtcNow
        };

        dbContext.Add(entity);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<SeasonInfoRecord> GetSeasonInfoAsync(CancellationToken cancellationToken = default)
    {
        var seasonLengthDays = int.TryParse(_configuration["App:SeasonLengthDays"], out var d) ? d : SeasonLengthDays;

        var state = await dbContext.SeasonStates.FirstOrDefaultAsync(cancellationToken);
        DateTime startDate;

        if (state?.StartedAtUtc is not null)
        {
            startDate = state.StartedAtUtc.Value;
        }
        else
        {
            // Fresh database — season starts now
            startDate = DateTime.UtcNow;
        }

        var elapsed = Math.Max(0, (DateTime.UtcNow - startDate).TotalDays);
        var currentSeason = (int)(elapsed / seasonLengthDays) + 1;
        var daysIntoSeason = (int)(elapsed % seasonLengthDays);
        var matchday = daysIntoSeason + 1;
        var daysLeft = seasonLengthDays - daysIntoSeason;

        return new SeasonInfoRecord(currentSeason, matchday, daysLeft, startDate);
    }

    private async Task<int> ComputeCurrentSeasonNumberAsync(CancellationToken cancellationToken)
    {
        var info = await GetSeasonInfoAsync(cancellationToken);
        return info.SeasonNumber;
    }

    private async Task EnsureSeasonTransitionAsync(CancellationToken cancellationToken)
    {
        var state = await dbContext.SeasonStates.FirstOrDefaultAsync(cancellationToken);
        if (state is null)
        {
            // Fresh database: initialise to season 1, matchday 1 starting now
            state = new SeasonStateEntity
            {
                Id = "singleton",
                LastSeasonProcessed = 1,
                SeasonNumber = 1,
                CurrentMatchday = 1,
                StartedAtUtc = DateTime.UtcNow
            };
            dbContext.SeasonStates.Add(state);
            await dbContext.SaveChangesAsync(cancellationToken);
            return; // Nothing to transition on a brand-new database
        }

        var currentSeason = await ComputeCurrentSeasonNumberAsync(cancellationToken);

        if (state.LastSeasonProcessed >= currentSeason)
        {
            return;
        }

        await ProcessSeasonEnd(currentSeason, cancellationToken);
        state.LastSeasonProcessed = currentSeason;
        state.SeasonNumber = currentSeason;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private async Task ProcessSeasonEnd(int seasonNumber, CancellationToken cancellationToken)
    {
        // find all leagues with actual team memberships
        var leagueIds = await dbContext.LeagueTeams
            .Where(x => x.TeamId != null)
            .Select(x => x.LeagueId)
            .Distinct()
            .ToListAsync(cancellationToken);

        foreach (var leagueId in leagueIds)
        {
            var league = await dbContext.Leagues.FirstOrDefaultAsync(x => x.Id == leagueId, cancellationToken);
            if (league is null)
            {
                continue;
            }

            var teams = await dbContext.LeagueTeams
                .Where(x => x.LeagueId == leagueId && x.TeamId != null)
                .ToListAsync(cancellationToken);

            // determine champion
            var championEntry = teams
                .OrderByDescending(x => x.PointsHome + x.PointsAway)
                .ThenByDescending(x => (x.GoalsScoredHome + x.GoalsScoredAway) - (x.GoalsReceivedHome + x.GoalsReceivedAway))
                .ThenByDescending(x => x.GoalsScoredHome + x.GoalsScoredAway)
                .ThenBy(x => x.TeamName)
                .FirstOrDefault();

            if (championEntry?.TeamId != null)
            {
                var championTeam = await dbContext.Teams.FirstOrDefaultAsync(x => x.Id == championEntry.TeamId, cancellationToken);
                if (championTeam != null)
                {
                    await AddAccomplishmentAsync(championTeam.UserId,
                        $"Meisterschaft\0{league.Name}\0Saison #{seasonNumber}",
                        "04.png",
                        cancellationToken);
                }
            }

            // top scorer in league
            var leagueTeamIds = teams.Select(x => x.TeamId!).ToList();
            var topScorer = await dbContext.TeamPlayers
                .Where(p => leagueTeamIds.Contains(p.TeamId))
                .OrderByDescending(p => p.Goals)
                .FirstOrDefaultAsync(cancellationToken);

            if (topScorer != null && leagueTeamIds.Contains(topScorer.TeamId))
            {
                var owningTeam = await dbContext.Teams.FirstOrDefaultAsync(x => x.Id == topScorer.TeamId, cancellationToken);
                if (owningTeam != null)
                {
                    await AddAccomplishmentAsync(owningTeam.UserId,
                        $"Torschützenkönig\0{topScorer.Name}\0Saison #{seasonNumber}",
                        "02.png",
                        cancellationToken);
                }
            }
        }

        // reset seasonal statistics: player goals
        await dbContext.Database.ExecuteSqlRawAsync("UPDATE team_players SET goals = 0", cancellationToken);

        // reset cards and suspensions on season change
        await dbContext.Database.ExecuteSqlRawAsync("UPDATE team_players SET yellow_cards = 0, red_cards = 0, suspension_matches_remaining = 0", cancellationToken);

        // sync change tracker with the raw SQL update so tracked entities reflect the reset
        foreach (var entry in dbContext.ChangeTracker.Entries<TeamPlayerEntity>())
        {
            entry.Property(p => p.Goals).CurrentValue = 0;
            entry.Property(p => p.YellowCards).CurrentValue = 0;
            entry.Property(p => p.RedCards).CurrentValue = 0;
            entry.Property(p => p.SuspensionMatchesRemaining).CurrentValue = 0;
        }

        await ApplyLeaguePromotionRelegationAsync(cancellationToken);

        // After promotions/relegations, invalidate old fixtures so the new league composition
        // has a fresh schedule.
        await RegenerateSchedulesAfterSeasonTransitionAsync(cancellationToken);
    }

    private async Task RegenerateSchedulesAfterSeasonTransitionAsync(CancellationToken cancellationToken)
    {
        // Wipe the current fixture list so a clean season schedule can be generated.
        await dbContext.Database.ExecuteSqlRawAsync("DELETE FROM league_matches", cancellationToken);

        var leagueIds = await dbContext.Leagues.Select(l => l.Id).ToListAsync(cancellationToken);
        foreach (var leagueId in leagueIds)
        {
            await _leagueStore.EnsureScheduleForLeagueAsync(Guid.Parse(leagueId), cancellationToken);
        }
    }

    private async Task ApplyLeaguePromotionRelegationAsync(CancellationToken cancellationToken)
    {

        // Ensure the current peak tier exists (and that required lower/upper tiers exist for promotions/relegations).
        var existingTiers = await dbContext.Leagues.Select(x => x.Tier).Distinct().OrderBy(x => x).ToListAsync(cancellationToken);
        if (!existingTiers.Any())
        {
            // No leagues exist yet; nothing to do.
            return;
        }

        var maxTier = existingTiers.Max();

        // Ensure all current tiers are fully built (groups exist). If they are missing, we cannot reliably move teams.
        // The league creation logic is in LeagueDbStore; replicate minimal needed behavior here.
        await EnsureAllLeaguesExistForTierRangeAsync(1, maxTier + 1, cancellationToken);

        // Ensure we have enough tiers to accommodate relegations climbing upward.
        // Some tiers (e.g. 2+) have dismount slots and may push teams into higher tiers.
        var tierToCheck = maxTier + 1;
        while (true)
        {
            var hasRelegations = await dbContext.Leagues
                .Where(l => l.Tier == tierToCheck && l.Dismount > 0)
                .AnyAsync(cancellationToken);
            if (!hasRelegations)
                break;

            // Ensure the next tier exists so relegations have somewhere to go.
            await EnsureAllLeaguesExistForTierRangeAsync(tierToCheck + 1, tierToCheck + 1, cancellationToken);
            tierToCheck++;
        }

        var maxTierToLoad = tierToCheck;
        var leagues = await dbContext.Leagues
            .Include(l => l.Teams)
            .Where(l => l.Tier >= 1 && l.Tier <= maxTierToLoad)
            .ToListAsync(cancellationToken);

        // Build standings and identify promotions/relegations.
        var leagueGroups = leagues
            .SelectMany(l => l.Teams.Select(t => (League: l, Team: t)))
            .GroupBy(p => (p.League.Tier, p.League.GroupNumber))
            .ToDictionary(g => g.Key, g => g.Select(p => p.Team).ToList());

        // Determine the lowest tier that actually contains human teams (TeamId != null).
        var lowestHumanTier = leagues
            .Where(l => l.Teams.Any(t => t.TeamId != null))
            .Select(l => l.Tier)
            .DefaultIfEmpty(int.MaxValue)
            .Min();

        var promotionsByTier = new Dictionary<int, List<LeagueTeamEntity>>();
        var relegationsByTier = new Dictionary<int, List<LeagueTeamEntity>>();

        foreach (var league in leagues)
        {
            var teams = league.Teams
                .OrderByDescending(t => t.PointsHome + t.PointsAway)
                .ThenByDescending(t => (t.GoalsScoredHome + t.GoalsScoredAway) - (t.GoalsReceivedHome + t.GoalsReceivedAway))
                .ThenByDescending(t => t.GoalsScoredHome + t.GoalsScoredAway)
                .ThenBy(t => t.TeamName)
                .ToList();

            if (teams.Count != TeamsPerLeague)
            {
                // If the league is incomplete (e.g. missing teams), skip promotion/relegation for it.
                continue;
            }

            if (league.Mount > 0)
            {
                if (!promotionsByTier.TryGetValue(league.Tier, out var list))
                {
                    list = new List<LeagueTeamEntity>();
                    promotionsByTier[league.Tier] = list;
                }
                list.AddRange(teams.Take(league.Mount));
            }

            if (league.Dismount > 0)
            {
                // If the lowest tier that contains humans is above 1, do not relegate from that tier.
                // This prevents Tier N from dismounting when there is no lower tier with human teams.
                if (lowestHumanTier > 1 && league.Tier == lowestHumanTier)
                {
                    continue;
                }

                if (!relegationsByTier.TryGetValue(league.Tier, out var list))
                {
                    list = new List<LeagueTeamEntity>();
                    relegationsByTier[league.Tier] = list;
                }
                list.AddRange(teams.Skip(TeamsPerLeague - league.Dismount).Take(league.Dismount));
            }
        }

        // Build a lookup of all slots and tracking of which slots are being moved.
        var movingSlots = new HashSet<string>();
        foreach (var tier in promotionsByTier.Keys)
        {
            foreach (var slot in promotionsByTier[tier])
                movingSlots.Add(slot.Id);
        }
        foreach (var tier in relegationsByTier.Keys)
        {
            foreach (var slot in relegationsByTier[tier])
                movingSlots.Add(slot.Id);
        }

        // Prepare available destination slots (slots that are not moving) by tier/group.
        var availableDestSlots = leagueGroups.ToDictionary(
            kvp => kvp.Key,
            kvp => new Queue<LeagueTeamEntity>(kvp.Value.Where(s => !movingSlots.Contains(s.Id)).OrderBy(s => s.Id)));

        var usedDestSlotIds = new HashSet<string>();

        // Helper to pick a destination slot for a given target tier/group.
        LeagueTeamEntity PickDestinationSlot(int tier, int group)
        {
            var key = (tier, group);
            if (!availableDestSlots.TryGetValue(key, out var queue))
            {
                queue = new Queue<LeagueTeamEntity>();
                availableDestSlots[key] = queue;
            }

            while (queue.Count > 0)
            {
                var candidate = queue.Dequeue();
                if (!usedDestSlotIds.Contains(candidate.Id))
                {
                    usedDestSlotIds.Add(candidate.Id);
                    return candidate;
                }
            }

            // Fallback: use any slot in the group that hasn't been used as a destination yet.
            if (leagueGroups.TryGetValue(key, out var list))
            {
                var candidate = list.FirstOrDefault(s => !usedDestSlotIds.Contains(s.Id));
                if (candidate is not null)
                {
                    usedDestSlotIds.Add(candidate.Id);
                    return candidate;
                }
            }

            throw new InvalidOperationException($"No slots available for tier {tier} group {group}.");
        }

        // Apply promotions (tier N -> tier N-1)
        var promotionalMoves = new List<(LeagueTeamEntity Source, int TargetTier, int TargetGroup)>();
        foreach (var (sourceTier, promotedTeams) in promotionsByTier)
        {
            var targetTier = sourceTier - 1;
            if (targetTier < 1) continue;

            var targetGroupsCount = GetMaxGroupsForTier(targetTier);
            var perGroup = Math.Max(1, promotedTeams.Count / targetGroupsCount);
            for (var i = 0; i < promotedTeams.Count; i++)
            {
                var team = promotedTeams[i];
                var targetGroup = 1 + Math.Min(targetGroupsCount - 1, i / perGroup);
                promotionalMoves.Add((team, targetTier, targetGroup));
            }
        }

        // Apply relegations (tier N -> tier N+1)
        var relegationMoves = new List<(LeagueTeamEntity Source, int TargetTier, int TargetGroup)>();
        foreach (var (sourceTier, relegatedTeams) in relegationsByTier)
        {
            var targetTier = sourceTier + 1;
            var targetGroupsCount = GetMaxGroupsForTier(targetTier);
            for (var i = 0; i < relegatedTeams.Count; i++)
            {
                var team = relegatedTeams[i];
                var targetGroup = 1 + (i % targetGroupsCount);
                relegationMoves.Add((team, targetTier, targetGroup));
            }
        }

        // Execute moves (promotions first, then relegations)
        foreach (var move in promotionalMoves.Concat(relegationMoves))
        {
            var destSlot = PickDestinationSlot(move.TargetTier, move.TargetGroup);
            if (destSlot.Id == move.Source.Id)
            {
                // The team is staying in its own slot (can happen if no movement is needed).
                continue;
            }

            // Copy team info into destination slot.
            destSlot.TeamId = move.Source.TeamId;
            destSlot.TeamName = move.Source.TeamName;
            destSlot.IsBot = move.Source.IsBot;
            destSlot.Strength = move.Source.Strength;
            destSlot.Country = move.Source.Country;
            destSlot.Logo = move.Source.Logo;
            destSlot.IsOnline = move.Source.IsOnline;

            // Clear the source slot.
            move.Source.TeamId = null;
            var srcIdSuffix = move.Source.Id.Length >= 8 ? move.Source.Id[..8] : move.Source.Id;
            move.Source.TeamName = $"Bot FC {move.TargetTier}-{move.TargetGroup}-{srcIdSuffix}";
            move.Source.IsBot = true;
            move.Source.Country = "DE";
            move.Source.IsOnline = false;
        }

        // Reset all league stats for new season and clear existing match schedule/results.
        await dbContext.Database.ExecuteSqlRawAsync("UPDATE league_teams SET matches_home = 0, matches_away = 0, wins_home = 0, wins_away = 0, losses_home = 0, losses_away = 0, draws_home = 0, draws_away = 0, goals_scored_home = 0, goals_scored_away = 0, goals_received_home = 0, goals_received_away = 0, points_home = 0, points_away = 0", cancellationToken);
        await dbContext.Database.ExecuteSqlRawAsync("DELETE FROM league_matches", cancellationToken);

        // Update team entities' league tier/name to match their current slot.
        var teamSlots = await dbContext.LeagueTeams.Where(x => x.TeamId != null).ToListAsync(cancellationToken);
        foreach (var slot in teamSlots)
        {
            var teamEntity = await dbContext.Teams.FirstOrDefaultAsync(x => x.Id == slot.TeamId, cancellationToken);
            if (teamEntity != null)
            {
                var league = leagues.FirstOrDefault(l => l.Id == slot.LeagueId);
                if (league != null)
                {
                    teamEntity.LeagueTier = league.Tier;
                    teamEntity.LeagueName = league.Name;
                }
            }
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private async Task EnsureAllLeaguesExistForTierRangeAsync(int minTier, int maxTier, CancellationToken cancellationToken)
    {
        for (var tier = minTier; tier <= maxTier; tier++)
        {
            var existingGroups = await dbContext.Leagues
                .Where(x => x.Tier == tier)
                .Select(x => x.GroupNumber)
                .ToListAsync(cancellationToken);

            var maxGroups = GetMaxGroupsForTier(tier);
            var missingGroups = Enumerable.Range(1, maxGroups).Except(existingGroups).ToList();
            if (!missingGroups.Any())
                continue;

            foreach (var group in missingGroups.OrderBy(x => x))
            {
                CreateLeagueAndTeams(tier, group);
            }

            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }

    private void CreateLeagueAndTeams(int tier, int groupNumber)
    {
        var league = new LeagueEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            Tier = tier,
            GroupNumber = groupNumber,
            Name = $"League {tier}-{groupNumber}",
            Mount = tier switch
            {
                1 => 0,
                2 => 1,
                3 => 2,
                4 => 2,
                _ => 0
            },
            Dismount = tier switch
            {
                1 => 5,
                2 => 6,
                3 => 6,
                _ => 0
            }
        };

        dbContext.Leagues.Add(league);

        var seed = HashCode.Combine(tier, groupNumber);
        var random = new Random(seed);
        for (var i = 1; i <= TeamsPerLeague; i++)
        {
            dbContext.LeagueTeams.Add(new LeagueTeamEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                LeagueId = league.Id,
                TeamId = null,
                TeamName = $"Bot FC {tier}-{groupNumber}-{i}",
                IsBot = true,
                Strength = random.Next(40, 85),
                Country = "DE",
                Logo = LegacyAppCompatibility.BuildLogoId($"bot-{tier}-{groupNumber}-{i}"),
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
        }
    }

    private static int GetMaxGroupsForTier(int tier) => tier switch
    {
        1 => 1,
        2 => 5,
        3 => 15,
        _ => 15 * (1 << (tier - 3))
    };

    private async Task MoveTeamToTierGroupAsync(LeagueTeamEntity teamSlot, int targetTier, int targetGroup, CancellationToken cancellationToken)
    {
        // Ensure target league exists (should have been ensured already via EnsureAllLeaguesExistForTierRangeAsync)
        var targetLeague = await dbContext.Leagues.FirstOrDefaultAsync(x => x.Tier == targetTier && x.GroupNumber == targetGroup, cancellationToken);
        if (targetLeague is null)
        {
            throw new InvalidOperationException($"Target league tier {targetTier} group {targetGroup} does not exist.");
        }

        // Find a placeholder slot in the target league (a bot slot with no team assigned)
        var targetSlot = await dbContext.LeagueTeams
            .Where(x => x.LeagueId == targetLeague.Id && x.IsBot && x.TeamId == null)
            .OrderBy(x => x.Id)
            .FirstOrDefaultAsync(cancellationToken);

        if (targetSlot is null)
        {
            // No empty slot available; pick any slot in the target league and overwrite it.
            targetSlot = await dbContext.LeagueTeams
                .Where(x => x.LeagueId == targetLeague.Id)
                .OrderBy(x => x.Id)
                .FirstAsync(cancellationToken);
        }

        // Move the team data into the target slot.
        targetSlot.TeamId = teamSlot.TeamId;
        targetSlot.TeamName = teamSlot.TeamName;
        targetSlot.IsBot = teamSlot.IsBot;
        targetSlot.Strength = teamSlot.Strength;
        targetSlot.Country = teamSlot.Country;
        targetSlot.Logo = teamSlot.Logo;
        targetSlot.IsOnline = teamSlot.IsOnline;

        // Reset source slot to an empty bot placeholder.
        teamSlot.TeamId = null;
        var slotIdSuffix = teamSlot.Id.Length >= 8 ? teamSlot.Id[..8] : teamSlot.Id;
        teamSlot.TeamName = $"Bot FC {targetTier}-{targetGroup}-{slotIdSuffix}";
        teamSlot.IsBot = true;
        teamSlot.Country = "DE";
        teamSlot.IsOnline = false;

        await dbContext.SaveChangesAsync(cancellationToken);
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
            teamEntity.LeagueTier,
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
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);
        var resources = await dbContext.TeamResources.AsNoTracking().FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        var teamEntity = await dbContext.Teams.AsNoTracking().FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        var hasActiveConstruction = HasActiveConstruction(resources);

        return
        [
            ToBuildPlace(StadiumBuildingCatalog.Office, "Office", resources.OfficeLevel, !hasActiveConstruction && resources.OfficeLevel < FacilityMaxLevel),
            ToBuildPlace(StadiumBuildingCatalog.TrainingCenter, "TrainingCenter", resources.TrainingCenterLevel, !hasActiveConstruction && CanUpgrade(resources.TrainingCenterLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.MedicalCenter, "MedicalCenter", resources.MedicalCenterLevel, !hasActiveConstruction && CanUpgrade(resources.MedicalCenterLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.YouthAcademy, "YouthAcademy", resources.YouthAcademyLevel, !hasActiveConstruction && CanUpgrade(resources.YouthAcademyLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.FanShop, "FanShop", resources.FanShopLevel, !hasActiveConstruction && CanUpgrade(resources.FanShopLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.Parking, "Parking", resources.ParkingLevel, !hasActiveConstruction && CanUpgrade(resources.ParkingLevel, resources.OfficeLevel)),
            ToBuildPlace(StadiumBuildingCatalog.StadiumStands, "StadiumStands", resources.StadiumStandSeats, !hasActiveConstruction && CanUpgradeStadium(resources, resources.OfficeLevel, teamEntity.LeagueTier, StadiumBuildingCatalog.StadiumStands)),
            ToBuildPlace(StadiumBuildingCatalog.StadiumSeats, "StadiumSeats", resources.StadiumSitSeats, !hasActiveConstruction && CanUpgradeStadium(resources, resources.OfficeLevel, teamEntity.LeagueTier, StadiumBuildingCatalog.StadiumSeats)),
            ToBuildPlace(StadiumBuildingCatalog.StadiumVips, "StadiumVips", resources.StadiumVipSeats, !hasActiveConstruction && CanUpgradeStadium(resources, resources.OfficeLevel, teamEntity.LeagueTier, StadiumBuildingCatalog.StadiumVips))
        ];
    }

    public async Task<bool> BuildPlaceAsync(string userId, Guid placeId, int count = 1, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);
        var teamEntity = await dbContext.Teams.FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        var teamIdGuid = BuildDeterministicGuid(team.TeamId);

        if (HasActiveConstruction(resources))
        {
            return false;
        }

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
            QueueConstruction(resources, placeId, "Office", resources.OfficeLevel, resources.OfficeLevel + 1, cost, GetFacilityBuildDurationMinutes(resources.OfficeLevel), DateTime.UtcNow);
            await AddFinanceHistoryAsync(userId, income: 0m, outcome: cost, resources.Money, cancellationToken);
            AddConstructionNews(team.TeamId, "Geschäftsstelle", resources.OfficeLevel + 1, resources.ActiveConstructionEndUtc);
            await dbContext.SaveChangesAsync(cancellationToken);
            return true;
        }

        if (placeId == StadiumBuildingCatalog.StadiumVips || placeId == StadiumBuildingCatalog.StadiumSeats || placeId == StadiumBuildingCatalog.StadiumStands)
        {
            // The client sends the *number of seats* to add (e.g. 200), but construction is done in fixed blocks
            // (10 seats for VIP, 100 for Sit/Stand). Map the requested seat count to the required number of blocks.
            var desiredSeats = Math.Max(1, count);
            var seatBlock = placeId == StadiumBuildingCatalog.StadiumVips ? 10 : 100;
            var blocks = (desiredSeats + seatBlock - 1) / seatBlock; // round up to full blocks
            var totalSeats = blocks * seatBlock;

            var currentValue = placeId == StadiumBuildingCatalog.StadiumVips
                ? resources.StadiumVipSeats
                : (placeId == StadiumBuildingCatalog.StadiumSeats ? resources.StadiumSitSeats : resources.StadiumStandSeats);

            var cap = stadiumEconomy.GetSeatCaps(teamEntity.LeagueTier);
            var maxValue = placeId == StadiumBuildingCatalog.StadiumVips ? cap.MaxVipSeats
                : placeId == StadiumBuildingCatalog.StadiumSeats ? cap.MaxSitSeats
                : int.MaxValue;

            if (currentValue + totalSeats > maxValue)
            {
                return false;
            }

            var cost = GetSeatUpgradeCost(placeId) * blocks;
            if (resources.Money < cost)
            {
                return false;
            }

            resources.Money -= cost;
            QueueConstruction(
                resources,
                placeId,
                GetSeatConstructionType(placeId),
                currentValue,
                currentValue + totalSeats,
                cost,
                GetSeatBuildDurationMinutes(placeId) * blocks,
                DateTime.UtcNow);
            await AddFinanceHistoryAsync(userId, income: 0m, outcome: cost, resources.Money, cancellationToken);
            AddConstructionNews(team.TeamId, GetSeatDisplayName(placeId), currentValue + totalSeats, resources.ActiveConstructionEndUtc);
            await dbContext.SaveChangesAsync(cancellationToken);
            return true;
        }

        var result = placeId switch
        {
            _ when placeId == StadiumBuildingCatalog.TrainingCenter => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.TrainingCenterLevel, teamIdGuid, "TrainingCenter"),
            _ when placeId == StadiumBuildingCatalog.MedicalCenter => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.MedicalCenterLevel, teamIdGuid, "MedicalCenter"),
            _ when placeId == StadiumBuildingCatalog.YouthAcademy => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.YouthAcademyLevel, teamIdGuid, "YouthAcademy"),
            _ when placeId == StadiumBuildingCatalog.FanShop => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.FanShopLevel, teamIdGuid, "FanShop"),
            _ when placeId == StadiumBuildingCatalog.Parking => TryUpgradeFacility(resources, resources.OfficeLevel, x => x.ParkingLevel, teamIdGuid, "Parking"),
            _ => (Success: false, Cost: 0m, CurrentLevel: 0, NewLevel: 0, BuildingType: string.Empty)
        };

        if (!result.Success)
        {
            return false;
        }

        if (resources.Money < result.Cost)
        {
            return false;
        }

        resources.Money -= result.Cost;
        QueueConstruction(resources, placeId, result.BuildingType, result.CurrentLevel, result.NewLevel, result.Cost, GetFacilityBuildDurationMinutes(result.CurrentLevel), DateTime.UtcNow);
        await AddFinanceHistoryAsync(userId, income: 0m, outcome: result.Cost, resources.Money, cancellationToken);
        AddConstructionNews(team.TeamId, GetFacilityDisplayName(result.BuildingType), result.NewLevel, resources.ActiveConstructionEndUtc);
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<ConstructionRecord?> GetUnderConstructionAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);
        var resources = await dbContext.TeamResources.AsNoTracking().FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        return ToConstructionRecord(resources);
    }

    public async Task<bool> SpeedupConstructionAsync(string userId, Guid constructionId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        var matchesConstructionId = Guid.TryParse(resources.ActiveConstructionId, out var activeId) && activeId == constructionId;
        var matchesPlaceId = Guid.TryParse(resources.ActiveConstructionPlaceId, out var placeId) && placeId == constructionId;
        if (!matchesConstructionId && !matchesPlaceId)
        {
            return false;
        }

        resources.ActiveConstructionEndUtc = DateTime.UtcNow;
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);
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
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);

        const decimal renameCost = 500m;
        if (resources.Money < renameCost)
        {
            return;
        }

        resources.Money -= renameCost;
        teamEntity.StadiumName = string.IsNullOrWhiteSpace(name) ? "My Stadium" : name.Trim();
        await AddFinanceHistoryAsync(userId, income: 0m, outcome: renameCost, resources.Money, cancellationToken);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<bool> TrySpendStarsAsync(string userId, decimal stars, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        if (resources.GTStars < stars)
        {
            return false;
        }

        resources.GTStars -= stars;
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<bool> TrySpendMedipacksAsync(string userId, decimal medipacks, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        if (resources.Medipacks < medipacks)
        {
            return false;
        }

        resources.Medipacks -= medipacks;
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<TeamTrainingStateRecord> GetTrainingStateAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);

        var resources = await dbContext.TeamResources.AsNoTracking().FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        var teamEntity = await dbContext.Teams.AsNoTracking().FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        var state = await EnsureTrainingStateAsync(team.TeamId, cancellationToken);
        var baseEfficiency = trainingProgress.CalculateEfficiencyValue(resources.TrainingCenterLevel);

        // Efficiency decays after 3 days without changing training.
        // After day 3, it loses 20% per additional day (multiplicative).
        var daysSinceChange = state.TrainingChangedAtUtc.HasValue
            ? (int)(DateTime.UtcNow - state.TrainingChangedAtUtc.Value).TotalDays
            : 0;

        // Efficiency is exposed as an integer percentage value.
        decimal efficiencyValue;
        if (daysSinceChange <= 3)
        {
            efficiencyValue = baseEfficiency;
        }
        else
        {
            var daysOver = daysSinceChange - 3;
            var multiplier = (decimal)Math.Pow(0.8, daysOver);
            efficiencyValue = Math.Max(10m, Math.Round(baseEfficiency * multiplier, 2));
        }

        var efficiency = (int)Math.Round(efficiencyValue, MidpointRounding.AwayFromZero);
        var trainPrice = IndividualTrainingWeeklyStars;

        var tacticProgress = new Dictionary<string, int>();
        if (!string.IsNullOrWhiteSpace(state.TacticTrainingProgressJson))
        {
            try
            {
                tacticProgress = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, int>>(state.TacticTrainingProgressJson)
                    ?? new Dictionary<string, int>();
            }
            catch
            {
                tacticProgress = new Dictionary<string, int>();
            }
        }

        return new TeamTrainingStateRecord(
            state.MainSkillIndex,
            state.SubSkillIndex,
            GetEfficiencyText(efficiency),
            efficiency,
            trainPrice,
            state.CampType,
            state.CampActiveUntilUtc,
            state.SelectedTacticId,
            state.SelectedTacticStartUtc,
            teamEntity.LeagueTier,
            state.CampRefreshCount,
            tacticProgress);
    }

    public async Task SaveTeamTrainingAsync(string userId, int mainSkillIndex, int subSkillIndex, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var state = await EnsureTrainingStateAsync(team.TeamId, cancellationToken);

        state.MainSkillIndex = Math.Clamp(mainSkillIndex, 0, 3);
        state.SubSkillIndex = Math.Clamp(subSkillIndex, 0, 9);
        state.TrainingChangedAtUtc = DateTime.UtcNow;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task SaveTacticTrainingAsync(string userId, string tacticId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var state = await EnsureTrainingStateAsync(team.TeamId, cancellationToken);

        // Keep per-tactic progress so switching tactics doesn't reset previous progress.
        var progress = new Dictionary<string, int>();
        if (!string.IsNullOrWhiteSpace(state.TacticTrainingProgressJson))
        {
            try
            {
                progress = System.Text.Json.JsonSerializer.Deserialize<Dictionary<string, int>>(state.TacticTrainingProgressJson)
                    ?? new Dictionary<string, int>();
            }
            catch
            {
                progress = new Dictionary<string, int>();
            }
        }

        // If we were training another tactic, save the elapsed time as progress.
        var isSwitchingTactic =
            !string.IsNullOrWhiteSpace(state.SelectedTacticId)
            && state.SelectedTacticStartUtc.HasValue
            && state.SelectedTacticId != tacticId;

        if (isSwitchingTactic)
        {
            var elapsedDays = Math.Max(1, (int)(DateTime.UtcNow - state.SelectedTacticStartUtc.Value).TotalDays + 1);
            progress[state.SelectedTacticId] = (progress.TryGetValue(state.SelectedTacticId, out var existing) ? existing : 0) + elapsedDays;

            state.SelectedTacticId = tacticId;
            state.SelectedTacticStartUtc = DateTime.UtcNow;
        }
        else
        {
            // If we're continuing the same tactic, keep the original start time (so progress continues to accumulate).
            // If there is no start time yet (first assignment), initialize it.
            if (string.IsNullOrWhiteSpace(state.SelectedTacticId) || !state.SelectedTacticStartUtc.HasValue)
            {
                state.SelectedTacticId = tacticId;
                state.SelectedTacticStartUtc = DateTime.UtcNow;
            }
        }

        state.TacticTrainingProgressJson = System.Text.Json.JsonSerializer.Serialize(progress);

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<bool> BookCampAsync(string userId, string campType, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        var teamEntity = await dbContext.Teams.AsNoTracking().FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        var state = await EnsureTrainingStateAsync(team.TeamId, cancellationToken);

        // Camp cost depends on league tier
        var campCost = teamEntity.LeagueTier switch
        {
            1 => 10_000_000m,
            2 => 5_000_000m,
            3 => 2_000_000m,
            _ => 500_000m
        };

        if (resources.Money >= campCost)
        {
            resources.Money -= campCost;
            await AddFinanceHistoryAsync(userId, income: 0m, outcome: campCost, resources.Money, cancellationToken);
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

    public async Task CancelCampAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var state = await EnsureTrainingStateAsync(team.TeamId, cancellationToken);
        state.CampType = string.Empty;
        state.CampActiveUntilUtc = null;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task IncrementCampRefreshAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var state = await EnsureTrainingStateAsync(team.TeamId, cancellationToken);
        state.CampRefreshCount++;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<SquadPlayerRecord>> GetSquadPlayersAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        await ApplyProgressionTicksAsync(team.TeamId, cancellationToken);

        var players = await dbContext.TeamPlayers.AsNoTracking()
            .Where(x => x.TeamId == team.TeamId && !x.IsScouted)
            .OrderBy(x => x.ShirtNumber)
            .ToListAsync(cancellationToken);

        return players.Select(MapPlayer).ToArray();
    }

    public async Task<IReadOnlyList<SquadPlayerRecord>> GetSquadPlayersForTeamAsync(Guid teamId, CancellationToken cancellationToken = default)
    {
        var teamKey = teamId.ToString("N");
        await ApplyProgressionTicksAsync(teamKey, cancellationToken);

        var players = await dbContext.TeamPlayers.AsNoTracking()
            .Where(x => x.TeamId == teamKey && !x.IsScouted)
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
        CompleteConstructionIfFinished(resources, now, team.Id);
        var players = await dbContext.TeamPlayers.Where(x => x.TeamId == teamId && !x.IsScouted).ToListAsync(cancellationToken);
        if (players.Count == 0)
        {
            foreach (var player in BuildInitialPlayers(teamId))
            {
                dbContext.TeamPlayers.Add(player);
                players.Add(player);
            }
        }

        var hasLegacyPlayers = false;
        foreach (var player in players)
        {
            if (EnsurePlayerSkillsInitialized(player))
            {
                hasLegacyPlayers = true;
            }

            RecalculatePlayerDerivedValues(player);
        }

        var economyDays = FullDaysElapsed(resources.LastEconomyTickUtc, now);
        if (economyDays > 0)
        {
            var totalIncome = 0m;
            var totalExpense = 0m;
            var matchday = resources.ProgressDayCounter;

            // Deterministic sponsor EUR amounts (same seed as SponsorService)
            var sponsorSeed = HashCode.Combine(team.Id, "sponsor");
            var sponsorRng = new Random(sponsorSeed);
            var mainSponsorPerMatch = sponsorRng.Next(50_000, 300_001);
            // skip main goalscorer+championship to align rng
            sponsorRng.Next(); sponsorRng.Next();
            var secondarySponsorPerMatch = sponsorRng.Next(30_000, 100_001);
            var secondarySponsorPerWin = sponsorRng.Next(10_000, 40_001);
            var secondarySponsorPerGoal = sponsorRng.Next(5_000, 20_001);

            for (var i = 0; i < economyDays; i++)
            {
                var dayMatchday = matchday + i;
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

                // Stadium gate receipts as ledger entry (matches original "Zuschauer"/"Eintrittsgelder")
                if (economy.Earnings > 0)
                {
                    AddLedgerEntry(team.UserId, dayMatchday, now.Date, "Zuschauer", economy.Earnings, "Eintrittsgelder", true);
                }

                // Sponsor EUR income per matchday
                var mainEur = (decimal)mainSponsorPerMatch;
                var secondaryEur = (decimal)secondarySponsorPerMatch;
                var winBonusEur = (decimal)secondarySponsorPerWin;
                var goalBonusEur = (decimal)secondarySponsorPerGoal;
                resources.Money += mainEur + secondaryEur + winBonusEur + goalBonusEur;
                totalIncome += mainEur + secondaryEur + winBonusEur + goalBonusEur;

                AddLedgerEntry(team.UserId, dayMatchday, now.Date, "Hauptsponsor", mainEur, "Grundbetrag", true);
                AddLedgerEntry(team.UserId, dayMatchday, now.Date, "Nebensponsor", secondaryEur, "Grundbetrag", true);
                AddLedgerEntry(team.UserId, dayMatchday, now.Date, "Nebensponsor", winBonusEur, "Siegprämie", true);
                AddLedgerEntry(team.UserId, dayMatchday, now.Date, "Nebensponsor", goalBonusEur, "Torprämie", true);

                // Stadium building maintenance costs (itemized)
                RecordBuildingCost(team.UserId, dayMatchday, now.Date, "Geschäftsstelle", resources.OfficeLevel, 700m, ref totalExpense, resources);
                RecordBuildingCost(team.UserId, dayMatchday, now.Date, "Trainingsgelände", resources.TrainingCenterLevel, 700m, ref totalExpense, resources);
                RecordBuildingCost(team.UserId, dayMatchday, now.Date, "Fitnessstudio", resources.MedicalCenterLevel, 225m, ref totalExpense, resources);
                RecordBuildingCost(team.UserId, dayMatchday, now.Date, "Jugendzentrum", resources.YouthAcademyLevel, 240m, ref totalExpense, resources);
                RecordBuildingCost(team.UserId, dayMatchday, now.Date, "Fanshop", resources.FanShopLevel, 180m, ref totalExpense, resources);
                RecordBuildingCost(team.UserId, dayMatchday, now.Date, "Parkplätze", resources.ParkingLevel, 150m, ref totalExpense, resources);

                // Seat maintenance
                var standCost = resources.StadiumStandSeats * 2m;
                var sitCost = resources.StadiumSitSeats * 5m;
                var vipCost = resources.StadiumVipSeats * 150m;
                if (standCost > 0) { AddLedgerEntry(team.UserId, dayMatchday, now.Date, "Stadion", standCost, "Stehplätze", false); resources.Money -= standCost; totalExpense += standCost; }
                if (sitCost > 0) { AddLedgerEntry(team.UserId, dayMatchday, now.Date, "Stadion", sitCost, "Sitzplätze", false); resources.Money -= sitCost; totalExpense += sitCost; }
                if (vipCost > 0) { AddLedgerEntry(team.UserId, dayMatchday, now.Date, "Stadion", vipCost, "VIP-Logen", false); resources.Money -= vipCost; totalExpense += vipCost; }

                // Player salaries (computed from strength)
                var totalSalary = players.Sum(p => Math.Max(1_000m, p.Strength * p.Strength / 4m));
                if (totalSalary > 0)
                {
                    AddLedgerEntry(team.UserId, dayMatchday, now.Date, "Spielergehälter", totalSalary, "", false);
                    resources.Money -= totalSalary;
                    totalExpense += totalSalary;
                }

                // Grass degrades slowly with usage and should be renewed periodically.
                team.GrassQuality = Math.Max(45, team.GrassQuality - 1);
            }

            AddFinanceHistoryForTeam(team.UserId, totalIncome, totalExpense, resources.Money);
            resources.LastEconomyTickUtc = now.Date;
        }

        var sponsorDays = resources.LastSponsorPayoutUtc is null ? 1 : FullDaysElapsed(resources.LastSponsorPayoutUtc, now);
        if (sponsorDays > 0)
        {
            resources.GTStars += sponsorDays * (DailyMainSponsorStars + DailySecondarySponsorStars);
            resources.LastSponsorPayoutUtc = now.Date;
        }

        var trainingDays = FullDaysElapsed(resources.LastTrainingTickUtc, now);
        if (trainingDays > 0)
        {
            for (var i = 0; i < trainingDays; i++)
            {
                var tickDate = now.Date.AddDays(-trainingDays + i + 1);

                // Capture pre-tick state for training report
                var preStrengths = players.ToDictionary(p => p.Id, p => p.Strength);
                var preFitness = players.ToDictionary(p => p.Id, p => p.Fitness);
                var preTeamStrength = players
                    .OrderBy(x => x.ShirtNumber).ThenByDescending(x => x.Strength)
                    .Take(11).Sum(x => x.Strength);

                ApplyDailyTrainingTick(players, resources, training, tickDate);

                var postTeamStrength = players
                    .OrderBy(x => x.ShirtNumber).ThenByDescending(x => x.Strength)
                    .Take(11).Sum(x => x.Strength);

                AddTrainingReportMail(team.UserId, players, preStrengths, preFitness,
                    training, preTeamStrength, postTeamStrength, tickDate);
                resources.ProgressDayCounter++;

                        if (resources.ProgressDayCounter >= SeasonLengthDays)
                {
                    resources.ProgressDayCounter -= SeasonLengthDays;
                    foreach (var player in players)
                    {
                        player.Age++;
                    }

                    // season rollover: process achievements and reset seasonal counters once
                    await EnsureSeasonTransitionAsync(cancellationToken);
                }
            }

            resources.LastTrainingTickUtc = now.Date;
            team.Strength = RecalculateTeamStrength(players);
            team.MarketValue = RecalculateTeamMarketValue(players);
        }
        else if (players.Count > 0)
        {
            team.Strength = RecalculateTeamStrength(players);
            team.MarketValue = RecalculateTeamMarketValue(players);
        }

        if (economyDays > 0 || sponsorDays > 0 || trainingDays > 0 || hasLegacyPlayers)
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

            // Note: camp bonuses should apply to a specific skill (not to the overall training total).
            // The base gain is calculated without the camp bonus; the camp bonus is applied below if active.
            var gain = trainingProgress.CalculateDailyTotalGain(
                player.Age,
                player.Talent,
                player.Fitness,
                resources.TrainingCenterLevel,
                individualActive,
                hasCamp: false);

            var mainSkillIndex = NormalizeSkillIndex(training.MainSkillIndex, player.Position);
            var subSkillIndex = NormalizeSkillIndex(training.SubSkillIndex, player.Position);

            // Daily team training focuses mostly on main skill with smaller sub-skill gains.
            AddSkillGain(player, mainSkillIndex, gain * 0.65m);
            if (subSkillIndex != mainSkillIndex)
            {
                AddSkillGain(player, subSkillIndex, gain * 0.35m);
            }

            // Camp bonus (fixed +1.5) should boost one specific stat depending on the camp type.
            if (hasCamp && TryGetCampBonusTarget(training.CampType, out var campSkillIndex, out var isExperience))
            {
                if (isExperience)
                {
                    player.Experience += 1.5m;
                }
                else
                {
                    AddSkillGain(player, campSkillIndex, 1.5m);
                }
            }
            else if (hasCamp)
            {
                // Fallback: preserve previous behavior (camp as extra total gain) when camp type is unknown.
                AddSkillGain(player, mainSkillIndex, 1.5m * 0.65m);
                if (subSkillIndex != mainSkillIndex)
                {
                    AddSkillGain(player, subSkillIndex, 1.5m * 0.35m);
                }
            }

            if (individualActive && TryResolveSkillIndex(player.IndividualTrainingSkill, out var individualSkillIndex))
            {
                var individualGain = trainingProgress.CalculateIndividualGainPublic(player.Age, player.Talent, player.Fitness);
                AddSkillGain(player, individualSkillIndex, individualGain);
            }

            // Fitness climbs over time; at training center level 20, daily gain reaches +4.
            var fitnessGain = Math.Max(1, (int)Math.Round(resources.TrainingCenterLevel / 5.0, MidpointRounding.AwayFromZero));
            player.Fitness = Math.Min(100, player.Fitness + fitnessGain);

            RecalculatePlayerDerivedValues(player);
        }
    }

    private int RecalculateTeamStrength(IReadOnlyList<TeamPlayerEntity> players)
    {
        if (players.Count == 0)
        {
            return 1;
        }

        var starting = players
            .OrderBy(x => x.ShirtNumber)
            .ThenByDescending(x => x.Strength)
            .Take(11)
            .ToList();

        var startingLineupStrength = starting
            .Sum(x => (int)Math.Round(x.Strength, MidpointRounding.AwayFromZero));

        var fitnessAverage = (int)Math.Round(starting.Average(x => (double)x.Fitness), MidpointRounding.AwayFromZero);

        return strengthCalculator.Calculate(startingLineupStrength, tacticBonus: 0, fitnessAverage: fitnessAverage);
    }

    private static decimal RecalculateTeamMarketValue(IReadOnlyList<TeamPlayerEntity> players)
    {
        if (players.Count == 0)
        {
            return 0m;
        }

        // Players may be missing persisted market value in legacy rows; treat unknown as 0.
        return players.Sum(x => x.MarketValue ?? 0m);
    }

    private static decimal[] GetSkills(TeamPlayerEntity player)
    {
        // Skill columns are nullable to support legacy rows without skill persistence.
        // Treat missing skills as 0 when computing derived values.
        return
        [
            player.Skill0 ?? 0m,
            player.Skill1 ?? 0m,
            player.Skill2 ?? 0m,
            player.Skill3 ?? 0m,
            player.Skill4 ?? 0m,
            player.Skill5 ?? 0m,
            player.Skill6 ?? 0m,
            player.Skill7 ?? 0m,
            player.Skill8 ?? 0m,
            player.Skill9 ?? 0m,
            player.Skill10 ?? 0m,
            player.Skill11 ?? 0m,
            player.Skill12 ?? 0m,
            player.Skill13 ?? 0m
        ];
    }

    private static void SetSkills(TeamPlayerEntity player, decimal[] skills)
    {
        if (skills.Length < 14)
        {
            throw new ArgumentException("Expected 14 skills.", nameof(skills));
        }

        player.Skill0 = PlayerValueCalculator.ClampSkill(skills[0]);
        player.Skill1 = PlayerValueCalculator.ClampSkill(skills[1]);
        player.Skill2 = PlayerValueCalculator.ClampSkill(skills[2]);
        player.Skill3 = PlayerValueCalculator.ClampSkill(skills[3]);
        player.Skill4 = PlayerValueCalculator.ClampSkill(skills[4]);
        player.Skill5 = PlayerValueCalculator.ClampSkill(skills[5]);
        player.Skill6 = PlayerValueCalculator.ClampSkill(skills[6]);
        player.Skill7 = PlayerValueCalculator.ClampSkill(skills[7]);
        player.Skill8 = PlayerValueCalculator.ClampSkill(skills[8]);
        player.Skill9 = PlayerValueCalculator.ClampSkill(skills[9]);
        player.Skill10 = PlayerValueCalculator.ClampSkill(skills[10]);
        player.Skill11 = PlayerValueCalculator.ClampSkill(skills[11]);
        player.Skill12 = PlayerValueCalculator.ClampSkill(skills[12]);
        player.Skill13 = PlayerValueCalculator.ClampSkill(skills[13]);
    }

    private static bool EnsurePlayerSkillsInitialized(TeamPlayerEntity player)
    {
        var skills = GetSkills(player);
        if (skills.Any(v => v > 0m))
        {
            return false;
        }

        // Backfill legacy rows that previously persisted only aggregate strength.
        var playerId = Guid.TryParse(player.Id, out var parsedId) ? parsedId : Guid.Empty;
        var bonusSkills = LegacyAppCompatibility.BuildRandomBonusSkills(playerId);
        var generated = LegacyAppCompatibility.BuildSkills(player.Strength, player.Position, player.Talent, player.Age, bonusSkills);
        SetSkills(player, generated);
        return true;
    }

    private static void RecalculatePlayerDerivedValues(TeamPlayerEntity player)
    {
        var skills = GetSkills(player);
        var playerId = Guid.TryParse(player.Id, out var parsedId) ? parsedId : Guid.Empty;
        var bonusSkills = LegacyAppCompatibility.BuildRandomBonusSkills(playerId);
        player.Strength = PlayerValueCalculator.CalculateStrength(skills, player.Position, player.Fitness, player.Age, player.Talent, bonusSkills);
        player.MarketValue = PlayerValueCalculator.CalculateMarketValue(skills, player.Position, player.Fitness, player.Age, player.Talent, bonusSkills);

        // Only initialize experience when it has not been set yet.
        // Experience is now a cumulative stat (gained from matches), so we avoid overwriting it.
        if (player.Experience <= 0m)
        {
            player.Experience = LegacyAppCompatibility.BuildExperience(player.Strength, player.Age, player.Matches);
        }
    }

    private static int NormalizeSkillIndex(int requestedIndex, string position)
    {
        if (requestedIndex >= 0 && requestedIndex < 14)
        {
            return requestedIndex;
        }

        return LegacyAppCompatibility.MainSkillIndex(position);
    }

    private static int NormalizeSkillCardIndex(int skill)
    {
        // The incoming SkillCardRecord should already be normalized to 0-based by the caller.
        // Clamp to avoid out-of-range values.
        return Math.Clamp(skill, 0, TeamStrengthCalculator.NumberOfSkills - 1);
    }

    private static bool TryGetCampBonusTarget(string? campType, out int skillIndex, out bool isExperience)
    {
        skillIndex = -1;
        isExperience = false;
        if (string.IsNullOrWhiteSpace(campType))
        {
            return false;
        }

        // Expected format: camp_{effect}_{variant}_{quality}
        // Example: camp_0_0_mid
        var parts = campType.Split('_');
        if (parts.Length < 3 || !string.Equals(parts[0], "camp", StringComparison.OrdinalIgnoreCase))
        {
            return false;
        }

        if (!int.TryParse(parts[1], out var effect) || !int.TryParse(parts[2], out var variant))
        {
            return false;
        }

        // Campaign mapping to skill indices (0-13), using the canonical skill ordering.
        // See: 0=Defence, 1=Keeping, 2=Shots, 3=Playmaking, 4=Passing, 5=Ball Control,
        // 6=Duel, 7=One on One, 8=Header, 9=Speed, 10=Flanks, 11=Cornerkick, 12=Freekicks, 13=Penalties
        switch (effect)
        {
            case 0:
                skillIndex = variant switch
                {
                    0 => 0,  // Defence
                    1 => 1,  // Keeping
                    2 => 2,  // Shots
                    3 => 3,  // Playmaking
                    _ => -1
                };
                break;
            case 1:
                skillIndex = variant switch
                {
                    0 => 4,  // Passing
                    1 => 5,  // Ball Control
                    2 => 6,  // Duel
                    3 => 7,  // One on One
                    4 => 8,  // Header
                    5 => 9,  // Speed
                    6 => 10, // Flanks
                    7 => 11, // Cornerkick
                    8 => 12, // Free Kicks
                    9 => 13, // Penalties
                    _ => -1
                };
                break;
            case 2:
                // Camp effect "experience" is a separate stat, not a skill index.
                isExperience = true;
                return true;
            default:
                return false;
        }

        return skillIndex >= 0;
    }

    private static bool TryResolveSkillIndex(string? skillName, out int index)
    {
        index = -1;
        if (string.IsNullOrWhiteSpace(skillName))
        {
            return false;
        }

        var key = skillName.Trim().ToLowerInvariant();
        if (key.Contains("parade") || key.Contains("goalkeeping") || key.Contains("keeper")) { index = 0; return true; }
        if (key.Contains("manndeckung") || key.Contains("deck") || key.Contains("defend")) { index = 1; return true; }
        if (key.Contains("zweikampf") || key.Contains("duell") || key.Contains("tackle")) { index = 2; return true; }
        if (key.Contains("abschluss") || key.Contains("finish") || key.Contains("shot")) { index = 3; return true; }
        if (key.Contains("dribbel")) { index = 4; return true; }
        if (key.Contains("pass")) { index = 5; return true; }
        if (key.Contains("flanke") || key.Contains("cross")) { index = 6; return true; }
        if (key.Contains("lauf") || key.Contains("tempo") || key.Contains("speed")) { index = 7; return true; }
        if (key.Contains("ausdauer") || key.Contains("stamina")) { index = 8; return true; }
        if (key.Contains("technik") || key.Contains("tech")) { index = 9; return true; }
        if (key.Contains("einsatz") || key.Contains("aggress")) { index = 10; return true; }
        if (key.Contains("kopf") || key.Contains("header")) { index = 11; return true; }
        if (key.Contains("freisto") || key.Contains("freekick")) { index = 12; return true; }
        if (key.Contains("elfmeter") || key.Contains("penalty") || key.Contains("eckb") || key.Contains("corner")) { index = 13; return true; }

        return false;
    }

    private static void AddSkillGain(TeamPlayerEntity player, int skillIndex, decimal gain)
    {
        if (skillIndex < 0 || skillIndex > 13 || gain <= 0m)
        {
            return;
        }

        var skills = GetSkills(player);
        skills[skillIndex] = PlayerValueCalculator.ClampSkill(skills[skillIndex] + gain);
        SetSkills(player, skills);
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

    private void AddLedgerEntry(string userId, int matchday, DateTime date, string bookingType, decimal value, string description, bool isEarning)
    {
        dbContext.TeamFinanceLedger.Add(new TeamFinanceLedgerEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            UserId = userId,
            Matchday = matchday,
            Date = date,
            BookingType = bookingType,
            Value = value,
            Description = description,
            IsEarning = isEarning
        });
    }

    private void RecordBuildingCost(string userId, int matchday, DateTime date, string buildingName, int level, decimal costPerLevel, ref decimal totalExpense, TeamResourcesEntity resources)
    {
        if (level <= 0) return;
        var cost = level * costPerLevel;
        AddLedgerEntry(userId, matchday, date, "Stadion", cost, $"{buildingName} Stufe {level}", false);
        resources.Money -= cost;
        totalExpense += cost;
    }

    private static readonly string[] GermanMonths =
        ["Januar", "Februar", "März", "April", "Mai", "Juni", "Juli", "August", "September", "Oktober", "November", "Dezember"];

    private static string PositionGerman(string pos) => pos switch
    {
        "GK" => "Torwart",
        "DEF" => "Verteidigung",
        "MID" => "Mittelfeld",
        "FWD" => "Angriff",
        _ => pos
    };

    private void AddTrainingReportMail(
        string userId,
        IReadOnlyList<TeamPlayerEntity> players,
        Dictionary<string, decimal> preStrengths,
        Dictionary<string, int> preFitness,
        TeamTrainingStateEntity training,
        decimal preTeamStrength,
        decimal postTeamStrength,
        DateTime tickDate)
    {
        var teamDelta = postTeamStrength - preTeamStrength;
        var teamStrInt = (int)Math.Round(postTeamStrength);

        // Motivation text based on training staleness
        var staleDays = training.TrainingChangedAtUtc.HasValue
            ? (int)(tickDate.Date - training.TrainingChangedAtUtc.Value.Date).TotalDays
            : 0;
        var motivation = staleDays switch
        {
            <= 2 => "Durch dein abwechslungsreiches Training sind deine Spieler top-motiviert und können zu Höchstformen aufsteigen!",
            <= 5 => "Die Spieler sind noch motiviert, würden sich aber über Abwechslung freuen, sonst könnte ihr Trainingsforschritt sich verlangsamen.",
            _ => "Deine Spieler sind gelangweilt davon, immer wieder dasselbe zu trainieren und ihr Trainingsfortschritt lässt nach. Bringe mehr Abwechslung in dein Training!"
        };

        var hasCamp = training.CampActiveUntilUtc.HasValue && training.CampActiveUntilUtc.Value.Date >= tickDate.Date;

        var sb = new System.Text.StringBuilder(4096);
        sb.Append("\r\n<html>\r\n<head>\r\n<meta charset=\"utf-8\">\r\n<style type=\"text/css\">\r\n");
        sb.Append(".icon { height: 1em; vertical-align: middle; }\r\n");
        sb.Append(".good { color: #00aa00; }\r\n.bad { color: #ff0000; }\r\n");
        sb.Append(".detailtable { width: 100%; } .detailtable th { text-align: left; } .detailtable th, .detailtable td { border-bottom: 1px solid #777; padding: 0.5em; }\r\n");
        sb.Append(".middle { vertical-align: middle; }\r\n\r\n.title {\r\npadding: 0.5em;\r\ntext-align: center;\r\nfont-weight: bold;\r\n}\r\n");
        sb.Append(".total {\r\nbackground-color: #cceecc;\r\nfont-size: 1em;\r\n}\r\n");
        sb.Append(".icon2 {\r\nheight: 1.3em;\r\nvertical-align: middle;\r\n}\r\n");
        sb.Append("</style>\r\n</head>\r\n<body>\r\n");
        sb.Append($"<p>Hey Chef,</p><p>{motivation}</p>");
        sb.Append("<p>Folgende Spieler haben das heutige Training mit bravour absolviert und sind in guter Verfassung:</p>\r\n");

        // Main table
        sb.Append("<table class=\"detailtable\" cellspacing=\"0\">\r\n");
        sb.Append($"<tr class=\"total\">\r\n<th colspan=\"3\">Team strength</th>\r\n");
        sb.Append($"<th colspan=\"2\"><img class=\"icon2\" src=\"[Stars_{teamStrInt}]\" />&nbsp;");
        sb.Append($"<span class=\"middle\">{postTeamStrength:N2}&nbsp;&nbsp;");
        if (teamDelta >= 0)
            sb.Append($"<img class=\"icon\" src=\"[ArrowUp]\" />&nbsp;<span class=\"good\">+{teamDelta:N2}</span>");
        else
            sb.Append($"<img class=\"icon\" src=\"[ArrowDown]\" />&nbsp;<span class=\"bad\">{teamDelta:N2}</span>");
        sb.Append("</span></th>\r\n</tr>\r\n");
        sb.Append("<tr>\r\n<th>Spielername (Position)</th>\r\n<th>Alter</th>\r\n<th>Talent</th>\r\n<th>Form</th>\r\n<th>Stärke</th>\r\n</tr>\r\n");

        var sorted = players.OrderBy(p => p.Position switch { "GK" => 0, "DEF" => 1, "MID" => 2, _ => 3 }).ThenBy(p => p.Name);
        foreach (var player in sorted)
        {
            var strengthBefore = preStrengths.GetValueOrDefault(player.Id, player.Strength);
            var fitBefore = preFitness.GetValueOrDefault(player.Id, player.Fitness);
            var sDelta = player.Strength - strengthBefore;
            var fDelta = player.Fitness - fitBefore;
            var sInt = (int)Math.Round(player.Strength);

            sb.Append("\r\n<tr>\r\n");
            sb.Append($"<td>{System.Net.WebUtility.HtmlEncode(player.Name)}<br />({PositionGerman(player.Position)})</td>\r\n");
            sb.Append($"<td><b>{player.Age}</b></td>\r\n");
            sb.Append($"<td><b>{player.Talent}</b></td>\r\n");

            // Form (Fitness)
            sb.Append($"<td>{player.Fitness:N2}<br />");
            if (fDelta > 0)
                sb.Append($"&nbsp;<img class=\"icon\" src=\"[ArrowUp]\" />&nbsp;<span class=\"good\">+{(decimal)fDelta:N2}</span>");
            sb.Append("</td>\r\n");

            // Stärke (Strength)
            sb.Append($"<td><img class=\"icon\" src=\"[Stars_{sInt}]\" /><br />{player.Strength:N2}<br />");
            if (sDelta > 0)
                sb.Append($"&nbsp;<img class=\"icon\" src=\"[ArrowUp]\" />&nbsp;<span class=\"good\">+{sDelta:N2}</span>");
            sb.Append("</td>\r\n</tr>\r\n");
        }
        sb.Append("\r\n</table>\r\n");

        // Camp section
        if (hasCamp)
        {
            var campName = training.CampType switch
            {
                "altitude" => "Höhentrainingslager",
                "beach" => "Strandtrainingslager",
                "forest" => "Waldtrainingslager",
                _ => "Trainingslager"
            };
            sb.Append($"<br />\r\n<div class=\"title\">Trainingslager ({campName})</div>\r\n");
            sb.Append("<table class=\"detailtable\" cellspacing=\"0\">\r\n");
            sb.Append("<tr>\r\n<th>Spielername (Position)</th>\r\n<th>Fähigkeit</th>\r\n<th>Fortschritt</th>\r\n</tr>\r\n");
            foreach (var player in sorted)
            {
                sb.Append($"\r\n<tr>\r\n<td>{System.Net.WebUtility.HtmlEncode(player.Name)}<br />({PositionGerman(player.Position)})</td>\r\n");
                sb.Append("<td>Erfahrung</td>\r\n");
                sb.Append($"<td>{player.Strength:N2}<br />&nbsp;<img class=\"icon\" src=\"[ArrowUp]\" />&nbsp;<span class=\"good\">+1.50</span></td>\r\n</tr>\r\n");
            }
            sb.Append("\r\n</table>\r\n");
        }

        // Individual training section
        var individualPlayers = players.Where(p =>
            !string.IsNullOrWhiteSpace(p.IndividualTrainingSkill)
            && p.IndividualTrainingUntilUtc.HasValue
            && p.IndividualTrainingUntilUtc.Value.Date >= tickDate.Date)
            .OrderBy(p => p.Position switch { "GK" => 0, "DEF" => 1, "MID" => 2, _ => 3 })
            .ThenBy(p => p.Name)
            .ToList();

        if (individualPlayers.Count > 0)
        {
            sb.Append("<br />\r\n<div class=\"title\">Einzeltraining</div>\r\n");
            sb.Append("<table class=\"detailtable\" cellspacing=\"0\">\r\n");
            sb.Append("<tr>\r\n<th>Spielername (Position)</th>\r\n<th>Fähigkeit</th>\r\n<th>Fortschritt</th>\r\n</tr>\r\n");
            foreach (var player in individualPlayers)
            {
                var indGain = trainingProgress.CalculateIndividualGainPublic(player.Age, player.Talent, player.Fitness);
                sb.Append($"\r\n<tr>\r\n<td>{System.Net.WebUtility.HtmlEncode(player.Name)}<br />({PositionGerman(player.Position)})</td>\r\n");
                sb.Append($"<td>{System.Net.WebUtility.HtmlEncode(player.IndividualTrainingSkill!)}</td>\r\n");
                sb.Append($"<td>{player.Strength:N2}<br />&nbsp;<img class=\"icon\" src=\"[ArrowUp]\" />&nbsp;<span class=\"good\">+{indGain:N2}</span></td>\r\n</tr>\r\n");
            }
            sb.Append("\r\n</table>\r\n");
        }

        sb.Append("<br /><br />\r\n<p>Viele Grüße,<br />Coach Johnson.</p>\r\n</body>\r\n</html>\r\n");

        dbContext.TeamMail.Add(new TeamMailEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            UserId = userId,
            DateText = tickDate.ToString("yyyy-MM-ddT06:00:00.0000000"),
            Subject = $"Trainingsreport vom {tickDate.Day} {GermanMonths[tickDate.Month - 1]}",
            Sender = "Coach Johnson",
            Message = sb.ToString(),
            IsNew = true,
            SenderType = 1
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

    private static decimal GetSeatUpgradeCost(Guid placeId)
    {
        // Flat per-block costs: Stand 10k/100 seats, Sit 30k/100 seats, VIP 2k/10 seats (20k/100)
        if (placeId == StadiumBuildingCatalog.StadiumStands) return 10_000m;
        if (placeId == StadiumBuildingCatalog.StadiumSeats) return 30_000m;
        if (placeId == StadiumBuildingCatalog.StadiumVips) return 2_000m;
        return 10_000m;
    }

    private static bool CanUpgrade(int level, int officeLevel)
    {
        if (level >= FacilityMaxLevel)
        {
            return false;
        }

        // Older client logic treated a facility as upgradable when its level
        // was strictly less than the office level.  The decompiled comment
        // suggested "requiredOfficeLevel = building.Level + 1" which meant
        // you needed the office one level higher than the thing you were
        // trying to upgrade.  The Xamarin frontend did its own check using
        // the raw level from the server, so offices of level 1 would block
        // every other building (level 1 &gt;= 2 is false) and the stadium
        // entries were effectively forever locked because the returned
        // `Level` for them was a large seat count.
        //
        // We now simplify the rule to match the expected behaviour: the
        // office must be at least as high as the thing being upgraded.  A
        // level‑1 office therefore allows all other facilities at level 1.
        return officeLevel >= level;
    }

    private bool CanUpgradeStadium(TeamResourcesEntity resources, int officeLevel, int leagueTier, Guid placeId)
    {
        if (officeLevel < 1)
        {
            return false;
        }

        var caps = stadiumEconomy.GetSeatCaps(leagueTier);

        return placeId switch
        {
            _ when placeId == StadiumBuildingCatalog.StadiumVips => resources.StadiumVipSeats + 10 <= caps.MaxVipSeats,
            _ when placeId == StadiumBuildingCatalog.StadiumSeats => resources.StadiumSitSeats + 100 <= caps.MaxSitSeats,
            _ when placeId == StadiumBuildingCatalog.StadiumStands => true,
            _ => false
        };
    }

    private static (bool Success, decimal Cost, int CurrentLevel, int NewLevel, string BuildingType) TryUpgradeFacility(
        TeamResourcesEntity resources,
        int officeLevel,
        Func<TeamResourcesEntity, int> getter,
        Guid seed,
        string buildingType)
    {
        var level = getter(resources);
        if (!CanUpgrade(level, officeLevel))
        {
            return (false, 0m, level, level, buildingType);
        }

        var cost = GetFacilityUpgradeCost(level, seed, 12_000m, 2_400m);
        return (true, cost, level, level + 1, buildingType);
    }

    public async Task<IReadOnlyList<SquadPlayerRecord>> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var now = DateTime.UtcNow;
        var players = await dbContext.TeamPlayers.AsNoTracking()
            .Where(x => x.TeamId == team.TeamId && x.IsScouted && (x.ScoutingReadyAtUtc == null || x.ScoutingReadyAtUtc <= now))
            .ToListAsync(cancellationToken);
        return players.Select(MapPlayer).ToArray();
    }

    public async Task<IReadOnlyList<SquadPlayerRecord>> GetAllScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var players = await dbContext.TeamPlayers.AsNoTracking()
            .Where(x => x.TeamId == team.TeamId && x.IsScouted)
            .ToListAsync(cancellationToken);
        return players.Select(MapPlayer).ToArray();
    }

    public async Task<bool> AddScoutedPlayerAsync(string userId, string name, string origin, string position, int age, int talent, decimal strength, int fitness, bool isPremiumScouting = false, DateTime? readyAtUtc = null, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var playerId = Guid.NewGuid();
        var bonusSkills = LegacyAppCompatibility.BuildRandomBonusSkills(playerId);
        var skills = LegacyAppCompatibility.BuildSkills(strength, position, talent, age, bonusSkills);
        var entity = new TeamPlayerEntity
        {
            Id = playerId.ToString("N"),
            TeamId = team.TeamId,
            Name = name,
            Origin = origin,
            Position = position,
            ShirtNumber = 0,
            Age = age,
            Talent = talent,
            Fitness = fitness,
            IsScouted = true,
            IsPremiumScouting = isPremiumScouting,
            ScoutingReadyAtUtc = readyAtUtc,
            ContractEndUtc = DateTime.UtcNow.AddDays(90),
            Head = LegacyAppCompatibility.BuildHeadId(playerId),
            Body = LegacyAppCompatibility.BuildBodyId(playerId),
            Gloves = LegacyAppCompatibility.BuildGlovesId(playerId, position == "GK"),
            Shoes = LegacyAppCompatibility.BuildShoesId(playerId)
        };
        SetSkills(entity, skills);
        RecalculatePlayerDerivedValues(entity);

        dbContext.TeamPlayers.Add(entity);
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<bool> RecruitScoutedPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var key = playerId.ToString("N");
        var player = await dbContext.TeamPlayers
            .FirstOrDefaultAsync(x => x.TeamId == team.TeamId && x.Id == key && x.IsScouted, cancellationToken);

        if (player is null)
            return false;

        // Assign first free shirt number
        var usedNumbers = await dbContext.TeamPlayers
            .Where(x => x.TeamId == team.TeamId && !x.IsScouted)
            .Select(x => x.ShirtNumber)
            .ToListAsync(cancellationToken);

        var nextShirt = 1;
        while (usedNumbers.Contains(nextShirt)) nextShirt++;

        player.IsScouted = false;
        player.ShirtNumber = nextShirt;
        player.ScoutingReadyAtUtc = null;

        var squadPlayers = await dbContext.TeamPlayers
            .Where(x => x.TeamId == team.TeamId && !x.IsScouted)
            .ToListAsync(cancellationToken);
        foreach (var squadPlayer in squadPlayers)
        {
            EnsurePlayerSkillsInitialized(squadPlayer);
            RecalculatePlayerDerivedValues(squadPlayer);
        }

        var teamEntity = await dbContext.Teams.FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        teamEntity.Strength = RecalculateTeamStrength(squadPlayers);
        teamEntity.MarketValue = RecalculateTeamMarketValue(squadPlayers);

        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<bool> SpeedupScoutAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var key = playerId.ToString("N");
        var player = await dbContext.TeamPlayers
            .FirstOrDefaultAsync(x => x.TeamId == team.TeamId && x.Id == key && x.IsScouted && x.ScoutingReadyAtUtc > DateTime.UtcNow, cancellationToken);

        if (player is null)
            return false;

        player.ScoutingReadyAtUtc = DateTime.UtcNow;
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<int> GetPendingScoutCountAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var now = DateTime.UtcNow;
        return await dbContext.TeamPlayers.CountAsync(
            x => x.TeamId == team.TeamId && x.IsScouted && x.ScoutingReadyAtUtc > now,
            cancellationToken);
    }

    public async Task<bool> TrySpendMoneyAsync(string userId, decimal amount, string description, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        if (resources.Money < amount)
            return false;

        resources.Money -= amount;
        await AddFinanceHistoryAsync(userId, income: 0m, outcome: amount, resources.Money, cancellationToken);
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<bool> RemovePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var player = await dbContext.TeamPlayers.FirstOrDefaultAsync(
            x => x.TeamId == team.TeamId && x.Id == playerId.ToString("N"),
            cancellationToken);
        if (player is null)
            return false;

        dbContext.TeamPlayers.Remove(player);

        var remainingPlayers = await dbContext.TeamPlayers
            .Where(x => x.TeamId == team.TeamId && !x.IsScouted && x.Id != player.Id)
            .ToListAsync(cancellationToken);
        var teamEntity = await dbContext.Teams.FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        teamEntity.Strength = RecalculateTeamStrength(remainingPlayers);
        teamEntity.MarketValue = RecalculateTeamMarketValue(remainingPlayers);

        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<bool> UpgradePlayerStrengthAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        const int upgradeStarsCost = 200;
        const decimal skillBoost = 1m;

        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        if (resources.GTStars < upgradeStarsCost)
            return false;

        var player = await dbContext.TeamPlayers.FirstOrDefaultAsync(
            x => x.TeamId == team.TeamId && x.Id == playerId.ToString("N") && !x.IsScouted,
            cancellationToken);
        if (player is null)
            return false;

        if (player.Strength >= 700m)
            return false;

        resources.GTStars -= upgradeStarsCost;

        var mainSkillIndex = LegacyAppCompatibility.MainSkillIndex(player.Position);
        AddSkillGain(player, mainSkillIndex, skillBoost);
        RecalculatePlayerDerivedValues(player);

        var squadPlayers = await dbContext.TeamPlayers
            .Where(x => x.TeamId == team.TeamId && !x.IsScouted)
            .ToListAsync(cancellationToken);
        var teamEntity = await dbContext.Teams.FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        teamEntity.Strength = RecalculateTeamStrength(squadPlayers);
        teamEntity.MarketValue = RecalculateTeamMarketValue(squadPlayers);

        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<IReadOnlyList<SkillCardRecord>> GetSkillCardsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);

        var cards = await dbContext.TeamSkillCards.AsNoTracking()
            .Where(x => x.TeamId == team.TeamId)
            .ToListAsync(cancellationToken);

        // Do not auto-seed cards here; allow teams to have 0 cards.
        return cards.Select(x => new SkillCardRecord(x.Skill, x.Rarity, x.Count, x.Bonus)).ToArray();
    }

    public async Task AddSkillCardsAsync(string userId, IEnumerable<SkillCardRecord> cards, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);

        foreach (var card in cards)
        {
            var existing = await dbContext.TeamSkillCards.FirstOrDefaultAsync(
                x => x.TeamId == team.TeamId && x.Skill == card.Skill && x.Rarity == card.Rarity && x.Bonus == card.Bonus,
                cancellationToken);

            if (existing is null)
            {
                dbContext.TeamSkillCards.Add(new TeamSkillCardEntity
                {
                    Id = Guid.NewGuid().ToString("N"),
                    TeamId = team.TeamId,
                    Skill = card.Skill,
                    Rarity = card.Rarity,
                    Count = card.Count,
                    Bonus = card.Bonus
                });
            }
            else
            {
                existing.Count += card.Count;
            }
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<bool> UseSkillCardAsync(string userId, SkillCardRecord card, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var existing = await dbContext.TeamSkillCards.FirstOrDefaultAsync(
            x => x.TeamId == team.TeamId && x.Skill == card.Skill && x.Rarity == card.Rarity && x.Bonus == card.Bonus,
            cancellationToken);

        if (existing is null || existing.Count <= 0)
        {
            return false;
        }

        existing.Count--;
        if (existing.Count == 0)
        {
            dbContext.TeamSkillCards.Remove(existing);
        }

        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<bool> ApplySkillCardToPlayerAsync(string userId, Guid playerId, SkillCardRecord card, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var player = await dbContext.TeamPlayers.FirstOrDefaultAsync(
            x => x.TeamId == team.TeamId && x.Id == playerId.ToString("N") && !x.IsScouted,
            cancellationToken);
        if (player is null)
            return false;

        EnsurePlayerSkillsInitialized(player);

        // Apply the card bonus to the card's target skill index.
        // Legacy clients may send a 1-based skill index (1..14); normalize to 0-based.
        var skillIndex = NormalizeSkillCardIndex(card.Skill);
        Console.WriteLine($"[DEBUG] Applying skill card: skill={card.Skill}, computedIndex={skillIndex}, bonus={card.Bonus}");
        AddSkillGain(player, skillIndex, card.Bonus);
        RecalculatePlayerDerivedValues(player);

        // Update team strength / market value
        var squadPlayers = await dbContext.TeamPlayers
            .Where(x => x.TeamId == team.TeamId && !x.IsScouted)
            .ToListAsync(cancellationToken);
        var teamEntity = await dbContext.Teams.FirstAsync(x => x.Id == team.TeamId, cancellationToken);
        teamEntity.Strength = RecalculateTeamStrength(squadPlayers);
        teamEntity.MarketValue = RecalculateTeamMarketValue(squadPlayers);

        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<bool> HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        var resources = await dbContext.TeamResources.FirstAsync(x => x.TeamId == team.TeamId, cancellationToken);
        if (resources.Medipacks < 1)
            return false;

        var player = await dbContext.TeamPlayers.FirstOrDefaultAsync(
            x => x.TeamId == team.TeamId && x.Id == playerId.ToString("N") && !x.IsScouted,
            cancellationToken);
        if (player is null)
            return false;

        resources.Medipacks -= 1;
        player.Fitness = 100;
        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    private static IReadOnlyList<TeamPlayerEntity> BuildInitialPlayers(string teamId)
    {
        var seed = HashCode.Combine(teamId, "squad-seed");
        var random = new Random(seed);

        var result = new List<TeamPlayerEntity>(InitialSquadPositions.Length);
        for (var i = 0; i < InitialSquadPositions.Length; i++)
        {
            var position = InitialSquadPositions[i];
            var age = i < 4 ? random.Next(18, 24) : random.Next(18, 33);
            var talent = random.Next(4, 11);
            var fitness = random.Next(86, 101);
            var baseStrength = position switch
            {
                "GK" => 74m,
                "DEF" => 68m,
                "MID" => 69m,
                "FWD" => 70m,
                _ => 65m
            };
            var strength = Math.Clamp(baseStrength + random.Next(-6, 12) + (talent >= 9 ? random.Next(2, 10) : 0), 55m, 95m);
            var firstName = FirstNames[(random.Next(FirstNames.Length) + i) % FirstNames.Length];
            var lastName = LastNames[(random.Next(LastNames.Length) + (i * 3)) % LastNames.Length];
            var origin = Origins[(random.Next(Origins.Length) + i) % Origins.Length];

            var playerId = Guid.NewGuid();
            var player = new TeamPlayerEntity
            {
                Id = playerId.ToString("N"),
                TeamId = teamId,
                Name = $"{firstName} {lastName}",
                Origin = origin,
                Position = position,
                ShirtNumber = i + 1,
                Age = age,
                Talent = talent,
                Fitness = fitness,
                ContractEndUtc = DateTime.UtcNow.AddDays(random.Next(15, 90)),
                Head = LegacyAppCompatibility.BuildHeadId(playerId),
                Body = LegacyAppCompatibility.BuildBodyId(playerId),
                Gloves = LegacyAppCompatibility.BuildGlovesId(playerId, position == "GK"),
                Shoes = LegacyAppCompatibility.BuildShoesId(playerId)
            };

            var bonusSkills = LegacyAppCompatibility.BuildRandomBonusSkills(playerId);
            SetSkills(player, LegacyAppCompatibility.BuildSkills(strength, position, talent, age, bonusSkills));
            RecalculatePlayerDerivedValues(player);
            result.Add(player);
        }

        return result;
    }

    private static IReadOnlyList<SkillCardRecord> BuildInitialSkillCards(string teamId)
    {
        var seed = HashCode.Combine(teamId, "skill-cards");
        var rng = new Random(seed);
        var cards = new List<SkillCardRecord>(5);

        for (var i = 0; i < 5; i++)
        {
            var skill = rng.Next(0, 14);
            var rarity = rng.Next(0, 3);
            var bonus = rarity switch
            {
                0 => 0.5m,
                1 => 1.25m,
                2 => 2.5m,
                _ => 0.5m
            };

            cards.Add(new SkillCardRecord(skill, rarity, rng.Next(1, 4), bonus));
        }

        return cards;
    }

    private static SquadPlayerRecord MapPlayer(TeamPlayerEntity player)
    {
        var playerId = Guid.TryParse(player.Id, out var parsed) ? parsed : Guid.Empty;
        var head = string.IsNullOrWhiteSpace(player.Head) ? LegacyAppCompatibility.BuildHeadId(playerId) : player.Head;
        var body = string.IsNullOrWhiteSpace(player.Body) ? LegacyAppCompatibility.BuildBodyId(playerId) : player.Body;
        var gloves = string.IsNullOrWhiteSpace(player.Gloves) ? LegacyAppCompatibility.BuildGlovesId(playerId, player.Position == "GK") : player.Gloves;
        var shoes = string.IsNullOrWhiteSpace(player.Shoes) ? LegacyAppCompatibility.BuildShoesId(playerId) : player.Shoes;

        return new SquadPlayerRecord(
            playerId,
            player.Name,
            player.Origin,
            head,
            body,
            gloves,
            shoes,
            player.Position,
            player.ShirtNumber,
            player.Age,
            player.Talent,
            (int)Math.Round(player.Strength),
            player.Experience,
            player.MarketValue ?? 0m,
            player.Fitness,
            player.Matches,
            player.Goals,
            player.YellowCards,
            player.RedCards,
            GetSkills(player),
            player.IndividualTrainingSkill,
            player.IndividualTrainingUntilUtc,
            player.ContractEndUtc,
            player.IsPremiumScouting,
            player.ScoutingReadyAtUtc);
    }

    private static BuildPlaceRecord ToBuildPlace(Guid id, string type, int level, bool canBuild)
    {
        return new BuildPlaceRecord(id, type, level, canBuild);
    }

    private static bool HasActiveConstruction(TeamResourcesEntity resources)
    {
        return resources.ActiveConstructionEndUtc.HasValue;
    }

    private static void QueueConstruction(
        TeamResourcesEntity resources,
        Guid placeId,
        string buildingType,
        int currentValue,
        int newValue,
        decimal upgradeCost,
        decimal durationMinutes,
        DateTime nowUtc)
    {
        resources.ActiveConstructionId = Guid.NewGuid().ToString("N");
        resources.ActiveConstructionPlaceId = placeId.ToString("N");
        resources.ActiveConstructionType = buildingType;
        resources.ActiveConstructionCurrentValue = currentValue;
        resources.ActiveConstructionNewValue = newValue;
        resources.ActiveConstructionUpgradeCost = upgradeCost;
        resources.ActiveConstructionUpgradeCostPremium = Math.Round(upgradeCost / 50m, 2);
        resources.ActiveConstructionStartUtc = nowUtc;
        resources.ActiveConstructionEndUtc = nowUtc.AddMinutes((double)durationMinutes);
    }

    private void CompleteConstructionIfFinished(TeamResourcesEntity resources, DateTime nowUtc, string teamId)
    {
        if (!resources.ActiveConstructionEndUtc.HasValue || resources.ActiveConstructionEndUtc.Value > nowUtc)
        {
            return;
        }

        if (!Guid.TryParse(resources.ActiveConstructionPlaceId, out var placeId))
        {
            ClearConstruction(resources);
            return;
        }

        if (placeId == StadiumBuildingCatalog.Office)
        {
            resources.OfficeLevel = resources.ActiveConstructionNewValue;
        }
        else if (placeId == StadiumBuildingCatalog.TrainingCenter)
        {
            resources.TrainingCenterLevel = resources.ActiveConstructionNewValue;
        }
        else if (placeId == StadiumBuildingCatalog.MedicalCenter)
        {
            resources.MedicalCenterLevel = resources.ActiveConstructionNewValue;
        }
        else if (placeId == StadiumBuildingCatalog.YouthAcademy)
        {
            resources.YouthAcademyLevel = resources.ActiveConstructionNewValue;
        }
        else if (placeId == StadiumBuildingCatalog.FanShop)
        {
            resources.FanShopLevel = resources.ActiveConstructionNewValue;
        }
        else if (placeId == StadiumBuildingCatalog.Parking)
        {
            resources.ParkingLevel = resources.ActiveConstructionNewValue;
        }
        else if (placeId == StadiumBuildingCatalog.StadiumVips)
        {
            resources.StadiumVipSeats = resources.ActiveConstructionNewValue;
        }
        else if (placeId == StadiumBuildingCatalog.StadiumSeats)
        {
            resources.StadiumSitSeats = resources.ActiveConstructionNewValue;
        }
        else if (placeId == StadiumBuildingCatalog.StadiumStands)
        {
            resources.StadiumStandSeats = resources.ActiveConstructionNewValue;
        }

        dbContext.TeamNews.Add(new TeamNewsEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            TeamId = teamId,
            DateText = nowUtc.ToString("O"),
            Title = "Ausbau fertiggestellt",
            Text = $"{GetFacilityDisplayName(resources.ActiveConstructionType ?? string.Empty)} wurde soeben fertiggestellt."
        });

        ClearConstruction(resources);
    }

    private static void ClearConstruction(TeamResourcesEntity resources)
    {
        resources.ActiveConstructionId = null;
        resources.ActiveConstructionPlaceId = null;
        resources.ActiveConstructionType = null;
        resources.ActiveConstructionCurrentValue = 0;
        resources.ActiveConstructionNewValue = 0;
        resources.ActiveConstructionUpgradeCost = 0m;
        resources.ActiveConstructionUpgradeCostPremium = 0m;
        resources.ActiveConstructionStartUtc = null;
        resources.ActiveConstructionEndUtc = null;
    }

    private static ConstructionRecord? ToConstructionRecord(TeamResourcesEntity resources)
    {
        if (!resources.ActiveConstructionEndUtc.HasValue
            || !Guid.TryParse(resources.ActiveConstructionId, out var id)
            || !Guid.TryParse(resources.ActiveConstructionPlaceId, out var placeId))
        {
            return null;
        }

        return new ConstructionRecord(
            id,
            placeId,
            resources.ActiveConstructionType ?? string.Empty,
            resources.ActiveConstructionCurrentValue,
            resources.ActiveConstructionNewValue,
            resources.ActiveConstructionUpgradeCost,
            resources.ActiveConstructionUpgradeCostPremium,
            resources.ActiveConstructionStartUtc ?? resources.ActiveConstructionEndUtc.Value,
            resources.ActiveConstructionEndUtc.Value);
    }

    private void AddConstructionNews(string teamId, string buildingName, int newValue, DateTime? endUtc)
    {
        if (!endUtc.HasValue)
        {
            return;
        }

        dbContext.TeamNews.Add(new TeamNewsEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            TeamId = teamId,
            DateText = DateTime.UtcNow.ToString("O"),
            Title = "Gebäude ausbauen",
            Text = $"{buildingName} werden ausgebaut und sind voraussichtlich fertig {endUtc.Value:dd.MM.yyyy 'am' HH:mm}."
        });
    }

    private static decimal GetFacilityBuildDurationMinutes(int currentLevel)
    {
        const decimal minMinutes = 30m;
        const decimal maxMinutes = 50m * 60m;
        const int maxLevel = 19;

        var level = Math.Clamp(currentLevel, 0, maxLevel);

        // Exponential scaling from min to max over the full range of levels.
        // Use a growth factor so that `minMinutes * factor^maxLevel == maxMinutes`.
        var factor = Math.Pow((double)(maxMinutes / minMinutes), 1.0 / maxLevel);
        var minutes = minMinutes * (decimal)Math.Pow(factor, level);
        return Math.Round(minutes, 0);
    }

    private static decimal GetSeatBuildDurationMinutes(Guid placeId)
    {
        return placeId switch
        {
            _ when placeId == StadiumBuildingCatalog.StadiumVips => 50m,
            _ when placeId == StadiumBuildingCatalog.StadiumSeats => 120m,
            _ => 100m
        };
    }

    private static string GetSeatConstructionType(Guid placeId)
    {
        return placeId switch
        {
            _ when placeId == StadiumBuildingCatalog.StadiumVips => "StadiumVips",
            _ when placeId == StadiumBuildingCatalog.StadiumSeats => "StadiumSeats",
            _ => "StadiumStands"
        };
    }

    private static string GetSeatDisplayName(Guid placeId)
    {
        return placeId switch
        {
            _ when placeId == StadiumBuildingCatalog.StadiumVips => "VIP-Sitze",
            _ when placeId == StadiumBuildingCatalog.StadiumSeats => "Sitzplätze",
            _ => "Stehplätze"
        };
    }

    private static string GetFacilityDisplayName(string buildingType)
    {
        return buildingType switch
        {
            "Office" => "Geschäftsstelle",
            "TrainingCenter" => "Trainingsgelände",
            "MedicalCenter" => "Fitnessstudio",
            "YouthAcademy" => "Jugendzentrum",
            "FanShop" => "Fanshop",
            "Parking" => "Parkplätze",
            "StadiumVips" => "VIP-Sitze",
            "StadiumSeats" => "Sitzplätze",
            "StadiumStands" => "Stehplätze",
            _ => buildingType
        };
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

    public async Task<Guid> GetLeagueIdForTeamAsync(string teamId, CancellationToken cancellationToken = default)
    {
        var membership = await dbContext.LeagueTeams.AsNoTracking()
            .FirstOrDefaultAsync(x => x.TeamId == teamId, cancellationToken);

        if (membership is null)
            return Guid.Empty;

        return Guid.TryParse(membership.LeagueId, out var leagueId) ? leagueId : Guid.Empty;
    }

    private static TeamRecord ToRecord(TeamEntity team, string managerName, string userEmail, DateTime userCreatedAtUtc, DateTime? userLastActivityAtUtc)
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
            managerName,
            userEmail,
            userCreatedAtUtc,
            userLastActivityAtUtc,
            team.SelectedShirt,
            team.SelectedEmblem);
    }

    public async Task<IReadOnlyList<OwnedEquipmentRecord>> GetOwnedEquipmentAsync(string userId, CancellationToken cancellationToken = default)
    {
        await GetOrCreateMyTeamAsync(userId, cancellationToken);

        var items = await dbContext.TeamEquipment.AsNoTracking()
            .Where(x => x.UserId == userId)
            .ToListAsync(cancellationToken);
        return items.Select(x => new OwnedEquipmentRecord(x.Id, x.Image, x.EquipmentType, x.IsActive)).ToArray();
    }

    public async Task<bool> BuyEquipmentAsync(string userId, string image, string equipmentType, int starsCost, CancellationToken cancellationToken = default)
    {
        var resources = await dbContext.TeamResources.FirstOrDefaultAsync(
            x => dbContext.Teams.Any(t => t.Id == x.TeamId && t.UserId == userId), cancellationToken);
        if (resources is null || resources.GTStars < starsCost)
            return false;

        // Check if already owned
        var alreadyOwned = await dbContext.TeamEquipment.AnyAsync(
            x => x.UserId == userId && x.Image == image, cancellationToken);
        if (alreadyOwned)
            return false;

        resources.GTStars -= starsCost;

        dbContext.TeamEquipment.Add(new TeamEquipmentEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            UserId = userId,
            Image = image,
            EquipmentType = equipmentType,
            IsActive = false
        });

        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<bool> UseEquipmentAsync(string userId, string equipmentId, CancellationToken cancellationToken = default)
    {
        var item = await dbContext.TeamEquipment.FirstOrDefaultAsync(
            x => x.UserId == userId && x.Id == equipmentId, cancellationToken);
        if (item is null)
            return false;

        // Deactivate all items of the same type for this user
        var sameType = await dbContext.TeamEquipment
            .Where(x => x.UserId == userId && x.EquipmentType == item.EquipmentType && x.IsActive)
            .ToListAsync(cancellationToken);
        foreach (var s in sameType)
            s.IsActive = false;

        item.IsActive = true;

        // Update team's selected equipment
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (team is not null)
        {
            if (item.EquipmentType == "shirt")
                team.SelectedShirt = item.Image;
            else if (item.EquipmentType == "emblem")
                team.SelectedEmblem = item.Image;

            if (item.EquipmentType == "emblem")
            {
                var leagueSlots = await dbContext.LeagueTeams.Where(x => x.TeamId == team.Id).ToListAsync(cancellationToken);
                foreach (var slot in leagueSlots)
                {
                    slot.Logo = item.Image;
                }

                var ladderEntries = await dbContext.LadderEntries.Where(x => x.TeamId == team.Id).ToListAsync(cancellationToken);
                foreach (var entry in ladderEntries)
                {
                    entry.TeamLogo = item.Image;
                }
            }
        }

        await dbContext.SaveChangesAsync(cancellationToken);
        return true;
    }

    public async Task<(string? Shirt, string? Emblem)> GetSelectedEquipmentAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (team is null)
        {
            var created = await GetOrCreateMyTeamAsync(userId, cancellationToken);
            return (created.SelectedShirt, created.SelectedEmblem);
        }

        await EnsureDefaultEquipmentStateAsync(team, cancellationToken);
        return (team.SelectedShirt, team.SelectedEmblem);
    }

    private async Task EnsureDefaultEquipmentStateAsync(TeamEntity team, CancellationToken cancellationToken)
    {
        var changed = false;

        if (string.IsNullOrWhiteSpace(team.SelectedShirt) || !EquipmentCatalog.IsValidShirt(team.SelectedShirt))
        {
            team.SelectedShirt = DefaultShirt;
            changed = true;
        }

        if (string.IsNullOrWhiteSpace(team.SelectedEmblem) || !EquipmentCatalog.IsValidEmblem(team.SelectedEmblem))
        {
            team.SelectedEmblem = DefaultEmblem;
            changed = true;
        }

        var equipment = await dbContext.TeamEquipment.Where(x => x.UserId == team.UserId).ToListAsync(cancellationToken);

        var shirtItems = equipment.Where(x => x.EquipmentType == "shirt").ToList();
        var selectedShirtItem = shirtItems.FirstOrDefault(x => x.Image.Equals(team.SelectedShirt, StringComparison.OrdinalIgnoreCase));
        if (selectedShirtItem is null)
        {
            selectedShirtItem = new TeamEquipmentEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = team.UserId,
                Image = team.SelectedShirt!,
                EquipmentType = "shirt",
                IsActive = true
            };
            dbContext.TeamEquipment.Add(selectedShirtItem);
            changed = true;
        }

        var emblemItems = equipment.Where(x => x.EquipmentType == "emblem").ToList();
        var selectedEmblemItem = emblemItems.FirstOrDefault(x => x.Image.Equals(team.SelectedEmblem, StringComparison.OrdinalIgnoreCase));
        if (selectedEmblemItem is null)
        {
            selectedEmblemItem = new TeamEquipmentEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = team.UserId,
                Image = team.SelectedEmblem!,
                EquipmentType = "emblem",
                IsActive = true
            };
            dbContext.TeamEquipment.Add(selectedEmblemItem);
            changed = true;
        }

        foreach (var shirt in shirtItems)
        {
            var shouldBeActive = shirt.Image.Equals(team.SelectedShirt, StringComparison.OrdinalIgnoreCase);
            if (shirt.IsActive != shouldBeActive)
            {
                shirt.IsActive = shouldBeActive;
                changed = true;
            }
        }

        foreach (var emblem in emblemItems)
        {
            var shouldBeActive = emblem.Image.Equals(team.SelectedEmblem, StringComparison.OrdinalIgnoreCase);
            if (emblem.IsActive != shouldBeActive)
            {
                emblem.IsActive = shouldBeActive;
                changed = true;
            }
        }

        var leagueSlots = await dbContext.LeagueTeams.Where(x => x.TeamId == team.Id).ToListAsync(cancellationToken);
        foreach (var slot in leagueSlots)
        {
            if (!string.Equals(slot.Logo, team.SelectedEmblem, StringComparison.OrdinalIgnoreCase))
            {
                slot.Logo = team.SelectedEmblem!;
                changed = true;
            }
        }

        var ladderEntries = await dbContext.LadderEntries.Where(x => x.TeamId == team.Id).ToListAsync(cancellationToken);
        foreach (var entry in ladderEntries)
        {
            if (!string.Equals(entry.TeamLogo, team.SelectedEmblem, StringComparison.OrdinalIgnoreCase))
            {
                entry.TeamLogo = team.SelectedEmblem!;
                changed = true;
            }
        }

        if (changed)
        {
            await dbContext.SaveChangesAsync(cancellationToken);
        }
    }
}
