using GoalTactics.Application.Team;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Team;

public sealed class TeamDbStore(GoalTacticsDbContext dbContext) : ITeamStore
{
    public async Task<TeamRecord> GetOrCreateMyTeamAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (team is null)
        {
            var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken)
                ?? throw new InvalidOperationException("User not found for team initialization");

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

            dbContext.TeamResources.Add(new TeamResourcesEntity
            {
                TeamId = team.Id,
                Money = 50000,
                Medipacks = 3,
                GTStars = 0
            });

            dbContext.TeamNews.Add(new TeamNewsEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                TeamId = team.Id,
                DateText = DateTime.UtcNow.ToString("yyyy-MM-dd"),
                Title = "Welcome",
                Text = "Your club has been founded."
            });

            dbContext.TeamMail.Add(new TeamMailEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = userId,
                DateText = DateTime.UtcNow.ToString("yyyy-MM-dd"),
                Subject = "Welcome",
                Sender = "Board",
                Message = "Welcome to Goal Tactics.",
                IsNew = true,
                SenderType = 0
            });

            dbContext.TeamFinanceHistory.Add(new TeamFinanceHistoryEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                UserId = userId,
                Date = DateTime.UtcNow.Date,
                Income = 50000,
                Outcome = 0,
                Balance = 50000
            });

            await dbContext.SaveChangesAsync(cancellationToken);
        }

        var profile = await dbContext.Users.AsNoTracking().FirstAsync(x => x.Id == userId, cancellationToken);
        return ToRecord(team, profile.Email, profile.CreatedAtUtc, profile.LastActivityAtUtc);
    }

    public async Task<TeamRecord?> GetTeamByIdAsync(string teamId, CancellationToken cancellationToken = default)
    {
        var team = await dbContext.Teams.AsNoTracking().FirstOrDefaultAsync(x => x.Id == teamId, cancellationToken);
        if (team is null)
        {
            return null;
        }

        var user = await dbContext.Users.AsNoTracking().FirstAsync(x => x.Id == team.UserId, cancellationToken);
        return ToRecord(team, user.Email, user.CreatedAtUtc, user.LastActivityAtUtc);
    }

    public async Task<TeamResourcesRecord> GetTeamResourcesAsync(string teamId, CancellationToken cancellationToken = default)
    {
        var resources = await dbContext.TeamResources.AsNoTracking().FirstAsync(x => x.TeamId == teamId, cancellationToken);
        return new TeamResourcesRecord(resources.Money, resources.Medipacks, resources.GTStars);
    }

    public async Task<IReadOnlyList<TeamNewsRecord>> GetTeamNewsAsync(string teamId, CancellationToken cancellationToken = default)
    {
        var items = await dbContext.TeamNews.AsNoTracking().Where(x => x.TeamId == teamId).OrderByDescending(x => x.DateText).ToListAsync(cancellationToken);
        return items.Select(x => new TeamNewsRecord(x.DateText, x.Title, x.Text)).ToArray();
    }

    public async Task<IReadOnlyList<TeamMailRecord>> GetMyMailAsync(string userId, CancellationToken cancellationToken = default)
    {
        var mails = await dbContext.TeamMail.AsNoTracking().Where(x => x.UserId == userId).OrderByDescending(x => x.DateText).ToListAsync(cancellationToken);
        return mails.Select(x => new TeamMailRecord(x.Id, x.DateText, x.Subject, x.Sender, x.Message, x.Extra, x.IsNew, x.SenderType)).ToArray();
    }

    public async Task MarkMailAsReadAsync(string userId, string mailId, CancellationToken cancellationToken = default)
    {
        var mail = await dbContext.TeamMail.FirstOrDefaultAsync(x => x.UserId == userId && x.Id == mailId, cancellationToken);
        if (mail is null)
        {
            return;
        }

        mail.IsNew = false;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task MarkAllMailAsReadAsync(string userId, CancellationToken cancellationToken = default)
    {
        var mails = await dbContext.TeamMail.Where(x => x.UserId == userId && x.IsNew).ToListAsync(cancellationToken);
        foreach (var mail in mails)
        {
            mail.IsNew = false;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task DeleteMailAsync(string userId, string mailId, CancellationToken cancellationToken = default)
    {
        var mail = await dbContext.TeamMail.FirstOrDefaultAsync(x => x.UserId == userId && x.Id == mailId, cancellationToken);
        if (mail is null)
        {
            return;
        }

        dbContext.TeamMail.Remove(mail);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task DeleteAllReadMailAsync(string userId, CancellationToken cancellationToken = default)
    {
        var mails = await dbContext.TeamMail.Where(x => x.UserId == userId && !x.IsNew).ToListAsync(cancellationToken);
        dbContext.TeamMail.RemoveRange(mails);
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    public async Task<IReadOnlyList<FinanceHistoryRecord>> GetFinanceHistoryAsync(string userId, CancellationToken cancellationToken = default)
    {
        var rows = await dbContext.TeamFinanceHistory.AsNoTracking().Where(x => x.UserId == userId).OrderByDescending(x => x.Date).ToListAsync(cancellationToken);
        return rows.Select(x => new FinanceHistoryRecord(x.Date, x.Income, x.Outcome, x.Balance)).ToArray();
    }

    public async Task<FinancesRecord> GetFinancesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var history = await GetFinanceHistoryAsync(userId, cancellationToken);
        var today = history.FirstOrDefault();
        var yesterday = history.Skip(1).FirstOrDefault();

        var todays = today is null
            ? Array.Empty<FinanceEntryRecord>()
            : new[]
            {
                new FinanceEntryRecord("Income", today.Income, "Daily income", true),
                new FinanceEntryRecord("Outcome", today.Outcome, "Daily outcome", false)
            };

        var yesterdays = yesterday is null
            ? Array.Empty<FinanceEntryRecord>()
            : new[]
            {
                new FinanceEntryRecord("Income", yesterday.Income, "Daily income", true),
                new FinanceEntryRecord("Outcome", yesterday.Outcome, "Daily outcome", false)
            };

        return new FinancesRecord((int)(today?.Balance ?? 0), (int)(yesterday?.Balance ?? 0), todays, yesterdays);
    }

    public async Task<IReadOnlyList<AccomplishmentRecord>> GetAccomplishmentsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateMyTeamAsync(userId, cancellationToken);
        return new[]
        {
            new AccomplishmentRecord($"Founder of {team.Name}", "founder")
        };
    }

    public async Task RenameTeamAsync(string userId, string teamId, string name, CancellationToken cancellationToken = default)
    {
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId && x.Id == teamId, cancellationToken);
        if (team is null)
        {
            return;
        }

        team.Name = name;
        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private static TeamRecord ToRecord(TeamEntity team, string userEmail, DateTime userCreatedAtUtc, DateTime? userLastActivityAtUtc)
    {
        return new TeamRecord(
            team.Id,
            team.UserId,
            team.Name,
            team.Country,
            team.CountryName,
            team.LeagueName,
            team.MarketValue,
            team.Mood,
            team.TeamMood,
            team.Wins,
            team.Losses,
            team.Fans,
            team.Members,
            team.Strength,
            team.MatchTrend,
            userEmail,
            userCreatedAtUtc,
            userLastActivityAtUtc);
    }
}
