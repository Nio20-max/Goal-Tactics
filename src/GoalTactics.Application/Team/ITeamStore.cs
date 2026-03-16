namespace GoalTactics.Application.Team;

public interface ITeamStore
{
    Task<TeamRecord> GetOrCreateMyTeamAsync(string userId, CancellationToken cancellationToken = default);

    Task<TeamRecord?> GetTeamByIdAsync(string teamId, CancellationToken cancellationToken = default);

    Task<TeamResourcesRecord> GetTeamResourcesAsync(string teamId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<TeamNewsRecord>> GetTeamNewsAsync(string teamId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<TeamMailRecord>> GetMyMailAsync(string userId, CancellationToken cancellationToken = default);

    Task MarkMailAsReadAsync(string userId, string mailId, CancellationToken cancellationToken = default);

    Task MarkAllMailAsReadAsync(string userId, CancellationToken cancellationToken = default);

    Task DeleteMailAsync(string userId, string mailId, CancellationToken cancellationToken = default);

    Task DeleteAllReadMailAsync(string userId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<FinanceHistoryRecord>> GetFinanceHistoryAsync(string userId, CancellationToken cancellationToken = default);

    Task<FinancesRecord> GetFinancesAsync(string userId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<AccomplishmentRecord>> GetAccomplishmentsAsync(string userId, CancellationToken cancellationToken = default);

    Task AddAccomplishmentAsync(string userId, string name, string image, CancellationToken cancellationToken = default);

    Task RenameTeamAsync(string userId, string teamId, string name, CancellationToken cancellationToken = default);

    Task<StadiumStateRecord> GetStadiumStateAsync(string userId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<BuildPlaceRecord>> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default);

    Task<bool> BuildPlaceAsync(string userId, Guid placeId, int count, CancellationToken cancellationToken = default);

    Task<ConstructionRecord?> GetUnderConstructionAsync(string userId, CancellationToken cancellationToken = default);

    Task<bool> SpeedupConstructionAsync(string userId, Guid constructionId, CancellationToken cancellationToken = default);

    Task RenewGrassAsync(string userId, CancellationToken cancellationToken = default);

    Task RenameStadiumAsync(string userId, string name, CancellationToken cancellationToken = default);

    Task<TeamTrainingStateRecord> GetTrainingStateAsync(string userId, CancellationToken cancellationToken = default);

    Task SaveTeamTrainingAsync(string userId, int mainSkillIndex, int subSkillIndex, CancellationToken cancellationToken = default);

    Task SaveTacticTrainingAsync(string userId, string tacticId, CancellationToken cancellationToken = default);

    Task<bool> BookCampAsync(string userId, string campType, CancellationToken cancellationToken = default);

    Task CancelCampAsync(string userId, CancellationToken cancellationToken = default);

    Task IncrementCampRefreshAsync(string userId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<SquadPlayerRecord>> GetSquadPlayersAsync(string userId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<SquadPlayerRecord>> GetSquadPlayersForTeamAsync(Guid teamId, CancellationToken cancellationToken = default);

    Task<SquadPlayerRecord?> GetSquadPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<SkillCardRecord>> GetSkillCardsAsync(string userId, CancellationToken cancellationToken = default);

    Task AddSkillCardsAsync(string userId, IEnumerable<SkillCardRecord> cards, CancellationToken cancellationToken = default);

    Task<bool> UseSkillCardAsync(string userId, SkillCardRecord card, CancellationToken cancellationToken = default);

    /// <summary>Apply a skill card bonus to a specific player's skill and recalculate derived values.</summary>
    Task<bool> ApplySkillCardToPlayerAsync(string userId, Guid playerId, SkillCardRecord card, CancellationToken cancellationToken = default);

    Task<bool> SaveIndividualTrainingAsync(string userId, Guid playerId, string? skillType, CancellationToken cancellationToken = default);

    Task<int> RenewIndividualTrainingAsync(string userId, Guid? playerId, CancellationToken cancellationToken = default);

    Task<bool> UpdatePlayerNameAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default);

    Task<bool> UpdatePlayerOriginAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default);

    Task<bool> UpdatePlayerShirtAsync(string userId, Guid playerId, int shirtNumber, CancellationToken cancellationToken = default);

    Task<bool> TrySpendStarsAsync(string userId, decimal stars, CancellationToken cancellationToken = default);

    Task<bool> TrySpendMedipacksAsync(string userId, decimal medipacks, CancellationToken cancellationToken = default);

    Task<Guid> GetLeagueIdForTeamAsync(string teamId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<OwnedEquipmentRecord>> GetOwnedEquipmentAsync(string userId, CancellationToken cancellationToken = default);

    Task<bool> BuyEquipmentAsync(string userId, string image, string equipmentType, int starsCost, CancellationToken cancellationToken = default);

    Task<bool> UseEquipmentAsync(string userId, string equipmentId, CancellationToken cancellationToken = default);

    Task<(string? Shirt, string? Emblem)> GetSelectedEquipmentAsync(string userId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<SquadPlayerRecord>> GetScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default);

    /// <summary>Returns scouted players including those still pending (not yet ready).</summary>
    Task<IReadOnlyList<SquadPlayerRecord>> GetAllScoutedPlayersAsync(string userId, CancellationToken cancellationToken = default);

    Task<bool> AddScoutedPlayerAsync(string userId, string name, string origin, string position, int age, int talent, decimal strength, int fitness, bool isPremiumScouting = false, DateTime? readyAtUtc = null, CancellationToken cancellationToken = default);

    Task<bool> RecruitScoutedPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    /// <summary>Set a scouted player's ScoutingReadyAtUtc to now (for star speed-up).</summary>
    Task<bool> SpeedupScoutAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    /// <summary>Count of scouted players that are still pending (not yet ready).</summary>
    Task<int> GetPendingScoutCountAsync(string userId, CancellationToken cancellationToken = default);

    Task<bool> TrySpendMoneyAsync(string userId, decimal amount, string description, CancellationToken cancellationToken = default);

    /// <summary>Remove a player from the team entirely (fire without compensation).</summary>
    Task<bool> RemovePlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    /// <summary>Upgrade a player's strength by spending GT Stars.</summary>
    Task<bool> UpgradePlayerStrengthAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    /// <summary>Heal a player by spending a medipack (restores fitness to 100).</summary>
    Task<bool> HealPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    /// <summary>Returns the current season info from the database (creates the season state row on fresh DB).</summary>
    Task<SeasonInfoRecord> GetSeasonInfoAsync(CancellationToken cancellationToken = default);
}

public sealed record SeasonInfoRecord(int SeasonNumber, int Matchday, int DaysLeft, DateTime SeasonStartDateUtc);

public sealed record OwnedEquipmentRecord(string Id, string Image, string EquipmentType, bool IsActive);

public sealed record TeamRecord(string TeamId, string UserId, string Name, string Country, string CountryName, string LeagueName, decimal MarketValue, int Mood, string TeamMood, int Wins, int Losses, int Fans, int Members, int Strength, string MatchTrend, string ManagerName, string UserEmail, DateTime UserCreatedAtUtc, DateTime? UserLastActivityAtUtc, string? SelectedShirt, string? SelectedEmblem);
public sealed record SkillCardRecord(int Skill, int Rarity, int Count, decimal Bonus);
public sealed record TeamResourcesRecord(decimal Money, decimal Medipacks, decimal GTStars);

public sealed record TeamNewsRecord(string Date, string Title, string Text);

public sealed record TeamMailRecord(string MailId, string Date, string Subject, string Sender, string Message, string Extra, bool IsNew, int SenderType);

public sealed record FinanceEntryRecord(string BookingType, decimal Value, string Description, bool IsEarning);

public sealed record FinanceHistoryRecord(DateTime Date, decimal Income, decimal Outcome, decimal Balance);

public sealed record FinancesRecord(int Today, int Yesterday, IReadOnlyList<FinanceEntryRecord> Todays, IReadOnlyList<FinanceEntryRecord> Yesterdays);

public sealed record AccomplishmentRecord(string Name, string Image);

public sealed record StadiumStateRecord(
    string Name,
    int GrassQuality,
    int LeagueTier,
    int Capacity,
    int EarningsAverage,
    long VisitorsLastMatch,
    long VisitorsAverage,
    long VisitorsTotal,
    decimal EarningsLastMatch,
    decimal EarningsTotal);

public sealed record BuildPlaceRecord(Guid Id, string BuildingType, int Level, bool CanBuild);

public sealed record ConstructionRecord(
    Guid Id,
    Guid PlaceId,
    string BuildingType,
    int CurrentValue,
    int NewValue,
    decimal UpgradeCost,
    decimal UpgradeCostPremium,
    DateTime BuildStartUtc,
    DateTime BuildEndUtc);

public sealed record TeamTrainingStateRecord(
    int MainSkillIndex,
    int SubSkillIndex,
    string EfficiencyText,
    int EfficiencyValue,
    int TrainPrice,
    string CampType,
    DateTime? CampActiveUntilUtc,
    string? SelectedTacticId,
    DateTime? SelectedTacticStartUtc,
    int LeagueTier,
    int CampRefreshCount,
    Dictionary<string, int> TacticTrainingProgress);

public sealed record SquadPlayerRecord(
    Guid Id,
    string Name,
    string Origin,
    string Head,
    string Body,
    string Gloves,
    string Shoes,
    string Position,
    int ShirtNumber,
    int Age,
    int Talent,
    int Strength,
    decimal MarketValue,
    int Fitness,
    int Matches,
    int Goals,
    int YellowCards,
    int RedCards,
    decimal[] Skills,
    string? IndividualTrainingSkill,
    DateTime? IndividualTrainingUntilUtc,
    DateTime? ContractEndUtc,
    bool IsPremiumScouting,
    DateTime? ScoutingReadyAtUtc = null);
