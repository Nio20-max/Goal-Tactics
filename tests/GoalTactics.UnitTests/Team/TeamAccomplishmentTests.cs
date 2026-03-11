using GoalTactics.Infrastructure.Team;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using GoalTactics.Application.Team;
using GoalTactics.Application.Mechanics;
using GoalTactics.Application.Stadium;
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
        return new TeamDbStore(ctx, new StadiumEconomyService(), new TrainingProgressService(), new TeamStrengthCalculator(), config);
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

        await ctx.SaveChangesAsync();

        // trigger progression tick for team1
        var resources = await store.GetTeamResourcesAsync("u1");

        // after tick, accomplishments should exist
        var accs = await ctx.TeamAccomplishments.ToListAsync();
        Assert.Contains(accs, a => a.TeamId == "t1" && a.Name.StartsWith("Meisterschaft"));
        Assert.Contains(accs, a => a.TeamId == "t1" && a.Name.StartsWith("Torschützenkönig"));

        // goals should be reset
        var players = await ctx.TeamPlayers.ToListAsync();
        Assert.All(players, p => Assert.Equal(0, p.Goals));

        // second call should not duplicate
        await store.GetTeamResourcesAsync("u1");
        var accCount = await ctx.TeamAccomplishments.CountAsync();
        Assert.Equal(accs.Count, accCount);
    }
}
