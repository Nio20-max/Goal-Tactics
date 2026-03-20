using System.Net;
using System.Net.Http.Headers;
using System.Net.Http.Json;
using GoalTactics.Contracts.Auth;
using GoalTactics.Contracts.Common;
using GoalTactics.Contracts.Friends;
using GoalTactics.Contracts.Team;
using Microsoft.AspNetCore.Mvc.Testing;

namespace GoalTactics.ContractTests.Friends;

public sealed class FriendsControllerTests : IClassFixture<WebApplicationFactory<Program>>
{
    private readonly HttpClient client;

    public FriendsControllerTests(WebApplicationFactory<Program> factory)
    {
        client = factory.CreateClient();
    }

    [Fact]
    public async Task Friends_Request_And_Challenge_Flow_Works()
    {
        var userA = await RegisterAndLoginAsync("Alpha");
        var userB = await RegisterAndLoginAsync("Bravo");

        var teamAId = await GetMyTeamIdAsync(userA.Token);
        var teamBId = await GetMyTeamIdAsync(userB.Token);

        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userA.Token);
        var likeResponse = await client.PostAsJsonAsync("/api/Like", new IdRequest { Id = teamBId });
        Assert.Equal(HttpStatusCode.OK, likeResponse.StatusCode);

        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userB.Token);
        var incomingFriendsResponse = await client.PostAsJsonAsync("/api/GetFriends", new SearchRequest());
        Assert.Equal(HttpStatusCode.OK, incomingFriendsResponse.StatusCode);

        var incomingFriendsBody = await incomingFriendsResponse.Content.ReadFromJsonAsync<FriendsResponse>();
        Assert.NotNull(incomingFriendsBody);
        Assert.True(incomingFriendsBody!.Success);
        Assert.NotEmpty(incomingFriendsBody.Friends);
        if (!incomingFriendsBody.Requests.Any())
        {
            var debugFriends = string.Join("; ", incomingFriendsBody.Friends.Select(f => $"[IsLiked={f.IsLiked}, MyLike={f.MyLike}, LikesMe={f.LikesMe}, IsRequestIncoming={f.IsRequestIncoming}, IsRequestOutgoing={f.IsRequestOutgoing}, IsFriend={f.IsFriend}]") );
            throw new InvalidOperationException($"No requests. friends={incomingFriendsBody.Friends.Count}, requestCount={incomingFriendsBody.Requests.Count}, friends-debug={debugFriends}");
        }
        var firstFriend = incomingFriendsBody.Friends[0];
        Assert.True(firstFriend.IsLiked, $"IsLiked={firstFriend.IsLiked}, MyLike={firstFriend.MyLike}, LikesMe={firstFriend.LikesMe}, IsRequestIncoming={firstFriend.IsRequestIncoming}, IsRequestOutgoing={firstFriend.IsRequestOutgoing}, IsFriend={firstFriend.IsFriend}");

        var friendTeamId = incomingFriendsBody.Friends[0].ForeignTeamId;
        var acceptResponse = await client.PostAsJsonAsync("/api/Accept", new IdRequest { Id = friendTeamId });
        Assert.Equal(HttpStatusCode.OK, acceptResponse.StatusCode);

        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userA.Token);
        var friendsAfterAcceptResponse = await client.PostAsJsonAsync("/api/GetFriends", new SearchRequest());
        Assert.Equal(HttpStatusCode.OK, friendsAfterAcceptResponse.StatusCode);
        var friendsAfterAcceptBody = await friendsAfterAcceptResponse.Content.ReadFromJsonAsync<FriendsResponse>();
        Assert.NotNull(friendsAfterAcceptBody);
        Assert.Contains(friendsAfterAcceptBody!.Friends, x => x.ForeignTeamId == teamBId);
        Assert.DoesNotContain(friendsAfterAcceptBody.Requests, x => x.ForeignTeamId == teamBId);

        var sendChallengeResponse = await client.PostAsJsonAsync("/api/SendChallenge", new IdRequest { Id = teamBId });
        Assert.Equal(HttpStatusCode.OK, sendChallengeResponse.StatusCode);
        var sendChallengeBody = await sendChallengeResponse.Content.ReadFromJsonAsync<ChallengesResponse>();
        Assert.NotNull(sendChallengeBody);
        Assert.NotEmpty(sendChallengeBody!.Challenges);

        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userB.Token);
        var challengesResponse = await client.PostAsJsonAsync("/api/GetChallenges", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, challengesResponse.StatusCode);
        var challengesBody = await challengesResponse.Content.ReadFromJsonAsync<ChallengesResponse>();
        Assert.NotNull(challengesBody);
        Assert.NotEmpty(challengesBody!.Challenges);
        Assert.Equal(2, challengesBody.Challenges[0].MyTeam); // receiver should be team 2 (away)

        var challengeId = challengesBody.Challenges[0].Id;
        var replyResponse = await client.PostAsJsonAsync("/api/ReplyChallenge", new ChallengeReplyRequest { Id = challengeId, Accept = true });
        Assert.Equal(HttpStatusCode.OK, replyResponse.StatusCode);
        var replyBody = await replyResponse.Content.ReadFromJsonAsync<ChallengesResponse>();
        Assert.NotNull(replyBody);
        Assert.Contains(replyBody!.Challenges, x => x.Id == challengeId && x.Accepted);

        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", userA.Token);
        var unlikeResponse = await client.PostAsJsonAsync("/api/Unlike", new IdRequest { Id = teamBId });
        Assert.Equal(HttpStatusCode.OK, unlikeResponse.StatusCode);

        var friendsAfterUnlikeResponse = await client.PostAsJsonAsync("/api/GetFriends", new SearchRequest());
        var friendsAfterUnlikeBody = await friendsAfterUnlikeResponse.Content.ReadFromJsonAsync<FriendsResponse>();
        Assert.NotNull(friendsAfterUnlikeBody);
        Assert.DoesNotContain(friendsAfterUnlikeBody!.Friends, x => x.ForeignTeamId == teamBId);
    }

    private async Task<(string Token, string Email)> RegisterAndLoginAsync(string managerName)
    {
        var email = $"friends_{Guid.NewGuid():N}@example.com";

        var registerResponse = await client.PostAsJsonAsync("/api/Register", new RegisterRequest
        {
            Email = email,
            Password = "pass12345",
            ManagerName = managerName
        });
        Assert.Equal(HttpStatusCode.OK, registerResponse.StatusCode);

        var loginResponse = await client.PostAsJsonAsync("/api/Login", new AuthRequest
        {
            Email = email,
            Password = "pass12345"
        });
        Assert.Equal(HttpStatusCode.OK, loginResponse.StatusCode);

        var loginBody = await loginResponse.Content.ReadFromJsonAsync<AuthResponse>();
        Assert.NotNull(loginBody);
        Assert.False(string.IsNullOrWhiteSpace(loginBody!.Token));

        return (loginBody.Token!, email);
    }

    private async Task<Guid> GetMyTeamIdAsync(string token)
    {
        client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
        var teamResponse = await client.PostAsJsonAsync("/api/GetMyTeamInfo", new RequestObject());
        Assert.Equal(HttpStatusCode.OK, teamResponse.StatusCode);

        var teamBody = await teamResponse.Content.ReadFromJsonAsync<TeamDataResponse>();
        Assert.NotNull(teamBody);
        Assert.NotNull(teamBody!.TeamData);
        Assert.False(string.IsNullOrWhiteSpace(teamBody.TeamData!.Id));

        return Guid.Parse(teamBody.TeamData.Id!);
    }
}
