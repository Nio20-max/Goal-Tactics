using GoalTactics.Application.Scouting;
using GoalTactics.Application.Team;
using GoalTactics.Contracts.Scouting;
using Xunit;

namespace GoalTactics.UnitTests.Scouting;

public sealed class ScoutingServiceTests
{
    [Fact]
    public async Task InstructScout_PremiumDefaultNoPositionTargetsGK()
    {
        var teamStore = new FakeTeamStore();
        var service = new ScoutingService(teamStore);

        await service.InstructScoutAsync("user-1", new ScoutInstructionRequest { ScoutType = "premium", Price = 1000 }, CancellationToken.None);

        Assert.Equal("GK", teamStore.CapturedPosition);
    }

    [Theory]
    [InlineData(0, "GK")]
    [InlineData(1, "DEF")]
    [InlineData(2, "MID")]
    [InlineData(3, "FWD")]
    public async Task InstructScout_Position0To3_MappedStrictly(int position, string expectedPosition)
    {
        var teamStore = new FakeTeamStore();
        var service = new ScoutingService(teamStore);

        await service.InstructScoutAsync("user-1", new ScoutInstructionRequest { ScoutType = "premium", Price = 1000, Position = position }, CancellationToken.None);

        Assert.Equal(expectedPosition, teamStore.CapturedPosition);
    }

    [Fact]
    public async Task InstructScout_PositionOutOfRange_PremiumFallsBackToGK()
    {
        var teamStore = new FakeTeamStore();
        var service = new ScoutingService(teamStore);

        await service.InstructScoutAsync("user-1", new ScoutInstructionRequest { ScoutType = "premium", Price = 1000, Position = 4 }, CancellationToken.None);

        Assert.Equal("GK", teamStore.CapturedPosition);
    }

    [Theory]
    [InlineData("0", "GK")]
    [InlineData("1", "DEF")]
    [InlineData("2", "MID")]
    [InlineData("3", "FWD")]
    [InlineData("GK", "GK")]
    [InlineData("def", "DEF")]
    public async Task InstructScout_PositionFilterString_CorrectlyNormalized(string positionFilter, string expected)
    {
        var teamStore = new FakeTeamStore();
        var service = new ScoutingService(teamStore);

        await service.InstructScoutAsync("user-1", new ScoutInstructionRequest { ScoutType = "premium", Price = 1000, PositionFilter = positionFilter }, CancellationToken.None);

        Assert.Equal(expected, teamStore.CapturedPosition);
    }

    private sealed class FakeTeamStore : ITeamStore
    {
        public string? CapturedPosition { get; private set; }

        public Task<bool> AddScoutedPlayerAsync(string userId, string name, string origin, string position, int age, int talent, decimal strength, int fitness, bool isPremiumScouting = false, DateTime? readyAtUtc = null, CancellationToken cancellationToken = default)
        {
            CapturedPosition = position;
            return Task.FromResult(true);
        }

        public Task<bool> TrySpendStarsAsync(string userId, decimal stars, CancellationToken cancellationToken = default) => Task.FromResult(true);

        public Task<int> GetPendingScoutCountAsync(string userId, CancellationToken cancellationToken = default) => Task.FromResult(0);

        public Task<IReadOnlyList<SquadPlayerRecord>> GetAllScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default) => Task.FromResult((IReadOnlyList<SquadPlayerRecord>)Array.Empty<SquadPlayerRecord>());

        #region NotImplemented
        public Task<TeamRecord> GetOrCreateMyTeamAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<TeamRecord?> GetTeamByIdAsync(string teamId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<TeamResourcesRecord> GetTeamResourcesAsync(string teamId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<TeamNewsRecord>> GetTeamNewsAsync(string teamId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<TeamMailRecord>> GetMyMailAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task MarkMailAsReadAsync(string userId, string mailId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task MarkAllMailAsReadAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task DeleteMailAsync(string userId, string mailId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task DeleteAllReadMailAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<FinanceHistoryRecord>> GetFinanceHistoryAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<FinancesRecord> GetFinancesAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<AccomplishmentRecord>> GetAccomplishmentsAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task AddAccomplishmentAsync(string userId, string name, string image, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task RenameTeamAsync(string userId, string teamId, string name, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<StadiumStateRecord> GetStadiumStateAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<BuildPlaceRecord>> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> BuildPlaceAsync(string userId, Guid placeId, int count, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<ConstructionRecord?> GetUnderConstructionAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> SpeedupConstructionAsync(string userId, Guid constructionId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task RenewGrassAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task RenameStadiumAsync(string userId, string name, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<TeamTrainingStateRecord> GetTrainingStateAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task SaveTeamTrainingAsync(string userId, int mainSkillIndex, int subSkillIndex, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task SaveTacticTrainingAsync(string userId, string tacticId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<SquadPlayerRecord>> GetSquadPlayersAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<SquadPlayerRecord>> GetSquadPlayersForTeamAsync(Guid teamId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<SquadPlayerRecord?> GetSquadPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<SkillCardRecord>> GetSkillCardsAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task AddSkillCardsAsync(string userId, IEnumerable<SkillCardRecord> cards, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> UseSkillCardAsync(string userId, SkillCardRecord card, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> ApplySkillCardToPlayerAsync(string userId, Guid playerId, SkillCardRecord card, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> SaveIndividualTrainingAsync(string userId, Guid? playerId, string? skillType, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<int> RenewIndividualTrainingAsync(string userId, Guid? playerId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> UpdatePlayerNameAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> UpdatePlayerOriginAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> UpdatePlayerShirtAsync(string userId, Guid playerId, int shirtNumber, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> TrySpendMedipacksAsync(string userId, decimal medipacks, CancellationToken cancellationToken = default) => Task.FromResult(true);
        public Task<Guid> GetLeagueIdForTeamAsync(string teamId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<OwnedEquipmentRecord>> GetOwnedEquipmentAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> BuyEquipmentAsync(string userId, string image, string equipmentType, int starsCost, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> UseEquipmentAsync(string userId, string equipmentId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<(string? Shirt, string? Emblem)> GetSelectedEquipmentAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> RecruitScoutedPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> SpeedupScoutAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> TrySpendMoneyAsync(string userId, decimal amount, string description, CancellationToken cancellationToken = default) => Task.FromResult(true);
        public Task<bool> RemovePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> UpgradePlayerStrengthAsync(string userId, Guid playerId, int strength, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> UpgradePlayerStrengthAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<SeasonInfoRecord> GetSeasonInfoAsync(CancellationToken cancellationToken = default) => throw new NotImplementedException();

        public Task<bool> BookCampAsync(string userId, string campType, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task CancelCampAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task IncrementCampRefreshAsync(string userId, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<bool> SaveIndividualTrainingAsync(string userId, Guid playerId, string? skillType, CancellationToken cancellationToken = default) => throw new NotImplementedException();
        public Task<IReadOnlyList<SquadPlayerRecord>> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default) => Task.FromResult((IReadOnlyList<SquadPlayerRecord>)Array.Empty<SquadPlayerRecord>());
        #endregion
    }
}
