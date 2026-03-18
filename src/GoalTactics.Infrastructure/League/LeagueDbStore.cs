using System.Linq;
using GoalTactics.Application.League;
using GoalTactics.Application.Common;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.League;

public sealed class LeagueDbStore(GoalTacticsDbContext dbContext) : ILeagueStore
{
    private const int ClubsPerLeague = 16;

    public async Task<LeagueTableRecord> GetLeagueTableForUserAsync(string userId, Guid requestedLeagueId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateTeamAsync(userId, cancellationToken);

        await EnsureLeagueMembershipAsync(team, cancellationToken);

        LeagueEntity? league;
        if (requestedLeagueId != Guid.Empty)
        {
            league = await dbContext.Leagues.AsNoTracking().FirstOrDefaultAsync(x => x.Id == requestedLeagueId.ToString("N"), cancellationToken);
        }
        else
        {
            var membership = await dbContext.LeagueTeams.AsNoTracking().FirstAsync(x => x.TeamId == team.Id, cancellationToken);
            league = await dbContext.Leagues.AsNoTracking().FirstAsync(x => x.Id == membership.LeagueId, cancellationToken);
        }

        if (league is null)
        {
            throw new InvalidOperationException("League not found");
        }

        var teams = await dbContext.LeagueTeams.AsNoTracking().Where(x => x.LeagueId == league.Id).ToListAsync(cancellationToken);
        var sorted = teams
            .OrderByDescending(x => x.PointsHome + x.PointsAway)
            .ThenByDescending(x => (x.GoalsScoredHome + x.GoalsScoredAway) - (x.GoalsReceivedHome + x.GoalsReceivedAway))
            .ThenByDescending(x => x.GoalsScoredHome + x.GoalsScoredAway)
            .ThenBy(x => x.TeamName)
            .Select(x => new LeagueTableTeamRecord(
                Id: Guid.TryParse(x.TeamId, out var parsedTeamId) ? parsedTeamId : Guid.Parse(x.Id),
                Name: x.TeamName,
                Strength: x.Strength,
                Logo: x.Logo,
                Country: x.Country,
                IsOnline: x.IsOnline,
                IsMine: x.TeamId == team.Id,
                MatchesHome: x.MatchesHome,
                MatchesAway: x.MatchesAway,
                WinsHome: x.WinsHome,
                WinsAway: x.WinsAway,
                LossesHome: x.LossesHome,
                LossesAway: x.LossesAway,
                DrawsHome: x.DrawsHome,
                DrawsAway: x.DrawsAway,
                GoalsScoredHome: x.GoalsScoredHome,
                GoalsScoredAway: x.GoalsScoredAway,
                GoalsReceivedHome: x.GoalsReceivedHome,
                GoalsReceivedAway: x.GoalsReceivedAway,
                PointsHome: x.PointsHome,
                PointsAway: x.PointsAway))
            .ToArray();

        return new LeagueTableRecord(league.Name, league.Mount, league.Dismount, sorted);
    }

    private async Task<TeamEntity> GetOrCreateTeamAsync(string userId, CancellationToken cancellationToken)
    {
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (team is not null)
        {
            return team;
        }

        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken)
            ?? throw new InvalidOperationException("User not found for league initialization");

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
        await dbContext.SaveChangesAsync(cancellationToken);

        return team;
    }

    private async Task EnsureLeagueMembershipAsync(TeamEntity team, CancellationToken cancellationToken)
    {
        var existingMembership = await dbContext.LeagueTeams.FirstOrDefaultAsync(x => x.TeamId == team.Id, cancellationToken);
        if (existingMembership is not null)
        {
            // Keep the team's LeagueName/LeagueTier in sync with its current league.
            var league = await dbContext.Leagues.FirstOrDefaultAsync(x => x.Id == existingMembership.LeagueId, cancellationToken);
            if (league is not null && (team.LeagueName != league.Name || team.LeagueTier != league.Tier))
            {
                team.LeagueName = league.Name;
                team.LeagueTier = league.Tier;
                await dbContext.SaveChangesAsync(cancellationToken);
            }

            return;
        }

        var targetLeague = await FindOrCreateLeagueWithBotSlotAsync(cancellationToken);

        var botSlot = await dbContext.LeagueTeams
            .Where(x => x.LeagueId == targetLeague.Id && x.IsBot)
            .OrderBy(x => x.Id)
            .FirstOrDefaultAsync(cancellationToken);

        if (botSlot is null)
        {
            throw new InvalidOperationException("League has no available slot");
        }

        botSlot.IsBot = false;
        botSlot.TeamId = team.Id;
        botSlot.TeamName = team.Name;
        botSlot.IsOnline = true;
        botSlot.Strength = team.Strength;
        botSlot.Country = team.Country;
        botSlot.Logo = team.SelectedEmblem ?? LegacyAppCompatibility.BuildLogoId(team.Id);

        team.LeagueName = targetLeague.Name;
        team.LeagueTier = targetLeague.Tier;

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private static int GetMaxGroupsForTier(int tier) => tier switch
    {
        1 => 1,
        2 => 5,
        3 => 15,
        _ => 15 * (1 << (tier - 3))
    };

    internal async Task<LeagueEntity> FindOrCreateLeagueWithBotSlotAsync(CancellationToken cancellationToken)
    {
        // Always prefer the highest leagues (lowest tier number) that still have an available bot slot.
        var leagueWithSlot = await dbContext.Leagues
            .Include(x => x.Teams)
            .OrderBy(x => x.Tier)
            .ThenBy(x => x.GroupNumber)
            .FirstOrDefaultAsync(x => x.Teams.Any(t => t.IsBot), cancellationToken);

        if (leagueWithSlot is not null)
        {
            // If the lowest existing tier is higher than 1 (e.g. only tier 3 exists),
            // create the missing lower tiers before assigning a user.
            var minExistingTier = await dbContext.Leagues.MinAsync(x => x.Tier, cancellationToken);
            if (minExistingTier > 1)
            {
                for (var missing = 1; missing < minExistingTier; missing++)
                {
                    await EnsureLeaguesExistForTierAsync(missing, cancellationToken);
                }

                // Re-evaluate which league has the earliest bot slot after filling in the missing tiers.
                leagueWithSlot = await dbContext.Leagues
                    .Include(x => x.Teams)
                    .OrderBy(x => x.Tier)
                    .ThenBy(x => x.GroupNumber)
                    .FirstOrDefaultAsync(x => x.Teams.Any(t => t.IsBot), cancellationToken);
            }

            // Ensure that once a tier is in use, all its groups are created (filled with placeholder bots).
            if (leagueWithSlot is not null)
            {
                await EnsureLeaguesExistForTierAsync(leagueWithSlot.Tier, cancellationToken);
                return leagueWithSlot;
            }
        }

        // No existing league has a bot slot; create the next tier (or remaining groups in a tier) as needed.
        // We create full tiers (all groups) as soon as the tier becomes active.
        var existingLeagues = await dbContext.Leagues.AsNoTracking().ToListAsync(cancellationToken);

        // If we have no leagues at all, start with tier 1.
        if (existingLeagues.Count == 0)
        {
            await EnsureLeaguesExistForTierAsync(1, cancellationToken);
        }
        else
        {
            // If the existing leagues start at a higher tier (e.g., only tier 3 exists),
            // create missing lower tiers first so users always start at tier 1.
            var tiersPresent = existingLeagues.Select(x => x.Tier).Distinct().OrderBy(t => t).ToList();
            var minTier = tiersPresent.First();
            if (minTier > 1)
            {
                for (var missingTier = 1; missingTier < minTier; missingTier++)
                {
                    await EnsureLeaguesExistForTierAsync(missingTier, cancellationToken);
                }

                // Refresh league list after creating the missing tiers.
                existingLeagues = await dbContext.Leagues.AsNoTracking().ToListAsync(cancellationToken);
                tiersPresent = existingLeagues.Select(x => x.Tier).Distinct().OrderBy(t => t).ToList();
            }

            // Determine the lowest tier that is not yet "full" (either missing groups or still has a bot slot).
            int? tierToActivate = null;
            foreach (var tier in tiersPresent)
            {
                var tierLeagues = existingLeagues.Where(x => x.Tier == tier).ToList();
                var maxGroups = GetMaxGroupsForTier(tier);

                // If the tier isn't fully created yet, create the missing groups and return the first available.
                if (tierLeagues.Count < maxGroups)
                {
                    tierToActivate = tier;
                    break;
                }

                // If tier is fully created but has no remaining bot slot, continue to next tier.
                var tierHasBotSlot = await dbContext.Leagues
                    .Include(x => x.Teams)
                    .Where(x => x.Tier == tier)
                    .AnyAsync(x => x.Teams.Any(t => t.IsBot), cancellationToken);
                if (tierHasBotSlot)
                {
                    // This should have been caught earlier by the initial query, but keep defensive.
                    leagueWithSlot = await dbContext.Leagues
                        .Include(x => x.Teams)
                        .Where(x => x.Tier == tier)
                        .OrderBy(x => x.GroupNumber)
                        .FirstAsync(x => x.Teams.Any(t => t.IsBot), cancellationToken);
                    return leagueWithSlot;
                }

                // Otherwise, tier is full and all teams are humans; go to next tier.
            }

            if (tierToActivate is null)
            {
                // All existing tiers are completely filled with humans; start next tier.
                var nextTier = tiersPresent.Max() + 1;
                tierToActivate = nextTier;
            }

            await EnsureLeaguesExistForTierAsync(tierToActivate.Value, cancellationToken);
        }

        // At this point we should have at least one league with a bot slot.
        leagueWithSlot = await dbContext.Leagues
            .Include(x => x.Teams)
            .OrderBy(x => x.Tier)
            .ThenBy(x => x.GroupNumber)
            .FirstOrDefaultAsync(x => x.Teams.Any(t => t.IsBot), cancellationToken);

        if (leagueWithSlot is null)
            throw new InvalidOperationException("Failed to create a league with an available bot slot.");

        return leagueWithSlot;
    }

    private async Task EnsureLeaguesExistForTierAsync(int tier, CancellationToken cancellationToken)
    {
        var maxGroups = GetMaxGroupsForTier(tier);

        var existingGroups = await dbContext.Leagues
            .AsNoTracking()
            .Where(x => x.Tier == tier)
            .Select(x => x.GroupNumber)
            .ToListAsync(cancellationToken);

        var missingGroups = Enumerable.Range(1, maxGroups).Except(existingGroups).ToList();
        if (!missingGroups.Any())
            return;

        foreach (var groupNumber in missingGroups.OrderBy(x => x))
        {
            CreateLeagueEntities(tier, groupNumber);
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private void CreateLeagueEntities(int tier, int groupNumber)
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
                _ => 3
            },
            Dismount = tier switch
            {
                1 => 5,
                2 => 6,
                3 => 6,
                _ => 6
            }
        };

        dbContext.Leagues.Add(league);

        var seed = HashCode.Combine(tier, groupNumber);
        var random = new Random(seed);
        for (var i = 1; i <= ClubsPerLeague; i++)
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

    private async Task<LeagueEntity> CreateLeagueAsync(int tier, int groupNumber, CancellationToken cancellationToken)
    {
        CreateLeagueEntities(tier, groupNumber);
        await dbContext.SaveChangesAsync(cancellationToken);

        // Schedule generation is deferred until a client requests matches in this league.
        return await dbContext.Leagues.AsNoTracking().FirstAsync(x => x.Tier == tier && x.GroupNumber == groupNumber, cancellationToken);
    }

    /// <summary>
    /// Generates a full round-robin schedule (home and away) for 16 teams.
    /// 30 matchdays, 8 matches per matchday.
    /// </summary>
    private void GenerateRoundRobinSchedule(string leagueId, List<LeagueTeamEntity> teams)
    {
        var n = teams.Count; // 16
        if (n < 2 || n % 2 != 0)
            throw new InvalidOperationException("Round-robin scheduling requires an even number of teams.");

        // Schedule matchdays to happen once per day at a fixed UTC time.
        // Ensures stable daily fixture times and avoids scheduling matches in the past.
        var now = DateTime.UtcNow;
        var firstMatchUtc = now.Date.AddHours(18);
        if (now >= firstMatchUtc)
        {
            firstMatchUtc = firstMatchUtc.AddDays(1);
        }

        // Use a standard "circle method" (Berger tables) to generate a valid round-robin.
        // This ensures:
        //  - no team is paired with itself
        //  - every pair meets exactly once per half
        //  - home/away assignment is balanced across the season.
        var allTeams = teams.ToArray();
        var fixedTeam = allTeams[^1];
        var rotating = allTeams.Take(n - 1).ToArray();

        var schedule = new List<(int matchday, LeagueTeamEntity home, LeagueTeamEntity away)>();
        for (var round = 0; round < n - 1; round++)
        {
            var matchday = round + 1;

            // Pair the fixed team with one rotating team.
            // Alternate home/away each round so the fixed team isn't always at home.
            var rotatingIndex = round % (n - 1);
            if (round % 2 == 0)
                schedule.Add((matchday, rotating[rotatingIndex], fixedTeam));
            else
                schedule.Add((matchday, fixedTeam, rotating[rotatingIndex]));

            // Pair the remaining rotating teams.
            for (var i = 1; i < n / 2; i++)
            {
                var first = rotating[(round + i) % (n - 1)];
                var second = rotating[(round + (n - 1) - i) % (n - 1)];

                // Alternate home/away to keep balance.
                if (i % 2 == 0)
                    schedule.Add((matchday, first, second));
                else
                    schedule.Add((matchday, second, first));
            }
        }

        // Second half: reverse home/away, matchdays 16..30
        var firstHalf = schedule.ToList();
        foreach (var (matchday, home, away) in firstHalf)
        {
            schedule.Add((matchday + n - 1, away, home));
        }

        // Create match entities
        foreach (var (matchday, home, away) in schedule)
        {
            dbContext.LeagueMatches.Add(new LeagueMatchEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                LeagueId = leagueId,
                Matchday = matchday,
                HomeLeagueTeamId = home.Id,
                AwayLeagueTeamId = away.Id,
                HomeTeamName = home.TeamName,
                AwayTeamName = away.TeamName,
                HomeLogo = home.Logo,
                AwayLogo = away.Logo,
                HomeCountry = home.Country,
                AwayCountry = away.Country,
                HomeStrength = (int)home.Strength,
                AwayStrength = (int)away.Strength,
                IsPlayed = false,
                ScheduledDateUtc = firstMatchUtc.AddDays(matchday - 1)
            });
        }
    }

    public async Task<IReadOnlyList<LeagueMatchRecord>> GetMatchesForUserAsync(string userId, Guid requestedLeagueId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateTeamAsync(userId, cancellationToken);
        await EnsureLeagueMembershipAsync(team, cancellationToken);

        string leagueId;
        if (requestedLeagueId != Guid.Empty)
        {
            leagueId = requestedLeagueId.ToString("N");
        }
        else
        {
            var membership = await dbContext.LeagueTeams.AsNoTracking().FirstAsync(x => x.TeamId == team.Id, cancellationToken);
            leagueId = membership.LeagueId;
        }

        // Ensure schedule exists
        var hasMatches = await dbContext.LeagueMatches.AnyAsync(x => x.LeagueId == leagueId, cancellationToken);
        if (!hasMatches)
        {
            var leagueTeams = await dbContext.LeagueTeams.Where(x => x.LeagueId == leagueId).ToListAsync(cancellationToken);
            if (leagueTeams.Count >= 2)
            {
                GenerateRoundRobinSchedule(leagueId, leagueTeams);
                await dbContext.SaveChangesAsync(cancellationToken);
            }
        }

        var matches = await dbContext.LeagueMatches
            .AsNoTracking()
            .Where(x => x.LeagueId == leagueId)
            .OrderBy(x => x.Matchday)
            .ThenBy(x => x.Id)
            .ToListAsync(cancellationToken);

        // Build a lookup from league_team_id to real team_id
        var leagueTeamIds = matches.SelectMany(m => new[] { m.HomeLeagueTeamId, m.AwayLeagueTeamId }).Distinct().ToList();
        var leagueTeamLookup = await dbContext.LeagueTeams
            .AsNoTracking()
            .Where(x => leagueTeamIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id, cancellationToken);

        return matches.Select(m =>
        {
            var homeTeamId = leagueTeamLookup.TryGetValue(m.HomeLeagueTeamId, out var ht) ? ht.TeamId ?? m.HomeLeagueTeamId : m.HomeLeagueTeamId;
            var awayTeamId = leagueTeamLookup.TryGetValue(m.AwayLeagueTeamId, out var at) ? at.TeamId ?? m.AwayLeagueTeamId : m.AwayLeagueTeamId;
            return new LeagueMatchRecord(
                Id: Guid.TryParse(m.Id, out var mid) ? mid : Guid.Empty,
                Matchday: m.Matchday,
                HomeName: ht?.TeamName ?? m.HomeTeamName ?? "Unknown",
                AwayName: at?.TeamName ?? m.AwayTeamName ?? "Unknown",
                HomeLogo: ht?.Logo ?? m.HomeLogo ?? "wappen01",
                AwayLogo: at?.Logo ?? m.AwayLogo ?? "wappen01",
                HomeCountry: ht?.Country ?? m.HomeCountry ?? "DE",
                AwayCountry: at?.Country ?? m.AwayCountry ?? "DE",
                HomeStrength: (int)(ht?.Strength ?? m.HomeStrength),
                AwayStrength: (int)(at?.Strength ?? m.AwayStrength),
                HomeScore: m.HomeScore,
                AwayScore: m.AwayScore,
                IsPlayed: m.IsPlayed,
                ScheduledDateUtc: m.ScheduledDateUtc,
                HomeTeamId: homeTeamId,
                AwayTeamId: awayTeamId,
                UserTeamId: team.Id);
        }).ToArray();
    }

    public async Task<LeagueMatchRecord?> GetMatchAsync(Guid matchId, CancellationToken cancellationToken = default)
    {
        var m = await dbContext.LeagueMatches.AsNoTracking().FirstOrDefaultAsync(x => x.Id == matchId.ToString("N"), cancellationToken);
        if (m is null) return null;

        var homeTeam = await dbContext.LeagueTeams.AsNoTracking().FirstOrDefaultAsync(x => x.Id == m.HomeLeagueTeamId, cancellationToken);
        var awayTeam = await dbContext.LeagueTeams.AsNoTracking().FirstOrDefaultAsync(x => x.Id == m.AwayLeagueTeamId, cancellationToken);

        return new LeagueMatchRecord(
            Id: Guid.TryParse(m.Id, out var mid) ? mid : Guid.Empty,
            Matchday: m.Matchday,
            HomeName: homeTeam?.TeamName ?? m.HomeTeamName ?? "Unknown",
            AwayName: awayTeam?.TeamName ?? m.AwayTeamName ?? "Unknown",
            HomeLogo: homeTeam?.Logo ?? m.HomeLogo ?? "wappen01",
            AwayLogo: awayTeam?.Logo ?? m.AwayLogo ?? "wappen01",
            HomeCountry: homeTeam?.Country ?? m.HomeCountry ?? "DE",
            AwayCountry: awayTeam?.Country ?? m.AwayCountry ?? "DE",
            HomeStrength: (int)(homeTeam?.Strength ?? m.HomeStrength),
            AwayStrength: (int)(awayTeam?.Strength ?? m.AwayStrength),
            HomeScore: m.HomeScore,
            AwayScore: m.AwayScore,
            IsPlayed: m.IsPlayed,
            ScheduledDateUtc: m.ScheduledDateUtc,
            HomeTeamId: homeTeam?.TeamId ?? m.HomeLeagueTeamId,
            AwayTeamId: awayTeam?.TeamId ?? m.AwayLeagueTeamId,
            UserTeamId: null,
            EventsJson: m.EventsJson);
    }

    public async Task<IReadOnlyList<LeagueMatchRecord>> GetUpcomingMatchesForTeamAsync(string teamId, CancellationToken cancellationToken = default)
    {
        // Find the league team entry for this team
        var leagueTeam = await dbContext.LeagueTeams.AsNoTracking().FirstOrDefaultAsync(x => x.TeamId == teamId, cancellationToken);
        if (leagueTeam is null) return [];

        // Ensure schedule exists
        var hasMatches = await dbContext.LeagueMatches.AnyAsync(x => x.LeagueId == leagueTeam.LeagueId, cancellationToken);
        if (!hasMatches)
        {
            var leagueTeams = await dbContext.LeagueTeams.Where(x => x.LeagueId == leagueTeam.LeagueId).ToListAsync(cancellationToken);
            if (leagueTeams.Count >= 2)
            {
                GenerateRoundRobinSchedule(leagueTeam.LeagueId, leagueTeams);
                await dbContext.SaveChangesAsync(cancellationToken);
            }
        }

        var matches = await dbContext.LeagueMatches
            .AsNoTracking()
            .Where(x => x.LeagueId == leagueTeam.LeagueId && !x.IsPlayed
                && (x.HomeLeagueTeamId == leagueTeam.Id || x.AwayLeagueTeamId == leagueTeam.Id))
            .OrderBy(x => x.ScheduledDateUtc)
            .Take(5)
            .ToListAsync(cancellationToken);

        var leagueTeamIds = matches.SelectMany(m => new[] { m.HomeLeagueTeamId, m.AwayLeagueTeamId }).Distinct().ToList();
        var lookup = await dbContext.LeagueTeams
            .AsNoTracking()
            .Where(x => leagueTeamIds.Contains(x.Id))
            .ToDictionaryAsync(x => x.Id, cancellationToken);

        return matches.Select(m =>
        {
            var ht = lookup.GetValueOrDefault(m.HomeLeagueTeamId);
            var at = lookup.GetValueOrDefault(m.AwayLeagueTeamId);
            return new LeagueMatchRecord(
                Id: Guid.TryParse(m.Id, out var mid) ? mid : Guid.Empty,
                Matchday: m.Matchday,
                HomeName: ht?.TeamName ?? m.HomeTeamName ?? "Unknown",
                AwayName: at?.TeamName ?? m.AwayTeamName ?? "Unknown",
                HomeLogo: ht?.Logo ?? m.HomeLogo ?? "wappen01",
                AwayLogo: at?.Logo ?? m.AwayLogo ?? "wappen01",
                HomeCountry: ht?.Country ?? m.HomeCountry ?? "DE",
                AwayCountry: at?.Country ?? m.AwayCountry ?? "DE",
                HomeStrength: (int)(ht?.Strength ?? m.HomeStrength),
                AwayStrength: (int)(at?.Strength ?? m.AwayStrength),
                HomeScore: m.HomeScore,
                AwayScore: m.AwayScore,
                IsPlayed: m.IsPlayed,
                ScheduledDateUtc: m.ScheduledDateUtc,
                HomeTeamId: ht?.TeamId ?? m.HomeLeagueTeamId,
                AwayTeamId: at?.TeamId ?? m.AwayLeagueTeamId,
                UserTeamId: teamId);
        }).ToArray();
    }

    public async Task EnsureScheduleForLeagueAsync(Guid leagueId, CancellationToken cancellationToken = default)
    {
        var leagueIdStr = leagueId.ToString("N");
        var hasMatches = await dbContext.LeagueMatches.AnyAsync(x => x.LeagueId == leagueIdStr, cancellationToken);
        if (hasMatches) return;

        var leagueTeams = await dbContext.LeagueTeams.Where(x => x.LeagueId == leagueIdStr).ToListAsync(cancellationToken);
        if (leagueTeams.Count < 2) return;

        GenerateRoundRobinSchedule(leagueIdStr, leagueTeams);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<GoalGetterRecord>> GetTopScorersAsync(Guid leagueId, int count, CancellationToken cancellationToken = default)
    {
        var lid = leagueId.ToString("N");

        // Get all team IDs in this league (real team IDs, not league team IDs)
        var leagueTeams = await dbContext.LeagueTeams.AsNoTracking()
            .Where(x => x.LeagueId == lid)
            .ToListAsync(cancellationToken);

        var teamIdToLeagueTeam = leagueTeams
            .Where(lt => lt.TeamId is not null)
            .ToDictionary(lt => lt.TeamId!, lt => lt);

        var realTeamIds = teamIdToLeagueTeam.Keys.ToList();

        // Query actual squad players with goals > 0 from teams in this league
        var topPlayers = await dbContext.TeamPlayers.AsNoTracking()
            .Where(p => realTeamIds.Contains(p.TeamId) && !p.IsScouted && p.Goals > 0)
            .OrderByDescending(p => p.Goals)
            .ThenByDescending(p => p.Strength)
            .Take(count)
            .ToListAsync(cancellationToken);

        return topPlayers.Select(p =>
        {
            var lt = teamIdToLeagueTeam.GetValueOrDefault(p.TeamId);
            return new GoalGetterRecord(
                PlayerId: Guid.TryParse(p.Id, out var pid) ? pid : Guid.Empty,
                PlayerName: p.Name,
                Origin: p.Origin,
                Head: "01_head-A01",
                Strength: p.Strength,
                Talent: p.Talent,
                Age: p.Age,
                Position: p.Position,
                Goals: p.Goals,
                TeamName: lt?.TeamName ?? "Unknown",
                TeamLogo: lt?.Logo ?? "wappen01",
                IsMine: false);
        }).ToArray();
    }

    public async Task ResolveMatchAsync(Guid matchId, int homeScore, int awayScore,
        IReadOnlyList<MatchScorerEvent> scorers, string? eventsJson, CancellationToken cancellationToken = default)
    {
        var match = await dbContext.LeagueMatches
            .FirstOrDefaultAsync(x => x.Id == matchId.ToString("N"), cancellationToken);
        if (match is null || match.IsPlayed) return;

        match.HomeScore = homeScore;
        match.AwayScore = awayScore;
        match.IsPlayed = true;
        match.PlayedAtUtc = DateTime.UtcNow;
        match.EventsJson = eventsJson;

        // Update league team statistics
        var homeTeam = await dbContext.LeagueTeams.FirstOrDefaultAsync(x => x.Id == match.HomeLeagueTeamId, cancellationToken);
        var awayTeam = await dbContext.LeagueTeams.FirstOrDefaultAsync(x => x.Id == match.AwayLeagueTeamId, cancellationToken);

        if (homeTeam is not null)
        {
            homeTeam.MatchesHome++;
            homeTeam.GoalsScoredHome += homeScore;
            homeTeam.GoalsReceivedHome += awayScore;
            if (homeScore > awayScore) { homeTeam.WinsHome++; homeTeam.PointsHome += 3; }
            else if (homeScore == awayScore) { homeTeam.DrawsHome++; homeTeam.PointsHome++; }
            else { homeTeam.LossesHome++; }
        }

        if (awayTeam is not null)
        {
            awayTeam.MatchesAway++;
            awayTeam.GoalsScoredAway += awayScore;
            awayTeam.GoalsReceivedAway += homeScore;
            if (awayScore > homeScore) { awayTeam.WinsAway++; awayTeam.PointsAway += 3; }
            else if (homeScore == awayScore) { awayTeam.DrawsAway++; awayTeam.PointsAway++; }
            else { awayTeam.LossesAway++; }
        }

        // Increment individual player goal counts
        foreach (var scorer in scorers)
        {
            var player = await dbContext.TeamPlayers
                .FirstOrDefaultAsync(p => p.Id == scorer.PlayerId && p.TeamId == scorer.TeamId, cancellationToken);
            if (player is not null)
            {
                player.Goals++;
                player.Matches++; // Also credit match appearance
            }
        }

        // Credit match appearances for all players in affected real teams
        var realTeamIds = new List<string>();
        if (homeTeam?.TeamId is not null) realTeamIds.Add(homeTeam.TeamId);
        if (awayTeam?.TeamId is not null) realTeamIds.Add(awayTeam.TeamId);

        if (realTeamIds.Count > 0)
        {
            var allPlayers = await dbContext.TeamPlayers
                .Where(p => realTeamIds.Contains(p.TeamId) && !p.IsScouted)
                .ToListAsync(cancellationToken);

            // Only count matches for players not already counted as scorers
            var scorerPlayerIds = scorers.Select(s => s.PlayerId).ToHashSet();
            foreach (var player in allPlayers.Where(p => !scorerPlayerIds.Contains(p.Id)))
            {
                player.Matches++;
            }
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }
}
