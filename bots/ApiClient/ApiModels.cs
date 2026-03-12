using System.Text.Json.Serialization;

namespace GoalTactics.Bots.Client.ApiClient;

// ────────────────────────────────────────────────────────────────
// Base request – includes legacy fields some endpoints may expect
// ────────────────────────────────────────────────────────────────

public class RequestObject
{
    [JsonPropertyName("requestId")]
    public string RequestId { get; set; } = Guid.NewGuid().ToString("N");

    [JsonPropertyName("timestamp")]
    public long Timestamp { get; set; } = DateTimeOffset.UtcNow.ToUnixTimeMilliseconds();
}

// ────────────────────────────────────────────────────────────────
// Generic helpers
// ────────────────────────────────────────────────────────────────

public sealed class IdRequest : RequestObject
{
    [JsonPropertyName("id")]
    public long Id { get; set; }
}

public sealed class TextRequest : RequestObject
{
    [JsonPropertyName("text")]
    public string Text { get; set; } = "";
}

// ────────────────────────────────────────────────────────────────
// Auth
// ────────────────────────────────────────────────────────────────

public sealed class RegisterRequest : RequestObject
{
    [JsonPropertyName("isGuest")]
    public bool IsGuest { get; set; }

    [JsonPropertyName("email")]
    public string Email { get; set; } = "";

    [JsonPropertyName("login")]
    public string Login { get; set; } = "";

    [JsonPropertyName("password")]
    public string Password { get; set; } = "";

    [JsonPropertyName("managerName")]
    public string ManagerName { get; set; } = "";

    [JsonPropertyName("teamName")]
    public string TeamName { get; set; } = "";

    [JsonPropertyName("countryId")]
    public int CountryId { get; set; }
}

public sealed class RegisterResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("userId")]
    public long UserId { get; set; }

    [JsonPropertyName("login")]
    public string Login { get; set; } = "";

    [JsonPropertyName("password")]
    public string Password { get; set; } = "";
}

public sealed class LoginRequest : RequestObject
{
    [JsonPropertyName("email")]
    public string Email { get; set; } = "";

    [JsonPropertyName("password")]
    public string Password { get; set; } = "";
}

public sealed class LoginResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("token")]
    public string Token { get; set; } = "";

    [JsonPropertyName("managerName")]
    public string ManagerName { get; set; } = "";

    [JsonPropertyName("userId")]
    public long UserId { get; set; }

    [JsonPropertyName("level")]
    public int Level { get; set; }

    [JsonPropertyName("isAdmin")]
    public bool IsAdmin { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Resources / Team
// ────────────────────────────────────────────────────────────────

public sealed class ResourcesResponse
{
    [JsonPropertyName("money")]
    public long Money { get; set; }

    [JsonPropertyName("premium")]
    public long Premium { get; set; }

    [JsonPropertyName("fans")]
    public long Fans { get; set; }
}

public sealed class TeamExtendedInfoResponse
{
    [JsonPropertyName("teamName")]
    public string TeamName { get; set; } = "";

    [JsonPropertyName("managerName")]
    public string ManagerName { get; set; } = "";

    [JsonPropertyName("level")]
    public int Level { get; set; }

    [JsonPropertyName("leagueId")]
    public int LeagueId { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Squad / Lineup
// ────────────────────────────────────────────────────────────────

public sealed class PlayerDto
{
    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("strength")]
    public int Strength { get; set; }

    [JsonPropertyName("talent")]
    public int Talent { get; set; }

    [JsonPropertyName("age")]
    public int Age { get; set; }

    [JsonPropertyName("position")]
    public string Position { get; set; } = "";

    [JsonPropertyName("isKeeper")]
    public bool IsKeeper { get; set; }
}

public sealed class SquadResponse
{
    [JsonPropertyName("players")]
    public List<PlayerDto> Players { get; set; } = [];
}

public sealed class LineupDto
{
    [JsonPropertyName("matchId")]
    public long MatchId { get; set; }

    [JsonPropertyName("playerIds")]
    public List<long> PlayerIds { get; set; } = [];

    [JsonPropertyName("system")]
    public string System { get; set; } = "";

    [JsonPropertyName("tactic")]
    public string Tactic { get; set; } = "";
}

public sealed class LineupsResponse
{
    [JsonPropertyName("lineups")]
    public List<LineupDto> Lineups { get; set; } = [];
}

public sealed class SaveLineupRequest : RequestObject
{
    [JsonPropertyName("matchId")]
    public long MatchId { get; set; }

    [JsonPropertyName("playerIds")]
    public List<long> PlayerIds { get; set; } = [];

    [JsonPropertyName("system")]
    public string System { get; set; } = "";

    [JsonPropertyName("tactic")]
    public string Tactic { get; set; } = "";
}

// ────────────────────────────────────────────────────────────────
// Transfer Market
// ────────────────────────────────────────────────────────────────

public sealed class SearchTransfermarketRequest : RequestObject
{
    [JsonPropertyName("talent")]
    public RangeFilter? Talent { get; set; }

    [JsonPropertyName("skillIndex")]
    public int? SkillIndex { get; set; }

    [JsonPropertyName("minimumBid")]
    public long? MinimumBid { get; set; }

    [JsonPropertyName("strength")]
    public int? Strength { get; set; }

    [JsonPropertyName("onlyKeeper")]
    public bool? OnlyKeeper { get; set; }
}

public sealed class RangeFilter
{
    [JsonPropertyName("min")]
    public int Min { get; set; }

    [JsonPropertyName("max")]
    public int Max { get; set; }
}

public sealed class AuctionDto
{
    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("playerId")]
    public long PlayerId { get; set; }

    [JsonPropertyName("playerName")]
    public string PlayerName { get; set; } = "";

    [JsonPropertyName("currentBid")]
    public long CurrentBid { get; set; }

    [JsonPropertyName("secondsLeft")]
    public int SecondsLeft { get; set; }

    [JsonPropertyName("highestBidderId")]
    public long HighestBidderId { get; set; }

    [JsonPropertyName("strength")]
    public int Strength { get; set; }

    [JsonPropertyName("talent")]
    public int Talent { get; set; }
}

public sealed class TransfermarketResponse
{
    [JsonPropertyName("auctions")]
    public List<AuctionDto> Auctions { get; set; } = [];
}

public sealed class BidRequest : RequestObject
{
    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("bid")]
    public long Bid { get; set; }
}

public sealed class BidResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }
}

public sealed class FavouritesResponse
{
    [JsonPropertyName("auctions")]
    public List<AuctionDto> Auctions { get; set; } = [];
}

// ────────────────────────────────────────────────────────────────
// Training / Scouting
// ────────────────────────────────────────────────────────────────

public sealed class TrainingResponse
{
    [JsonPropertyName("training")]
    public object? Training { get; set; }
}

public sealed class SaveTrainingRequest : RequestObject
{
    [JsonPropertyName("training")]
    public object? Training { get; set; }
}

public sealed class IndividualTrainingRequest : RequestObject
{
    [JsonPropertyName("id")]
    public long Id { get; set; }
}

public sealed class BookTrainingCampRequest : RequestObject
{
    [JsonPropertyName("camp")]
    public object? Camp { get; set; }
}

public sealed class ScoutedPlayersResponse
{
    [JsonPropertyName("players")]
    public List<PlayerDto> Players { get; set; } = [];
}

public sealed class InstructScoutRequest : RequestObject
{
    [JsonPropertyName("instruction")]
    public object? Instruction { get; set; }
}

public sealed class RecruitScoutedPlayerRequest : RequestObject
{
    [JsonPropertyName("id")]
    public long Id { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Sponsors
// ────────────────────────────────────────────────────────────────

public sealed class SponsorDto
{
    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("starsPerDay")]
    public int StarsPerDay { get; set; }
}

public sealed class SponsorOffersResponse
{
    [JsonPropertyName("sponsors")]
    public List<SponsorDto> Sponsors { get; set; } = [];
}

// ────────────────────────────────────────────────────────────────
// Stadium
// ────────────────────────────────────────────────────────────────

public sealed class StadiumResponse
{
    [JsonPropertyName("buildings")]
    public List<BuildingDto> Buildings { get; set; } = [];

    [JsonPropertyName("capacity")]
    public int Capacity { get; set; }

    [JsonPropertyName("filledPlaces")]
    public int FilledPlaces { get; set; }
}

public sealed class BuildingDto
{
    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("level")]
    public int Level { get; set; }

    [JsonPropertyName("type")]
    public string Type { get; set; } = "";
}

public sealed class BuildStadiumRequest : RequestObject
{
    [JsonPropertyName("id")]
    public long Id { get; set; }
}

public sealed class PlaceOrder
{
    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("count")]
    public int Count { get; set; }
}

public sealed class BuildPlacesRequest : RequestObject
{
    [JsonPropertyName("places")]
    public List<PlaceOrder> Places { get; set; } = [];
}

// ────────────────────────────────────────────────────────────────
// Friends / Social
// ────────────────────────────────────────────────────────────────

public sealed class FriendDto
{
    [JsonPropertyName("id")]
    public long Id { get; set; }

    [JsonPropertyName("managerName")]
    public string ManagerName { get; set; } = "";

    [JsonPropertyName("teamName")]
    public string TeamName { get; set; } = "";

    [JsonPropertyName("status")]
    public string Status { get; set; } = "";
}

public sealed class FriendsResponse
{
    [JsonPropertyName("friends")]
    public List<FriendDto> Friends { get; set; } = [];
}

// ────────────────────────────────────────────────────────────────
// Chat
// ────────────────────────────────────────────────────────────────

public sealed class PostChatMessageRequest : RequestObject
{
    [JsonPropertyName("message")]
    public string Message { get; set; } = "";

    [JsonPropertyName("recipientId")]
    public long RecipientId { get; set; }
}

public sealed class ChatHistoryResponse
{
    [JsonPropertyName("messages")]
    public List<ChatMessageDto> Messages { get; set; } = [];
}

public sealed class ChatMessageDto
{
    [JsonPropertyName("senderId")]
    public long SenderId { get; set; }

    [JsonPropertyName("message")]
    public string Message { get; set; } = "";

    [JsonPropertyName("timestamp")]
    public DateTime Timestamp { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Ladder / Match
// ────────────────────────────────────────────────────────────────

public sealed class LadderResponse
{
    [JsonPropertyName("teams")]
    public List<LadderTeamDto> Teams { get; set; } = [];
}

public sealed class LadderTeamDto
{
    [JsonPropertyName("teamId")]
    public long TeamId { get; set; }

    [JsonPropertyName("teamName")]
    public string TeamName { get; set; } = "";

    [JsonPropertyName("points")]
    public int Points { get; set; }
}

public sealed class RunMatchRequest : RequestObject
{
    [JsonPropertyName("teamId")]
    public long TeamId { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Shop / Rewards
// ────────────────────────────────────────────────────────────────

public sealed class WatchAdResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("value")]
    public int Value { get; set; }
}

public sealed class GenericSuccessResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Common
// ────────────────────────────────────────────────────────────────

public sealed class PingResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("message")]
    public string Message { get; set; } = "";
}

public sealed class CountryDto
{
    [JsonPropertyName("id")]
    public int Id { get; set; }

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";
}

public sealed class CountriesResponse
{
    [JsonPropertyName("countries")]
    public List<CountryDto> Countries { get; set; } = [];
}

public sealed class SendChallengeRequest : RequestObject
{
    [JsonPropertyName("id")]
    public long Id { get; set; }
}
