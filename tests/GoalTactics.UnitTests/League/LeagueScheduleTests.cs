using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Team;
using GoalTactics.Infrastructure.League;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using GoalTactics.Infrastructure.Team;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace GoalTactics.UnitTests.League;

public class LeagueScheduleTests
{
    private GoalTacticsDbContext CreateContext(SqliteConnection conn)
    {
        var options = new DbContextOptionsBuilder<GoalTacticsDbContext>()
            .UseSqlite(conn)
            .Options;
        var ctx = new GoalTacticsDbContext(options);
        ctx.Database.OpenConnection();
        ctx.Database.EnsureCreated();
        return ctx;
    }

    [Fact]
    public async Task GenerateRoundRobin_ScheduleHasNoSelfMatchesAndBalancedHomeAway()
    {
        using var conn = new SqliteConnection("DataSource=:memory:");
        var ctx = CreateContext(conn);

        var leagueId = Guid.NewGuid();
        var league = new LeagueEntity
        {
            Id = leagueId.ToString("N"),
            Tier = 3,
            GroupNumber = 1,
            Name = "Test League",
            Mount = 0,
            Dismount = 0
        };
        ctx.Leagues.Add(league);

        // Create a human-managed team so GetMatchesForUserAsync can be invoked.
        var userId = "user1";
        var teamId = "t1";
        ctx.Users.Add(new UserEntity { Id = userId, ManagerName = "User 1", Email = "user1@example.com", PasswordHash = "", CreatedAtUtc = DateTime.UtcNow });
        ctx.Teams.Add(new TeamEntity { Id = teamId, UserId = userId, Name = "Team 1", Country = "DE", CountryName = "Germany", LeagueName = "Test", MarketValue = 0, Mood = 0, TeamMood = "", Wins = 0, Losses = 0, Fans = 0, Members = 0, Strength = 50, MatchTrend = "" });

        // Create 16 league slots.
        var leagueTeamIds = new List<string>();
        for (var i = 1; i <= 16; i++)
        {
            var ltId = $"lt{i}";
            leagueTeamIds.Add(ltId);
            ctx.LeagueTeams.Add(new LeagueTeamEntity
            {
                Id = ltId,
                LeagueId = league.Id,
                TeamId = i == 1 ? teamId : null,
                TeamName = i == 1 ? "Team 1" : $"Bot {i}",
                IsBot = i != 1,
                Strength = 50,
                Country = "DE",
                Logo = "wappen01",
                IsOnline = i == 1,
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

        await ctx.SaveChangesAsync();

        var store = new LeagueDbStore(ctx);
        var matches = await store.GetMatchesForUserAsync(userId, leagueId, CancellationToken.None);

        // Confirm schedule exists and is complete
        var allMatches = await ctx.LeagueMatches.AsNoTracking().Where(m => m.LeagueId == league.Id).ToListAsync();
        Assert.Equal(30 * 8, allMatches.Count);

        // No self-matches
        Assert.All(allMatches, m => Assert.NotEqual(m.HomeLeagueTeamId, m.AwayLeagueTeamId));

        // Each team should play 30 matches (15 home, 15 away)
        var homeCounts = allMatches.GroupBy(m => m.HomeLeagueTeamId).ToDictionary(g => g.Key, g => g.Count());
        var awayCounts = allMatches.GroupBy(m => m.AwayLeagueTeamId).ToDictionary(g => g.Key, g => g.Count());

        foreach (var teamIdKey in leagueTeamIds)
        {
            Assert.True(homeCounts.ContainsKey(teamIdKey), "Missing home entries for " + teamIdKey);
            Assert.True(awayCounts.ContainsKey(teamIdKey), "Missing away entries for " + teamIdKey);
            Assert.Equal(15, homeCounts[teamIdKey]);
            Assert.Equal(15, awayCounts[teamIdKey]);
        }

        // There should be one matchday per day at a consistent hour (18:00 UTC), and each day should have 8 matches.
        var matchesByDate = allMatches.GroupBy(m => m.ScheduledDateUtc.Date).ToDictionary(g => g.Key, g => g.ToList());
        Assert.Equal(30, matchesByDate.Count);
        foreach (var kvp in matchesByDate)
        {
            Assert.Equal(8, kvp.Value.Count);
            Assert.All(kvp.Value, m => Assert.Equal(TimeSpan.FromHours(18), m.ScheduledDateUtc.TimeOfDay));
        }
    }

    [Fact]
    public async Task SeasonTransition_ClearsAndRegeneratesFixturesForAllLeagues()
    {
        using var conn = new SqliteConnection("DataSource=:memory:");
        var ctx = CreateContext(conn);

        // Setup a league with a schedule
        var leagueId = Guid.NewGuid();
        var league = new LeagueEntity
        {
            Id = leagueId.ToString("N"),
            Tier = 1,
            GroupNumber = 1,
            Name = "Season League",
            Mount = 0,
            Dismount = 0
        };
        ctx.Leagues.Add(league);

        var userId = "user1";
        var teamId = "t1";
        ctx.Users.Add(new UserEntity { Id = userId, ManagerName = "User 1", Email = "user1@example.com", PasswordHash = "", CreatedAtUtc = DateTime.UtcNow });
        ctx.Teams.Add(new TeamEntity { Id = teamId, UserId = userId, Name = "Team 1", Country = "DE", CountryName = "Germany", LeagueName = "Test", MarketValue = 0, Mood = 0, TeamMood = "", Wins = 0, Losses = 0, Fans = 0, Members = 0, Strength = 50, MatchTrend = "" });

        for (var i = 1; i <= 16; i++)
        {
            ctx.LeagueTeams.Add(new LeagueTeamEntity
            {
                Id = $"lt{i}",
                LeagueId = league.Id,
                TeamId = i == 1 ? teamId : null,
                TeamName = i == 1 ? "Team 1" : $"Bot {i}",
                IsBot = i != 1,
                Strength = 50,
                Country = "DE",
                Logo = "wappen01",
                IsOnline = i == 1
            });
        }

        // Seed season state far enough in the past so a new season is due.
        ctx.SeasonStates.Add(new SeasonStateEntity
        {
            Id = "singleton",
            SeasonNumber = 1,
            LastSeasonProcessed = 1,
            CurrentMatchday = 1,
            StartedAtUtc = DateTime.UtcNow.AddDays(-31)
        });

        await ctx.SaveChangesAsync();

        // Generate initial schedule
        var leagueStore = new LeagueDbStore(ctx);
        await leagueStore.GetMatchesForUserAsync(userId, leagueId, CancellationToken.None);
        var initialMatchCount = await ctx.LeagueMatches.CountAsync();
        Assert.Equal(30 * 8, initialMatchCount);

        // Force season transition (private method) via reflection
        var teamStore = new TeamDbStore(ctx, new StadiumEconomyService(), new TrainingProgressService(), new TeamStrengthCalculator(), new ConfigurationBuilder().Build(), leagueStore);
        var ensureSeasonTransition = typeof(TeamDbStore).GetMethod("EnsureSeasonTransitionAsync", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
        Assert.NotNull(ensureSeasonTransition);
        await (Task)ensureSeasonTransition.Invoke(teamStore, new object[] { CancellationToken.None })!;

        // After season transition, the fixture list for the original league should still exist and have been regenerated.
        var regeneratedMatchCount = await ctx.LeagueMatches.CountAsync(m => m.LeagueId == league.Id);
        Assert.Equal(30 * 8, regeneratedMatchCount);

        // And all scheduled matches for the original league should be at the expected daily time.
        var matches = await ctx.LeagueMatches.AsNoTracking().Where(m => m.LeagueId == league.Id).ToListAsync();
        Assert.All(matches, m => Assert.Equal(TimeSpan.FromHours(18), m.ScheduledDateUtc.TimeOfDay));
    }
}
