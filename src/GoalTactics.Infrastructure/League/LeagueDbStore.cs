using GoalTactics.Application.League;
using GoalTactics.Application.Common;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.League;

public sealed class LeagueDbStore(GoalTacticsDbContext dbContext) : ILeagueStore
{
    private const int ClubsPerLeague = 16;
    private const int PreferredHumanTier = 3;

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
        botSlot.Logo = LegacyAppCompatibility.BuildLogoId(team.Id);

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private async Task<LeagueEntity> FindOrCreateLeagueWithBotSlotAsync(CancellationToken cancellationToken)
    {
        var leagueWithSlot = await dbContext.Leagues
            .Include(x => x.Teams)
            .OrderBy(x => x.Tier == PreferredHumanTier ? 0 : 1)
            .ThenBy(x => x.Tier)
            .ThenBy(x => x.GroupNumber)
            .FirstOrDefaultAsync(x => x.Teams.Any(t => t.IsBot), cancellationToken);

        if (leagueWithSlot is not null)
        {
            return leagueWithSlot;
        }

        var allLeagues = await dbContext.Leagues.AsNoTracking().ToListAsync(cancellationToken);
        if (allLeagues.Count == 0)
        {
            return await CreateLeagueAsync(PreferredHumanTier, 1, cancellationToken);
        }

        var maxTier = allLeagues.Max(x => x.Tier);
        var maxTierLeagues = allLeagues.Where(x => x.Tier == maxTier).OrderBy(x => x.GroupNumber).ToList();
        var maxGroupsAllowedAtTier = 1 << (maxTier - 1);

        if (maxTierLeagues.Count < maxGroupsAllowedAtTier)
        {
            var nextGroup = maxTierLeagues.Count + 1;
            return await CreateLeagueAsync(maxTier, nextGroup, cancellationToken);
        }

        return await CreateLeagueAsync(maxTier + 1, 1, cancellationToken);
    }

    private async Task<LeagueEntity> CreateLeagueAsync(int tier, int groupNumber, CancellationToken cancellationToken)
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
        var leagueTeams = new List<LeagueTeamEntity>();
        for (var i = 1; i <= ClubsPerLeague; i++)
        {
            var lt = new LeagueTeamEntity
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
            };
            leagueTeams.Add(lt);
            dbContext.LeagueTeams.Add(lt);
        }

        await dbContext.SaveChangesAsync(cancellationToken);

        GenerateRoundRobinSchedule(league.Id, leagueTeams);
        await dbContext.SaveChangesAsync(cancellationToken);

        return league;
    }

    /// <summary>
    /// Generates a full round-robin schedule (home and away) for 16 teams.
    /// 30 matchdays, 8 matches per matchday.
    /// </summary>
    private void GenerateRoundRobinSchedule(string leagueId, List<LeagueTeamEntity> teams)
    {
        var n = teams.Count; // 16
        var seasonStart = DateTime.UtcNow.Date;

        // Standard round-robin: fix team[0], rotate the rest
        // First half: matchdays 1..15
        var teamIds = teams.Select(t => t).ToArray();
        var schedule = new List<(int matchday, LeagueTeamEntity home, LeagueTeamEntity away)>();

        // Round-robin algorithm: fix first team, rotate rest
        var rotating = new LeagueTeamEntity[n - 1];
        for (var i = 0; i < n - 1; i++)
            rotating[i] = teamIds[i + 1];

        for (var round = 0; round < n - 1; round++)
        {
            var matchday = round + 1;
            // First match: team[0] vs rotating[0]
            schedule.Add((matchday, teamIds[0], rotating[0]));

            // Pair remaining: rotating[1] vs rotating[n-2], rotating[2] vs rotating[n-3], etc.
            for (var j = 1; j < n / 2; j++)
            {
                var home = rotating[j];
                var away = rotating[n - 2 - j];
                schedule.Add((matchday, home, away));
            }

            // Rotate: move last element to position 0
            var last = rotating[n - 2];
            for (var j = n - 2; j > 0; j--)
                rotating[j] = rotating[j - 1];
            rotating[0] = last;
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
                ScheduledDateUtc = seasonStart.AddDays(matchday - 1).AddHours(18)
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
            UserTeamId: null);
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
}
