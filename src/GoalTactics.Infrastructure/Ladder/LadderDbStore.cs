using GoalTactics.Application.Ladder;
using GoalTactics.Infrastructure.Persistence;
using GoalTactics.Infrastructure.Persistence.Entities;
using Microsoft.EntityFrameworkCore;

namespace GoalTactics.Infrastructure.Ladder;

public sealed class LadderDbStore(GoalTacticsDbContext dbContext) : ILadderStore
{
    private const int LadderSize = 16;
    private const int StaminaCost = 25;
    private const int StaminaMax = 100;
    private const int WinPoints = 12;
    private const int LosePoints = 6;
    private const int MatchCost = 50;

    public async Task<LadderRecord> GetLadderAsync(string userId, Guid ladderId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateTeamAsync(userId, cancellationToken);
        var ladder = await GetOrCreateLadderAsync(ladderId, cancellationToken);

        await EnsureMembershipAsync(team, ladder, cancellationToken);
        var teams = await BuildSortedTeamsAsync(team.Id, ladder.Id, cancellationToken);

        return new LadderRecord(ParseGuid(ladder.Id), ladder.EndDateUtc, teams);
    }

    public async Task<LadderChallengeRecord> GetLadderChallengeAsync(string userId, Guid opponentTeamId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateTeamAsync(userId, cancellationToken);
        var ladder = await GetOrCreateLadderAsync(Guid.Empty, cancellationToken);

        await EnsureMembershipAsync(team, ladder, cancellationToken);

        var entries = await dbContext.LadderEntries.AsNoTracking().Where(x => x.LadderId == ladder.Id).ToListAsync(cancellationToken);
        var myEntry = entries.First(x => x.TeamId == team.Id);

        var opponent = entries.FirstOrDefault(x => x.TeamId == opponentTeamId.ToString("N"));
        if (opponent is null || opponent.TeamId == myEntry.TeamId)
        {
            opponent = entries
                .Where(x => x.TeamId != myEntry.TeamId)
                .OrderByDescending(x => x.Points)
                .ThenByDescending(x => x.Strength)
                .First();
        }

        var ranked = Rank(entries);
        var myRanked = ranked.First(x => x.Id == myEntry.Id);
        var opponentRanked = ranked.First(x => x.Id == opponent.Id);

        return new LadderChallengeRecord(
            HomeTeam: MapTeam(myRanked, isMine: true),
            AwayTeam: MapTeam(opponentRanked, isMine: false),
            WinPoints: WinPoints,
            LosePoints: LosePoints,
            Stamina: myEntry.Stamina,
            StaminaCost: StaminaCost,
            LadderDateUtc: ladder.EndDateUtc,
            MatchCost: MatchCost);
    }

    public async Task<LadderMatchResultRecord> RunMatchAsync(string userId, Guid opponentTeamId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateTeamAsync(userId, cancellationToken);
        var ladder = await GetOrCreateLadderAsync(Guid.Empty, cancellationToken);

        await EnsureMembershipAsync(team, ladder, cancellationToken);

        var entries = await dbContext.LadderEntries.Where(x => x.LadderId == ladder.Id).ToListAsync(cancellationToken);
        var myEntry = entries.First(x => x.TeamId == team.Id);

        if (myEntry.Stamina < StaminaCost)
        {
            return new LadderMatchResultRecord("Not enough stamina", myEntry.Stamina);
        }

        var opponent = entries.FirstOrDefault(x => x.TeamId == opponentTeamId.ToString("N"));
        if (opponent is null || opponent.TeamId == myEntry.TeamId)
        {
            opponent = entries
                .Where(x => x.TeamId != myEntry.TeamId)
                .OrderByDescending(x => x.Points)
                .ThenByDescending(x => x.Strength)
                .First();
        }

        myEntry.Stamina = Math.Max(0, myEntry.Stamina - StaminaCost);

        var seed = HashCode.Combine(myEntry.TeamId ?? myEntry.Id, opponent.TeamId ?? opponent.Id, DateTime.UtcNow.Date.DayOfYear);
        var random = new Random(seed);
        var homeScore = random.Next(0, 5);
        var awayScore = random.Next(0, 5);

        var homeWeighted = homeScore + myEntry.Strength / 25.0;
        var awayWeighted = awayScore + opponent.Strength / 25.0;

        var isWin = homeWeighted >= awayWeighted;
        if (isWin)
        {
            myEntry.Points += WinPoints;
            opponent.Points = Math.Max(0, opponent.Points - LosePoints);
        }
        else
        {
            myEntry.Points = Math.Max(0, myEntry.Points - LosePoints);
            opponent.Points += WinPoints;
        }

        myEntry.UpdatedAtUtc = DateTime.UtcNow;
        opponent.UpdatedAtUtc = DateTime.UtcNow;

        foreach (var (entry, index) in Rank(entries).Select((value, index) => (value, index)))
        {
            var tracked = entries.First(x => x.Id == entry.Id);
            tracked.Rank = index + 1;
        }

        await dbContext.SaveChangesAsync(cancellationToken);

        var report = isWin
            ? $"Victory against {opponent.TeamName}. +{WinPoints} points."
            : $"Defeat against {opponent.TeamName}. -{LosePoints} points.";

        return new LadderMatchResultRecord(report, myEntry.Stamina);
    }

    public async Task RestoreStaminaAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await GetOrCreateTeamAsync(userId, cancellationToken);
        var ladder = await GetOrCreateLadderAsync(Guid.Empty, cancellationToken);

        await EnsureMembershipAsync(team, ladder, cancellationToken);

        var myEntry = await dbContext.LadderEntries.FirstAsync(x => x.LadderId == ladder.Id && x.TeamId == team.Id, cancellationToken);
        myEntry.Stamina = StaminaMax;
        myEntry.UpdatedAtUtc = DateTime.UtcNow;

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private async Task<LadderSeasonEntity> GetOrCreateLadderAsync(Guid requestedLadderId, CancellationToken cancellationToken)
    {
        if (requestedLadderId != Guid.Empty)
        {
            var existing = await dbContext.LadderSeasons.FirstOrDefaultAsync(x => x.Id == requestedLadderId.ToString("N"), cancellationToken);
            if (existing is not null)
            {
                return existing;
            }
        }

        var active = await dbContext.LadderSeasons.OrderByDescending(x => x.CreatedAtUtc).FirstOrDefaultAsync(cancellationToken);
        if (active is not null)
        {
            return active;
        }

        var ladder = new LadderSeasonEntity
        {
            Id = Guid.NewGuid().ToString("N"),
            CreatedAtUtc = DateTime.UtcNow,
            EndDateUtc = DateTime.UtcNow.AddDays(7)
        };

        dbContext.LadderSeasons.Add(ladder);

        // Seed ladder with bot entries so matchmaking is always available.
        for (var i = 1; i <= LadderSize; i++)
        {
            var random = new Random(HashCode.Combine(i, ladder.Id.GetHashCode()));
            dbContext.LadderEntries.Add(new LadderEntryEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                LadderId = ladder.Id,
                TeamId = null,
                TeamName = $"Ladder Bot {i}",
                TeamLogo = "logo_bot",
                Points = random.Next(20, 120),
                Rank = i,
                Stamina = StaminaMax,
                Strength = random.Next(45, 90),
                IsBot = true,
                UpdatedAtUtc = DateTime.UtcNow
            });
        }

        await dbContext.SaveChangesAsync(cancellationToken);
        return ladder;
    }

    private async Task EnsureMembershipAsync(TeamEntity team, LadderSeasonEntity ladder, CancellationToken cancellationToken)
    {
        var existing = await dbContext.LadderEntries.FirstOrDefaultAsync(x => x.LadderId == ladder.Id && x.TeamId == team.Id, cancellationToken);
        if (existing is not null)
        {
            return;
        }

        var slot = await dbContext.LadderEntries
            .Where(x => x.LadderId == ladder.Id && x.IsBot)
            .OrderBy(x => x.Rank)
            .FirstOrDefaultAsync(cancellationToken);

        if (slot is null)
        {
            slot = new LadderEntryEntity
            {
                Id = Guid.NewGuid().ToString("N"),
                LadderId = ladder.Id,
                TeamId = team.Id,
                TeamName = team.Name,
                TeamLogo = "logo_default",
                Points = 0,
                Rank = LadderSize,
                Stamina = StaminaMax,
                Strength = team.Strength,
                IsBot = false,
                UpdatedAtUtc = DateTime.UtcNow
            };

            dbContext.LadderEntries.Add(slot);
        }
        else
        {
            slot.IsBot = false;
            slot.TeamId = team.Id;
            slot.TeamName = team.Name;
            slot.TeamLogo = "logo_default";
            slot.Strength = team.Strength;
            slot.Stamina = StaminaMax;
            slot.UpdatedAtUtc = DateTime.UtcNow;
        }

        await dbContext.SaveChangesAsync(cancellationToken);
    }

    private async Task<IReadOnlyList<LadderTeamRecord>> BuildSortedTeamsAsync(string myTeamId, string ladderId, CancellationToken cancellationToken)
    {
        var entries = await dbContext.LadderEntries.AsNoTracking().Where(x => x.LadderId == ladderId).ToListAsync(cancellationToken);
        var ranked = Rank(entries);

        return ranked
            .Select(x => MapTeam(x, x.TeamId == myTeamId))
            .ToArray();
    }

    private static IReadOnlyList<LadderEntryEntity> Rank(IReadOnlyList<LadderEntryEntity> entries)
    {
        return entries
            .OrderByDescending(x => x.Points)
            .ThenByDescending(x => x.Strength)
            .ThenBy(x => x.TeamName)
            .ToArray();
    }

    private async Task<TeamEntity> GetOrCreateTeamAsync(string userId, CancellationToken cancellationToken)
    {
        var team = await dbContext.Teams.FirstOrDefaultAsync(x => x.UserId == userId, cancellationToken);
        if (team is not null)
        {
            return team;
        }

        var user = await dbContext.Users.FirstOrDefaultAsync(x => x.Id == userId, cancellationToken)
            ?? throw new InvalidOperationException("User not found for ladder initialization");

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

    private static LadderTeamRecord MapTeam(LadderEntryEntity entry, bool isMine)
    {
        return new LadderTeamRecord(
            TeamId: ParseGuid(entry.TeamId ?? entry.Id),
            TeamName: entry.TeamName,
            TeamLogo: entry.TeamLogo,
            Points: entry.Points,
            Rank: entry.Rank,
            Strength: entry.Strength,
            IsMine: isMine);
    }

    private static Guid ParseGuid(string value)
    {
        return Guid.TryParse(value, out var parsed) ? parsed : Guid.Empty;
    }
}
