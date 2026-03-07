using GoalTactics.Application.League;
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
        botSlot.Logo = "logo_default";

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
        for (var i = 1; i <= ClubsPerLeague; i++)
        {
            var winsHome = random.Next(0, 8);
            var winsAway = random.Next(0, 8);
            var drawsHome = random.Next(0, 6);
            var drawsAway = random.Next(0, 6);
            var lossesHome = Math.Max(0, 15 - winsHome - drawsHome);
            var lossesAway = Math.Max(0, 15 - winsAway - drawsAway);
            var goalsScoredHome = random.Next(10, 35);
            var goalsScoredAway = random.Next(8, 30);
            var goalsReceivedHome = random.Next(10, 35);
            var goalsReceivedAway = random.Next(8, 30);
            var pointsHome = winsHome * 3 + drawsHome;
            var pointsAway = winsAway * 3 + drawsAway;

            dbContext.LeagueTeams.Add(new LeagueTeamEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                LeagueId = league.Id,
                TeamId = null,
                TeamName = $"Bot FC {tier}-{groupNumber}-{i}",
                IsBot = true,
                Strength = random.Next(40, 85),
                Country = "DE",
                Logo = "logo_bot",
                IsOnline = false,
                MatchesHome = 15,
                MatchesAway = 15,
                WinsHome = winsHome,
                WinsAway = winsAway,
                LossesHome = lossesHome,
                LossesAway = lossesAway,
                DrawsHome = drawsHome,
                DrawsAway = drawsAway,
                GoalsScoredHome = goalsScoredHome,
                GoalsScoredAway = goalsScoredAway,
                GoalsReceivedHome = goalsReceivedHome,
                GoalsReceivedAway = goalsReceivedAway,
                PointsHome = pointsHome,
                PointsAway = pointsAway
            });
        }

        await dbContext.SaveChangesAsync(cancellationToken);
        return league;
    }
}
