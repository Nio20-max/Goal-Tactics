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
}

public sealed record TeamRecord(string TeamId, string UserId, string Name, string Country, string CountryName, string LeagueName, decimal MarketValue, int Mood, string TeamMood, int Wins, int Losses, int Fans, int Members, int Strength, string MatchTrend, string UserEmail, DateTime UserCreatedAtUtc, DateTime? UserLastActivityAtUtc);

public sealed record TeamResourcesRecord(decimal Money, decimal Medipacks, decimal GTStars);

public sealed record TeamNewsRecord(string Date, string Title, string Text);

public sealed record TeamMailRecord(string MailId, string Date, string Subject, string Sender, string Message, string Extra, bool IsNew, int SenderType);

public sealed record FinanceEntryRecord(string BookingType, decimal Value, string Description, bool IsEarning);

public sealed record FinanceHistoryRecord(DateTime Date, decimal Income, decimal Outcome, decimal Balance);

public sealed record FinancesRecord(int Today, int Yesterday, IReadOnlyList<FinanceEntryRecord> Todays, IReadOnlyList<FinanceEntryRecord> Yesterdays);

public sealed record AccomplishmentRecord(string Name, string Image);
