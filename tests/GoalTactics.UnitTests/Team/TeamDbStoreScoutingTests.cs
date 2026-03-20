using GoalTactics.Application.League;
using GoalTactics.Application.Mechanics;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Team;
using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace GoalTactics.UnitTests.Team;

public sealed class TeamDbStoreScoutingTests : IDisposable
{
    private readonly SqliteConnection _connection;
    private readonly GoalTacticsDbContext _dbContext;
    private readonly TeamDbStore _teamStore;

    public TeamDbStoreScoutingTests()
    {
        _connection = new SqliteConnection("Data Source=:memory:");
        _connection.Open();

        var options = new DbContextOptionsBuilder<GoalTacticsDbContext>()
            .UseSqlite(_connection)
            .Options;

        _dbContext = new GoalTacticsDbContext(options);
        _dbContext.Database.EnsureCreated();
        _teamStore = new TeamDbStore(
            _dbContext,
            new StadiumEconomyService(),
            new TrainingProgressService(),
            new TeamStrengthCalculator(),
            new ConfigurationBuilder().Build(),
            new FakeLeagueStore());
    }

    private sealed class FakeLeagueStore : ILeagueStore
    {
        public Task<LeagueTableRecord> GetLeagueTableForUserAsync(string userId, Guid requestedLeagueId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<LeagueMatchRecord>> GetMatchesForUserAsync(string userId, Guid requestedLeagueId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<LeagueMatchRecord?> GetMatchAsync(Guid matchId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<LeagueMatchRecord>> GetUpcomingMatchesForTeamAsync(string teamId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<GoalGetterRecord>> GetTopScorersAsync(Guid leagueId, int count, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task ResolveMatchAsync(Guid matchId, int homeScore, int awayScore, IReadOnlyList<MatchScorerEvent> scorers, string? eventsJson, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task EnsureScheduleForLeagueAsync(Guid leagueId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
    }

    public void Dispose()
    {
        _dbContext.Dispose();
        _connection.Dispose();
    }

    [Fact]
    public async Task AddScoutedPlayer_SetsContractEndUtcTo48HoursAndGetScoutedPlayersFiltersExpired()
    {
        var userId = "user-1";
        _dbContext.Users.Add(new GoalTactics.Infrastructure.Persistence.Entities.UserEntity
        {
            Id = userId,
            ManagerName = "Test User",
            Email = "test@example.com",
            PasswordHash = "hash",
            CreatedAtUtc = DateTime.UtcNow
        });
        await _dbContext.SaveChangesAsync();

        await _teamStore.AddScoutedPlayerAsync(userId, "Scout Player", "Germany", "DEF", 17, 8, 70m, 70, true, DateTime.UtcNow);

        var scouted = await _teamStore.GetScoutedPlayersAsync(userId);
        Assert.Single(scouted);

        var entity = await _dbContext.TeamPlayers.FirstAsync(x => x.IsScouted);
        Assert.InRange(entity.ContractEndUtc.Value, DateTime.UtcNow.AddHours(47.5), DateTime.UtcNow.AddHours(48.5));

        // simulate expiry
        entity.ContractEndUtc = DateTime.UtcNow.AddMinutes(-1);
        await _dbContext.SaveChangesAsync();

        var expired = await _teamStore.GetScoutedPlayersAsync(userId);
        Assert.Empty(expired);
    }
}
