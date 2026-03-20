using GoalTactics.Contracts.Friends;

namespace GoalTactics.Application.Friends;

public interface IFriendsService
{
    Task<FriendsResponse> GetFriendsAsync(string userId, SearchRequest request, CancellationToken cancellationToken = default);

    Task<ChallengesResponse> GetChallengesAsync(string userId, CancellationToken cancellationToken = default);

    Task<ChallengesResponse> ReplyChallengeAsync(string userId, ChallengeReplyRequest request, CancellationToken cancellationToken = default);

    Task<ChallengesResponse> SendChallengeAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task LikeAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task UnlikeAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task<FriendsResponse> AcceptAsync(string userId, Guid id, CancellationToken cancellationToken = default);

    Task<FriendsResponse> DeclineAsync(string userId, Guid id, CancellationToken cancellationToken = default);
}

public sealed class FriendsService(IFriendsStore friendsStore) : IFriendsService
{
    public async Task<FriendsResponse> GetFriendsAsync(string userId, SearchRequest request, CancellationToken cancellationToken = default)
    {
        var friends = await friendsStore.GetFriendsAsync(userId, request.Text, cancellationToken);
        var friendName = await friendsStore.FindFriendNameAsync(request.Text, cancellationToken);

        var totalCount = friends.Count;
        var page = request.SafePage;
        var pageSize = request.SafePageSize;
        var paged = friends.Skip((page - 1) * pageSize).Take(pageSize).ToArray();

        var mapped = paged.Select(MapFriend).ToArray();
        var accepted = mapped.Where(x => x.IsFriend).ToArray();
        var pending = mapped.Where(x => !x.IsFriend).ToArray();

        return new FriendsResponse
        {
            Success = true,
            Friends = mapped,
            Requests = pending,
            FriendName = friendName,
            TotalCount = totalCount,
            CurrentPage = page,
            TotalPages = (int)Math.Ceiling((double)totalCount / pageSize)
        };
    }

    public async Task<ChallengesResponse> GetChallengesAsync(string userId, CancellationToken cancellationToken = default)
    {
        var data = await friendsStore.GetChallengesAsync(userId, cancellationToken);
        return MapChallenges(data);
    }

    public async Task<ChallengesResponse> ReplyChallengeAsync(string userId, ChallengeReplyRequest request, CancellationToken cancellationToken = default)
    {
        var data = await friendsStore.ReplyChallengeAsync(userId, request.Id, request.Accept, cancellationToken);
        return MapChallenges(data);
    }

    public async Task<ChallengesResponse> SendChallengeAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        var data = await friendsStore.SendChallengeAsync(userId, id, cancellationToken);
        return MapChallenges(data);
    }

    public Task LikeAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        return friendsStore.LikeAsync(userId, id, cancellationToken);
    }

    public Task UnlikeAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        return friendsStore.UnlikeAsync(userId, id, cancellationToken);
    }

    public async Task<FriendsResponse> AcceptAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        await friendsStore.AcceptAsync(userId, id, cancellationToken);
        var friends = await friendsStore.GetFriendsAsync(userId, queryText: null, cancellationToken);
        var mapped = friends.Select(MapFriend).ToArray();

        return new FriendsResponse
        {
            Success = true,
            Friends = mapped,
            Requests = mapped.Where(x => !x.IsFriend).ToArray()
        };
    }

    public async Task<FriendsResponse> DeclineAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        await friendsStore.DeclineAsync(userId, id, cancellationToken);
        var friends = await friendsStore.GetFriendsAsync(userId, queryText: null, cancellationToken);
        var mapped = friends.Select(MapFriend).ToArray();

        return new FriendsResponse
        {
            Success = true,
            Friends = mapped,
            Requests = mapped.Where(x => !x.IsFriend).ToArray()
        };
    }

    private static FriendData MapFriend(FriendRecord x)
    {
        var teamId = ParseGuid(x.ForeignTeamId);
        return new FriendData
        {
            // Use relation Id so clients can unambiguously accept/decline/remove the request.
            Id = ParseGuid(x.RelationId),
            ForeignUserId = ParseGuid(x.ForeignUserId),
            ForeignTeamId = teamId,
            Name = x.Name,
            IsFriend = x.IsFriend,
            IsRequestIncoming = x.IsRequestIncoming,
            IsRequestOutgoing = x.IsRequestOutgoing,
            IsLiked = x.IsRequestIncoming || x.IsFriend,
            // Xamarin fields
            TeamId = teamId,
            UserName = x.Name,
            TeamName = x.TeamName ?? x.Name,
            Country = x.Country ?? "de",
            TeamLogo = x.TeamLogo ?? "wappen01",
            Strength = x.Strength,
            LastActivity = DateTime.UtcNow.AddHours(-1).ToString("O"),
            Language = x.Language ?? "de",
            MyLike = x.IsRequestOutgoing,
            LikesMe = x.IsRequestIncoming,
            ChallengeStatus = x.ChallengeStatus,
            ChallengeId = ParseGuid(x.ChallengeId)
        };
    }

    private static ChallengesResponse MapChallenges(ChallengeOverviewRecord data)
    {
        return new ChallengesResponse
        {
            Success = true,
            Challenges = data.Challenges.Select(x => new ChallengeData
            {
                Id = ParseGuid(x.Id),
                MatchId = Guid.Empty,
                Date = x.MatchDateUtc.ToString("O"),
                MatchDate = x.MatchDateUtc.ToString("O"),
                OpponentTeamId = ParseGuid(x.ForeignTeamId),
                OpponentName = x.OpponentName,
                Accepted = x.Accepted,
                IsAccepted = x.Accepted,
                IsDeclined = x.IsDeclined,
                MyTeam = x.MyTeam,
                HomeScore = x.HomeScore,
                AwayScore = x.AwayScore,
                HomeName = x.HomeName,
                AwayName = x.AwayName,
                HomeLogo = x.HomeLogo,
                AwayLogo = x.AwayLogo,
                HomeCountry = x.HomeCountry,
                AwayCountry = x.AwayCountry,
                HomeStrength = x.HomeStrength,
                AwayStrength = x.AwayStrength,
                HasLineup = false,
                IsFriendly = true
            }).ToArray(),
            Friends = data.Friends.Select(MapFriend).ToArray(),
            MatchDate = data.MatchDateUtc.ToString("O"),
            EndDate = data.EndDateUtc.ToString("O")
        };
    }

    private static Guid ParseGuid(string value)
    {
        return Guid.TryParse(value, out var parsed) ? parsed : Guid.Empty;
    }
}
