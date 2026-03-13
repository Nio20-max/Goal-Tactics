using GoalTactics.Contracts.Team;
using GoalTactics.Contracts.User;
using GoalTactics.Application.Common;
using GoalTactics.Application.League;

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

public sealed class TeamService(ITeamStore teamStore, ILeagueStore leagueStore) : ITeamService
{
    public async Task<TeamDataResponse> GetTeamInfoAsync(Guid teamId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetTeamByIdAsync(teamId.ToString("N"), cancellationToken);
        if (team is null)
        {
            return new TeamDataResponse { Success = false, Message = "Team not found" };
        }

        var leagueId = await teamStore.GetLeagueIdForTeamAsync(team.TeamId, cancellationToken);
        return new TeamDataResponse { Success = true, TeamData = BuildTeamData(team, leagueId, true) };
    }

    public async Task<TeamDataResponse> GetMyTeamInfoAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var leagueId = await teamStore.GetLeagueIdForTeamAsync(team.TeamId, cancellationToken);
        return new TeamDataResponse { Success = true, TeamData = BuildTeamData(team, leagueId, false) };
    }

    public async Task<ExtendedTeamDataResponse> GetMyTeamExtendedInfoAsync(string userId, CancellationToken cancellationToken = default)
    {
        var team = await teamStore.GetOrCreateMyTeamAsync(userId, cancellationToken);
        var news = await teamStore.GetTeamNewsAsync(team.TeamId, cancellationToken);
        var stadium = await teamStore.GetStadiumStateAsync(userId, cancellationToken);
        var players = await teamStore.GetSquadPlayersAsync(userId, cancellationToken);
        var leagueId = await teamStore.GetLeagueIdForTeamAsync(team.TeamId, cancellationToken);
        var leagueTable = await leagueStore.GetLeagueTableForUserAsync(userId, leagueId, cancellationToken);
        var leaguePosition = Array.FindIndex(leagueTable.Teams.ToArray(), x => x.IsMine) + 1;
        var selectedShirt = team.SelectedShirt;
        var selectedEmblem = team.SelectedEmblem;

        var seasonInfo = await teamStore.GetSeasonInfoAsync(cancellationToken);

        return new ExtendedTeamDataResponse
        {
            Success = true,
            TeamData = new ExtendedTeamData
            {
                Id = team.TeamId,
                Name = team.Name,
                Logo = selectedEmblem ?? EquipmentCatalog.Emblems[0],
                Country = LegacyAppCompatibility.NormalizeCountryCode(team.Country),
                CountryName = team.CountryName,
                LeagueId = leagueId,
                LeagueName = team.LeagueName,
                HomeTrikot = selectedShirt ?? EquipmentCatalog.Shirts[0],
                AwayTrikot = selectedShirt ?? EquipmentCatalog.Shirts[0],
                MarketValue = team.MarketValue,
                Mood = team.Mood,
                TeamMood = team.TeamMood,
                Wins = team.Wins,
                Losses = team.Losses,
                Fans = team.Fans,
                Members = team.Members,
                Strength = team.Strength,
                MatchTrend = LegacyAppCompatibility.NormalizeMatchTrend(team.MatchTrend),
                UserData = BuildUserData(team),
                MyLike = false,
                LikesMe = false,
                ChallengeStatus = 0,
                LeaguePosition = Math.Max(1, leaguePosition),
                PlayersCount = players.Count,
                BestVictory = "0:0",
                WorstDefeat = "0:0",
                StadiumSize = stadium.Capacity
            },
            News = news.Select(x => new ClubNews { Date = x.Date, Title = x.Title, Text = x.Text }).ToArray(),
            Season = $"#{seasonInfo.SeasonNumber}",
            SeasonStartDate = seasonInfo.SeasonStartDateUtc.AddHours(18).ToString("O"),
            Matchday = seasonInfo.Matchday,
            LastMatch = BuildExtendedMatch(leagueTable, selectedEmblem ?? EquipmentCatalog.Emblems[0], isNextMatch: false),
            NextMatch = BuildExtendedMatch(leagueTable, selectedEmblem ?? EquipmentCatalog.Emblems[0], isNextMatch: true),
            RenameTeamCost = 500
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

    private static TeamData BuildTeamData(TeamRecord team, Guid leagueId, bool socialTarget)
    {
        var selectedShirt = team.SelectedShirt ?? EquipmentCatalog.Shirts[0];
        var selectedEmblem = team.SelectedEmblem ?? EquipmentCatalog.Emblems[0];

        return new TeamData
        {
            Id = team.TeamId,
            Name = team.Name,
            Logo = selectedEmblem,
            Country = LegacyAppCompatibility.NormalizeCountryCode(team.Country),
            CountryName = team.CountryName,
            LeagueId = leagueId,
            LeagueName = team.LeagueName,
            HomeTrikot = selectedShirt,
            AwayTrikot = selectedShirt,
            MarketValue = team.MarketValue,
            Mood = team.Mood,
            TeamMood = team.TeamMood,
            Wins = team.Wins,
            Losses = team.Losses,
            Fans = team.Fans,
            Members = team.Members,
            Strength = team.Strength,
            MatchTrend = LegacyAppCompatibility.NormalizeMatchTrend(team.MatchTrend),
            UserData = BuildUserData(team),
            MyLike = socialTarget,
            LikesMe = socialTarget,
            ChallengeStatus = socialTarget ? 1 : 0
        };
    }

    private static UserData BuildUserData(TeamRecord team)
    {
        var score = LegacyAppCompatibility.EstimateUserScore(team.Strength, team.Wins, team.Fans, team.Members);
        return new UserData
        {
            Name = team.ManagerName,
            Email = team.UserEmail,
            Created = team.UserCreatedAtUtc.ToString("O"),
            LastActivity = team.UserLastActivityAtUtc?.ToString("O"),
            FacebookId = null,
            AppleId = null,
            Password = null,
            Score = score,
            Rank = LegacyAppCompatibility.EstimateRank(score)
        };
    }

    private static MatchData? BuildExtendedMatch(LeagueTableRecord leagueTable, string myLogo, bool isNextMatch)
    {
        var teams = leagueTable.Teams.ToArray();
        var myIndex = Array.FindIndex(teams, entry => entry.IsMine);
        if (myIndex < 0 || teams.Length < 2)
        {
            return null;
        }

        var opponents = teams.Where(entry => !entry.IsMine).ToArray();
        if (opponents.Length == 0)
        {
            return null;
        }

        var mine = teams[myIndex];
        var rotationSeed = mine.MatchesHome + mine.MatchesAway + (isNextMatch ? 0 : -1);
        var opponent = opponents[Math.Abs(rotationSeed) % opponents.Length];
        var isHome = isNextMatch ? (rotationSeed % 2 == 0) : (rotationSeed % 2 != 0);
        var date = isNextMatch ? DateTime.UtcNow.Date.AddHours(18) : DateTime.UtcNow.Date.AddDays(-1).AddHours(18);

        return new MatchData
        {
            Id = Guid.NewGuid(),
            Date = date.ToString("O"),
            HomeLogo = isHome ? myLogo : opponent.Logo,
            AwayLogo = isHome ? opponent.Logo : myLogo,
            HomeName = isHome ? mine.Name : opponent.Name,
            AwayName = isHome ? opponent.Name : mine.Name,
            MyTeam = isHome ? 1 : 2,
            HomeCountry = string.Empty,
            AwayCountry = string.Empty,
            HomeScore = isNextMatch ? -1 : (isHome ? 3 : 1),
            AwayScore = isNextMatch ? -1 : (isHome ? 1 : 3),
            OpponentTeamId = opponent.Id,
            HomeStrength = isNextMatch ? -1 : (int)Math.Round(isHome ? mine.Strength : opponent.Strength, MidpointRounding.AwayFromZero),
            AwayStrength = isNextMatch ? -1 : (int)Math.Round(isHome ? opponent.Strength : mine.Strength, MidpointRounding.AwayFromZero),
            HasLineup = false,
            HomeTrikot = null,
            AwayTrikot = null,
            IsFriendly = false
        };
    }
}
