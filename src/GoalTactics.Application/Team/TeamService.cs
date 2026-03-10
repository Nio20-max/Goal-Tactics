using GoalTactics.Contracts.Team;
using GoalTactics.Contracts.User;

namespace GoalTactics.Application.Team;

public interface ITeamService
{
    Task<TeamDataResponse> GetTeamInfoAsync(Guid teamId, CancellationToken cancellationToken = default);

    Task<TeamDataResponse> GetMyTeamInfoAsync(string userId, CancellationToken cancellationToken = default);

    Task<ExtendedTeamDataResponse> GetMyTeamExtendedInfoAsync(string userId, CancellationToken cancellationToken = default);

    Task<ClubNewsResponse> GetClubNewsAsync(Guid teamId, string userId, CancellationToken cancellationToken = default);

    Task<ResourcesResponse> GetMyResourcesAsync(string userId, CancellationToken cancellationToken = default);

    Task<MailResponse> GetMyMailAsync(string userId, CancellationToken cancellationToken = default);

    Task MarkAsReadAsync(string userId, Guid mailId, CancellationToken cancellationToken = default);

    Task MarkAllAsReadAsync(string userId, CancellationToken cancellationToken = default);

    Task DeleteMailAsync(string userId, Guid mailId, CancellationToken cancellationToken = default);

    Task DeleteAllReadAsync(string userId, CancellationToken cancellationToken = default);

    Task<AccomplishmentsResponse> GetAccomplishmentsAsync(string userId, CancellationToken cancellationToken = default);

    Task<FinanceHistoryResponse> GetFinanceHistoryAsync(string userId, CancellationToken cancellationToken = default);

    Task<FinancesResponse> GetFinancesAsync(string userId, CancellationToken cancellationToken = default);

    Task ChangeTeamNameAsync(string userId, Guid teamId, string name, CancellationToken cancellationToken = default);
}

public sealed class TeamService(ITeamStore teamStore) : ITeamService
{
    public async Task<TeamDataResponse> GetTeamInfoAsync(Guid teamId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetTeamByIdAsync(teamId.ToString("N"), cancellationToken);
        if (team is null)
        {
            return new TeamDataResponse { Success = false, Message = "Team not found" };
        }

        return new TeamDataResponse { Success = true, TeamData = MapTeam(team) };
    }

    public async Task<TeamDataResponse> GetMyTeamInfoAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        return new TeamDataResponse { Success = true, TeamData = MapTeam(team) };
    }

    public async Task<ExtendedTeamDataResponse> GetMyTeamExtendedInfoAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var news = await teamStore.GetTeamNewsAsync(team.TeamId, cancellationToken);
        var stadium = await teamStore.GetStadiumStateAsync(userId, cancellationToken);
        var players = await teamStore.GetSquadPlayersAsync(userId, cancellationToken);
        var leagueId = await teamStore.GetLeagueIdForTeamAsync(team.TeamId, cancellationToken);

        return new ExtendedTeamDataResponse
        {
            Success = true,
            TeamData = new ExtendedTeamData
            {
                Id = team.TeamId,
                Name = team.Name,
                Country = team.Country,
                CountryName = team.CountryName,
                LeagueId = leagueId,
                LeagueName = team.LeagueName,
                MarketValue = team.MarketValue,
                Mood = team.Mood,
                TeamMood = team.TeamMood,
                Wins = team.Wins,
                Losses = team.Losses,
                Fans = team.Fans,
                Members = team.Members,
                Strength = team.Strength,
                MatchTrend = team.MatchTrend,
                UserData = new UserData
                {
                    Name = team.Name,
                    Email = team.UserEmail,
                    Created = team.UserCreatedAtUtc.ToString("O"),
                    LastActivity = team.UserLastActivityAtUtc?.ToString("O")
                },
                LeaguePosition = 1,
                PlayersCount = players.Count,
                BestVictory = "3-0",
                WorstDefeat = "0-2",
                StadiumSize = stadium.Capacity
            },
            News = news.Select(x => new ClubNews { Date = x.Date, Title = x.Title, Text = x.Text }).ToArray(),
            Season = "S1",
            SeasonStartDate = DateTime.UtcNow.Date.ToString("O"),
            Matchday = 1,
            RenameTeamCost = 100
        };
    }

    public async Task<ClubNewsResponse> GetClubNewsAsync(Guid teamId, string userId, CancellationToken cancellationToken = default)
    {
        var effectiveTeamId = teamId == Guid.Empty
            ? (await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken)).TeamId
            : teamId.ToString("N");

        var news = await teamStore.GetTeamNewsAsync(effectiveTeamId, cancellationToken);
        return new ClubNewsResponse
        {
            Success = true,
            News = news.Select(x => new ClubNews { Date = x.Date, Title = x.Title, Text = x.Text }).ToArray()
        };
    }

    public async Task<ResourcesResponse> GetMyResourcesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var resources = await teamStore.GetTeamResourcesAsync(team.TeamId, cancellationToken);

        return new ResourcesResponse
        {
            Success = true,
            Money = resources.Money,
            Medipacks = resources.Medipacks,
            GTStars = resources.GTStars
        };
    }

    public async Task<MailResponse> GetMyMailAsync(string userId, CancellationToken cancellationToken = default)
    {
        var mails = await teamStore.GetMyMailAsync(userId, cancellationToken);
        return new MailResponse
        {
            Success = true,
            Mails = mails.Select(x => new MailData
            {
                Id = Guid.TryParse(x.MailId, out var id) ? id : Guid.Empty,
                Date = x.Date,
                Subject = x.Subject,
                Sender = x.Sender,
                Message = x.Message,
                Extra = x.Extra,
                IsNew = x.IsNew,
                SenderType = x.SenderType
            }).ToArray()
        };
    }

    public Task MarkAsReadAsync(string userId, Guid mailId, CancellationToken cancellationToken = default)
    {
        return teamStore.MarkMailAsReadAsync(userId, mailId.ToString("N"), cancellationToken);
    }

    public Task MarkAllAsReadAsync(string userId, CancellationToken cancellationToken = default)
    {
        return teamStore.MarkAllMailAsReadAsync(userId, cancellationToken);
    }

    public Task DeleteMailAsync(string userId, Guid mailId, CancellationToken cancellationToken = default)
    {
        return teamStore.DeleteMailAsync(userId, mailId.ToString("N"), cancellationToken);
    }

    public Task DeleteAllReadAsync(string userId, CancellationToken cancellationToken = default)
    {
        return teamStore.DeleteAllReadMailAsync(userId, cancellationToken);
    }

    public async Task<AccomplishmentsResponse> GetAccomplishmentsAsync(string userId, CancellationToken cancellationToken = default)
    {
        var items = await teamStore.GetAccomplishmentsAsync(userId, cancellationToken);
        return new AccomplishmentsResponse
        {
            Success = true,
            Accomplishments = items.Select(x => new AccomplishmentData { Name = x.Name, Image = x.Image }).ToArray()
        };
    }

    public async Task<FinanceHistoryResponse> GetFinanceHistoryAsync(string userId, CancellationToken cancellationToken = default)
    {
        var entries = await teamStore.GetFinanceHistoryAsync(userId, cancellationToken);
        return new FinanceHistoryResponse
        {
            Success = true,
            FinanceHistory = entries.Select(x => new FinanceHistoryData { Date = x.Date, Income = x.Income, Outcome = x.Outcome, Balance = x.Balance }).ToArray()
        };
    }

    public async Task<FinancesResponse> GetFinancesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var finances = await teamStore.GetFinancesAsync(userId, cancellationToken);
        return new FinancesResponse
        {
            Success = true,
            Today = finances.Today,
            Yesterday = finances.Yesterday,
            Todays = finances.Todays.Select(x => new FinanceData { Success = true, BookingType = x.BookingType, Value = x.Value, Description = x.Description, IsEarning = x.IsEarning }).ToArray(),
            Yesterdays = finances.Yesterdays.Select(x => new FinanceData { Success = true, BookingType = x.BookingType, Value = x.Value, Description = x.Description, IsEarning = x.IsEarning }).ToArray()
        };
    }

    public Task ChangeTeamNameAsync(string userId, Guid teamId, string name, CancellationToken cancellationToken = default)
    {
        return teamStore.RenameTeamAsync(userId, teamId.ToString("N"), name, cancellationToken);
    }

    private static TeamData MapTeam(TeamRecord team)
    {
        return new TeamData
        {
            Id = team.TeamId,
            Name = team.Name,
            Country = team.Country,
            CountryName = team.CountryName,
            LeagueName = team.LeagueName,
            MarketValue = team.MarketValue,
            Mood = team.Mood,
            TeamMood = team.TeamMood,
            Wins = team.Wins,
            Losses = team.Losses,
            Fans = team.Fans,
            Members = team.Members,
            Strength = team.Strength,
            MatchTrend = team.MatchTrend,
            UserData = new UserData
            {
                Name = team.Name,
                Email = team.UserEmail,
                Created = team.UserCreatedAtUtc.ToString("O"),
                LastActivity = team.UserLastActivityAtUtc?.ToString("O")
            }
        };
    }
}
