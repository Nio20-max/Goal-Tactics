using System.Text.Json.Serialization;

namespace GoalTactics.Contracts.Friends;

public sealed class FriendData
{
    // Android fields
    [JsonPropertyName("id")]
    public Guid Id { get; init; }

    [JsonPropertyName("userId")]
    public Guid ForeignUserId { get; init; }

    [JsonPropertyName("teamId")]
    public Guid ForeignTeamId { get; init; }

    [JsonPropertyName("name")]
    public string? Name { get; init; }

    [JsonPropertyName("isFriend")]
    public bool IsFriend { get; init; }

    [JsonPropertyName("isRequestIncoming")]
    public bool IsRequestIncoming { get; init; }

    [JsonPropertyName("isRequestOutgoing")]
    public bool IsRequestOutgoing { get; init; }

    [JsonPropertyName("isLiked")]
    public bool IsLiked { get; init; }

    // Xamarin fields
    [JsonIgnore]
    public Guid TeamId { get; init; }

    [JsonPropertyName("userName")]
    public string? UserName { get; init; }

    [JsonPropertyName("teamName")]
    public string? TeamName { get; init; }

    [JsonPropertyName("country")]
    public string? Country { get; init; }

    [JsonPropertyName("teamLogo")]
    public string? TeamLogo { get; init; }

    [JsonPropertyName("strength")]
    public int Strength { get; init; }

    [JsonPropertyName("lastActivity")]
    public string? LastActivity { get; init; }

    [JsonPropertyName("language")]
    public string? Language { get; init; }

    [JsonPropertyName("myLike")]
    public bool MyLike { get; init; }

    [JsonPropertyName("likesMe")]
    public bool LikesMe { get; init; }

    [JsonPropertyName("challengeStatus")]
    public int ChallengeStatus { get; init; }

    [JsonPropertyName("challengeId")]
    public Guid ChallengeId { get; init; }
}
