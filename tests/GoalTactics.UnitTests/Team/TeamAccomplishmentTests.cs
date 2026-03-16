using GoalTactics.Infrastructure.Team;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using GoalTactics.Application.Team;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Stadium;
using GoalTactics.Infrastructure.League;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.Memory;
using System.Threading.Tasks;

namespace GoalTactics.UnitTests.Team;

public class TeamAccomplishmentTests
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

    private TeamDbStore CreateStore(GoalTacticsDbContext ctx)
    {
        var config = new ConfigurationBuilder()
            .AddInMemoryCollection(new Dictionary<string, string>
            {
                ["App:SeasonLengthDays"] = "30",
                ["App:SeasonStartDate"] = DateTime.UtcNow.AddDays(-31).ToString("O")
            })
            .Build();

        var leagueStore = new LeagueDbStore(ctx);
        return new TeamDbStore(ctx, new StadiumEconomyService(), new TrainingProgressService(), new TeamStrengthCalculator(), config, leagueStore);
    }

    private TeamDbStore CreateStoreWithoutSeasonTransition(GoalTacticsDbContext ctx)
    {
        var config = new ConfigurationBuilder()
            .AddInMemoryCollection(new Dictionary<string, string>
            {
                ["App:SeasonLengthDays"] = "365",
                ["App:SeasonStartDate"] = DateTime.UtcNow.ToString("O")
            })
            .Build();

        var leagueStore = new LeagueDbStore(ctx);
        return new TeamDbStore(ctx, new StadiumEconomyService(), new TrainingProgressService(), new TeamStrengthCalculator(), config, leagueStore);
    }

    [Fact]
    public async Task SeasonEnd_AwardsChampionshipAndTopScorer_AndResetsGoals()
    {
        using var conn = new SqliteConnection("DataSource=:memory:");
        var ctx = CreateContext(conn);
        var store = CreateStore(ctx);

        // create two users and teams
        var user1 = new UserEntity { Id = "u1", ManagerName = "A", Email = "a@example.com", PasswordHash = "", CreatedAtUtc = DateTime.UtcNow };
        var user2 = new UserEntity { Id = "u2", ManagerName = "B", Email = "b@example.com", PasswordHash = "", CreatedAtUtc = DateTime.UtcNow };
        ctx.Users.AddRange(user1, user2);

        var team1 = new TeamEntity { Id = "t1", UserId = "u1", Name = "Team1", Country = "DE", CountryName = "Germany", LeagueName = "L1", MarketValue = 0, Mood = 0, TeamMood = "", Wins = 0, Losses = 0, Fans = 0, Members = 0, Strength = 50, MatchTrend = "" };
        var team2 = new TeamEntity { Id = "t2", UserId = "u2", Name = "Team2", Country = "DE", CountryName = "Germany", LeagueName = "L1", MarketValue = 0, Mood = 0, TeamMood = "", Wins = 0, Losses = 0, Fans = 0, Members = 0, Strength = 50, MatchTrend = "" };
        ctx.Teams.AddRange(team1, team2);

        ctx.TeamResources.Add(new TeamResourcesEntity { TeamId = "t1", Money = 0, Medipacks = 0, GTStars = 0, LastEconomyTickUtc = DateTime.UtcNow.AddDays(-1), LastTrainingTickUtc = DateTime.UtcNow.AddDays(-1), ProgressDayCounter = 29 });
        ctx.TeamResources.Add(new TeamResourcesEntity { TeamId = "t2", Money = 0, Medipacks = 0, GTStars = 0, LastEconomyTickUtc = DateTime.UtcNow.AddDays(-1), LastTrainingTickUtc = DateTime.UtcNow.AddDays(-1), ProgressDayCounter = 29 });

        var league = new LeagueEntity { Id = "l1", Tier = 3, GroupNumber = 1, Name = "3. Liga", Mount = 0, Dismount = 0 };
        ctx.Leagues.Add(league);
        ctx.LeagueTeams.Add(new LeagueTeamEntity { Id = "lt1", LeagueId = "l1", TeamId = "t1", TeamName = "Team1", IsBot = false, Strength = 50, Country = "DE", Logo = "", IsOnline = true, MatchesHome = 0, MatchesAway = 0, WinsHome = 0, WinsAway = 0, LossesHome = 0, LossesAway = 0, DrawsHome = 0, DrawsAway = 0, GoalsScoredHome = 0, GoalsScoredAway = 0, GoalsReceivedHome = 0, GoalsReceivedAway = 0, PointsHome = 10, PointsAway = 0 });
        ctx.LeagueTeams.Add(new LeagueTeamEntity { Id = "lt2", LeagueId = "l1", TeamId = "t2", TeamName = "Team2", IsBot = false, Strength = 50, Country = "DE", Logo = "", IsOnline = true, MatchesHome = 0, MatchesAway = 0, WinsHome = 0, WinsAway = 0, LossesHome = 0, LossesAway = 0, DrawsHome = 0, DrawsAway = 0, GoalsScoredHome = 0, GoalsScoredAway = 0, GoalsReceivedHome = 0, GoalsReceivedAway = 0, PointsHome = 5, PointsAway = 0 });

        ctx.TeamPlayers.Add(new TeamPlayerEntity { Id = Guid.NewGuid().ToString("N"), TeamId = "t1", Name = "Lewandowski", Origin = "DE", Position = "FWD", ShirtNumber = 9, Age = 30, Talent = 90, Strength = 80, Fitness = 100, Matches = 20, Goals = 15, YellowCards = 0, RedCards = 0 });
        ctx.TeamPlayers.Add(new TeamPlayerEntity { Id = Guid.NewGuid().ToString("N"), TeamId = "t2", Name = "Rival", Origin = "DE", Position = "FWD", ShirtNumber = 10, Age = 28, Talent = 85, Strength = 75, Fitness = 100, Matches = 20, Goals = 5, YellowCards = 0, RedCards = 0 });

        // Pre-seed season state: season started 31 days ago, last processed = 1 (season 1).
        // With SeasonLengthDays=30, current season is now 2, so processing should run.
        ctx.SeasonStates.Add(new SeasonStateEntity { Id = "singleton", LastSeasonProcessed = 1, SeasonNumber = 1, CurrentMatchday = 1, StartedAtUtc = DateTime.UtcNow.AddDays(-31) });

        await ctx.SaveChangesAsync();

        // trigger progression tick for team1
        var resources = await store.GetTeamResourcesAsync("t1");

        // after tick, accomplishments should exist
        var accs = await ctx.TeamAccomplishments.ToListAsync();
        Assert.Contains(accs, a => a.TeamId == "t1" && a.Name.StartsWith("Meisterschaft"));
        Assert.Contains(accs, a => a.TeamId == "t1" && a.Name.StartsWith("Torschützenkönig"));

        // goals should be reset
        var players = await ctx.TeamPlayers.ToListAsync();
        Assert.All(players, p => Assert.Equal(0, p.Goals));

        // second call should not duplicate
        await store.GetTeamResourcesAsync("t1");
        var accCount = await ctx.TeamAccomplishments.CountAsync();
        Assert.Equal(accs.Count, accCount);
    }

    [Fact]
    public async Task SeasonEnd_PromotesAndRelegatesTeams()
    {
        using var conn = new SqliteConnection("DataSource=:memory:");
        var ctx = CreateContext(conn);
        var store = CreateStore(ctx);

        // Setup users/teams
        for (var i = 1; i <= 32; i++)
        {
            var userId = $"u{i}";
            var teamId = $"t{i}";
            ctx.Users.Add(new UserEntity { Id = userId, ManagerName = $"M{i}", Email = $"m{i}@example.com", PasswordHash = "", CreatedAtUtc = DateTime.UtcNow });
            ctx.Teams.Add(new TeamEntity { Id = teamId, UserId = userId, Name = $"Team{i}", Country = "DE", CountryName = "Germany", LeagueName = "", MarketValue = 0, Mood = 0, TeamMood = "", Wins = 0, Losses = 0, Fans = 0, Members = 0, Strength = 50, MatchTrend = "" });
            ctx.TeamResources.Add(new TeamResourcesEntity { TeamId = teamId, Money = 0, Medipacks = 0, GTStars = 0, LastEconomyTickUtc = DateTime.UtcNow.AddDays(-1), LastTrainingTickUtc = DateTime.UtcNow.AddDays(-1), ProgressDayCounter = 29 });
        }

        // Tier 1 league (dismount bottom 1)
        var league1 = new LeagueEntity { Id = "l1", Tier = 1, GroupNumber = 1, Name = "Tier1", Mount = 0, Dismount = 1 };
        ctx.Leagues.Add(league1);

        // Tier 2 league (mount top 1)
        var league2 = new LeagueEntity { Id = "l2", Tier = 2, GroupNumber = 1, Name = "Tier2", Mount = 1, Dismount = 0 };
        ctx.Leagues.Add(league2);

        // Create 16 teams in tier1 and 16 teams in tier2
        for (var i = 1; i <= 16; i++)
        {
            var teamId = $"t{i}";
            ctx.LeagueTeams.Add(new LeagueTeamEntity
            {
                Id = $"lt1_{i}",
                LeagueId = league1.Id,
                TeamId = teamId,
                TeamName = $"Team{i}",
                IsBot = false,
                Strength = 50,
                Country = "DE",
                Logo = "",
                IsOnline = true,
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
                PointsHome = i == 16 ? 0 : 10,
                PointsAway = 0
            });
        }

        for (var i = 17; i <= 32; i++)
        {
            var teamId = $"t{i}";
            ctx.LeagueTeams.Add(new LeagueTeamEntity
            {
                Id = $"lt2_{i}",
                LeagueId = league2.Id,
                TeamId = teamId,
                TeamName = $"Team{i}",
                IsBot = false,
                Strength = 50,
                Country = "DE",
                Logo = "",
                IsOnline = true,
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
                PointsHome = i == 17 ? 100 : 10,
                PointsAway = 0
            });
        }

        // Seed season state so processing triggers.
        ctx.SeasonStates.Add(new SeasonStateEntity { Id = "singleton", LastSeasonProcessed = 1, SeasonNumber = 1, CurrentMatchday = 1, StartedAtUtc = DateTime.UtcNow.AddDays(-31) });

        await ctx.SaveChangesAsync();

        // Trigger season processing
        await store.GetTeamResourcesAsync("t1");

        // After processing: best team from tier2 (t17) should be in tier1, worst team from tier1 (t16) should be in tier2.
        var tier1Slot = await ctx.LeagueTeams.FirstOrDefaultAsync(x => x.TeamId == "t17");
        var tier2Slot = await ctx.LeagueTeams.FirstOrDefaultAsync(x => x.TeamId == "t16");

        Assert.NotNull(tier1Slot);
        Assert.Equal(1, (await ctx.Leagues.FirstAsync(l => l.Id == tier1Slot.LeagueId)).Tier);

        Assert.NotNull(tier2Slot);
        Assert.Equal(2, (await ctx.Leagues.FirstAsync(l => l.Id == tier2Slot.LeagueId)).Tier);
    }

    [Fact]
    public async Task NewTeams_StartAtTier1_WhenTier3AlreadyExists()
    {
        using var conn = new SqliteConnection("DataSource=:memory:");
        var ctx = CreateContext(conn);
        var store = CreateStoreWithoutSeasonTransition(ctx);

        // Seed an existing tier-3 league (bots only, no tier1/tier2 exist yet).
        var tier3League = new LeagueEntity { Id = "l3", Tier = 3, GroupNumber = 1, Name = "Tier3", Mount = 2, Dismount = 6 };
        ctx.Leagues.Add(tier3League);
        for (var i = 1; i <= 16; i++)
        {
            ctx.LeagueTeams.Add(new LeagueTeamEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                LeagueId = tier3League.Id,
                TeamId = null,
                TeamName = $"Bot{i}",
                IsBot = true,
                Strength = 50,
                Country = "DE",
                Logo = "",
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

        // Add a user and trigger league assignment.
        ctx.Users.Add(new UserEntity { Id = "u1", ManagerName = "A", Email = "a@example.com", PasswordHash = "", CreatedAtUtc = DateTime.UtcNow });
        await ctx.SaveChangesAsync();

        var leagueStore = new LeagueDbStore(ctx);
        await leagueStore.GetLeagueTableForUserAsync("u1", Guid.Empty);

        // The user must land in tier 1 (not tier 3), and tier 2 must exist.
        var membership = await ctx.LeagueTeams.FirstAsync(x => x.TeamId != null);
        var league = await ctx.Leagues.FirstAsync(l => l.Id == membership.LeagueId);
        Assert.Equal(1, league.Tier);

        var tier2Count = await ctx.Leagues.CountAsync(l => l.Tier == 2);
        Assert.Equal(5, tier2Count);
    }

    [Fact]
    public async Task NewTeams_ArePlacedIntoTier1_FirstAndTierFilledBeforeCreatingTier2()
    {
        using var conn = new SqliteConnection("DataSource=:memory:");
        var ctx = CreateContext(conn);
        var store = CreateStoreWithoutSeasonTransition(ctx);

        // Create 17 users to force creation of the second league group.
        for (var i = 1; i <= 17; i++)
        {
            var userId = $"u{i}";
            ctx.Users.Add(new UserEntity { Id = userId, ManagerName = $"M{i}", Email = $"m{i}@example.com", PasswordHash = "", CreatedAtUtc = DateTime.UtcNow });
            ctx.Teams.Add(new TeamEntity { Id = $"t{i}", UserId = userId, Name = $"Team{i}", Country = "DE", CountryName = "Germany", LeagueName = "", MarketValue = 0, Mood = 0, TeamMood = "", Wins = 0, Losses = 0, Fans = 0, Members = 0, Strength = 50, MatchTrend = "" });
            ctx.TeamResources.Add(new TeamResourcesEntity { TeamId = $"t{i}", Money = 0, Medipacks = 0, GTStars = 0, LastEconomyTickUtc = DateTime.UtcNow.AddDays(-1), LastTrainingTickUtc = DateTime.UtcNow.AddDays(-1), ProgressDayCounter = 0 });
        }

        await ctx.SaveChangesAsync();

        // Use the league service to assign each user into a league (this is what the app does).
        var leagueStore = new LeagueDbStore(ctx);
        for (var i = 1; i <= 17; i++)
        {
            await leagueStore.GetLeagueTableForUserAsync($"u{i}", Guid.Empty);
        }

        // All first 16 teams should be in the same league (Tier 1, Group 1)
        var tier1LeagueId = (await ctx.LeagueTeams.FirstAsync(x => x.TeamId == "t1")).LeagueId;
        var tier1Teams = await ctx.LeagueTeams.Where(x => x.LeagueId == tier1LeagueId && x.TeamId != null).ToListAsync();
        Assert.Equal(16, tier1Teams.Count);

        // The 17th team should be in a different league (Tier 2 or Group 2)
        var team17LeagueId = (await ctx.LeagueTeams.FirstAsync(x => x.TeamId == "t17")).LeagueId;
        Assert.NotEqual(tier1LeagueId, team17LeagueId);
    }
}
