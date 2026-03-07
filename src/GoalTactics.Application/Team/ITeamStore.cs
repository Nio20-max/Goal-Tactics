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

    Task RenameTeamAsync(string userId, string teamId, string name, CancellationToken cancellationToken = default);

    Task<StadiumStateRecord> GetStadiumStateAsync(string userId, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<BuildPlaceRecord>> GetBuildPlacesAsync(string userId, CancellationToken cancellationToken = default);

    Task<bool> BuildPlaceAsync(string userId, Guid placeId, CancellationToken cancellationToken = default);

    Task RenewGrassAsync(string userId, CancellationToken cancellationToken = default);

    Task RenameStadiumAsync(string userId, string name, CancellationToken cancellationToken = default);

    Task<TeamTrainingStateRecord> GetTrainingStateAsync(string userId, CancellationToken cancellationToken = default);

    Task SaveTeamTrainingAsync(string userId, int mainSkillIndex, int subSkillIndex, CancellationToken cancellationToken = default);

    Task<bool> BookCampAsync(string userId, string campType, CancellationToken cancellationToken = default);

    Task<IReadOnlyList<SquadPlayerRecord>> GetSquadPlayersAsync(string userId, CancellationToken cancellationToken = default);

    Task<SquadPlayerRecord?> GetSquadPlayerAsync(string userId, Guid playerId, CancellationToken cancellationToken = default);

    Task<bool> SaveIndividualTrainingAsync(string userId, Guid playerId, string? skillType, CancellationToken cancellationToken = default);

    Task<int> RenewIndividualTrainingAsync(string userId, Guid? playerId, CancellationToken cancellationToken = default);

    Task<bool> UpdatePlayerNameAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default);

    Task<bool> UpdatePlayerOriginAsync(string userId, Guid playerId, string? value, CancellationToken cancellationToken = default);

    Task<bool> UpdatePlayerShirtAsync(string userId, Guid playerId, int shirtNumber, CancellationToken cancellationToken = default);
}

public sealed record TeamRecord(string TeamId, string UserId, string Name, string Country, string CountryName, string LeagueName, decimal MarketValue, int Mood, string TeamMood, int Wins, int Losses, int Fans, int Members, int Strength, string MatchTrend, string UserEmail, DateTime UserCreatedAtUtc, DateTime? UserLastActivityAtUtc);

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
    int Capacity,
    int EarningsAverage,
    long VisitorsLastMatch,
    long VisitorsAverage,
    long VisitorsTotal,
    decimal EarningsLastMatch,
    decimal EarningsTotal);

public sealed record BuildPlaceRecord(Guid Id, string BuildingType, int Level, bool CanBuild);

public sealed record TeamTrainingStateRecord(int MainSkillIndex, int SubSkillIndex, string EfficiencyText, int EfficiencyValue, int TrainPrice);

public sealed record SquadPlayerRecord(
    Guid Id,
    string Name,
    string Origin,
    string Position,
    int ShirtNumber,
    int Age,
    int Talent,
    int Strength,
    int Fitness,
    int Matches,
    int Goals,
    int YellowCards,
    int RedCards,
    string? IndividualTrainingSkill,
    DateTime? IndividualTrainingUntilUtc);
