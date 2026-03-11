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

        return new FriendsResponse
        {
            Success = true,
            Friends = friends.Select(MapFriend).ToArray(),
            FriendName = friendName
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

        return new FriendsResponse
        {
            Success = true,
            Friends = friends.Select(MapFriend).ToArray()
        };
    }

    public async Task<FriendsResponse> DeclineAsync(string userId, Guid id, CancellationToken cancellationToken = default)
    {
        await friendsStore.DeclineAsync(userId, id, cancellationToken);
        var friends = await friendsStore.GetFriendsAsync(userId, queryText: null, cancellationToken);

        return new FriendsResponse
        {
            Success = true,
            Friends = friends.Select(MapFriend).ToArray()
        };
    }

    private static FriendData MapFriend(FriendRecord x)
    {
        return new FriendData
        {
            Id = ParseGuid(x.ForeignTeamId),
            ForeignUserId = ParseGuid(x.ForeignUserId),
            ForeignTeamId = ParseGuid(x.ForeignTeamId),
            Name = x.Name,
            IsFriend = x.IsFriend,
            IsRequestIncoming = x.IsRequestIncoming,
            IsRequestOutgoing = x.IsRequestOutgoing,
            IsLiked = x.IsLiked
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
                ForeignTeamId = ParseGuid(x.ForeignTeamId),
                OpponentName = x.OpponentName,
                Accepted = x.Accepted,
                MatchDate = x.MatchDateUtc.ToString("O")
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
