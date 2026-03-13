using System.Text.Json.Serialization;

namespace GoalTactics.Bots.Client.ApiClient;

// ────────────────────────────────────────────────────────────────
// Base request – matches server's RequestObject
// ────────────────────────────────────────────────────────────────

public class RequestObject
{
    [JsonPropertyName("signature")]
    public string? Signature { get; set; }

    [JsonPropertyName("token")]
    public string? Token { get; set; }

    [JsonPropertyName("locale")]
    public string? Locale { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Generic helpers
// ────────────────────────────────────────────────────────────────

public class IdRequest : RequestObject
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = "";
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
    public string? CountryId { get; set; }
}

public sealed class RegisterResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("userId")]
    public string? UserId { get; set; }

    [JsonPropertyName("login")]
    public string Login { get; set; } = "";

    [JsonPropertyName("password")]
    public string Password { get; set; } = "";

    [JsonPropertyName("message")]
    public string? Message { get; set; }

    [JsonPropertyName("status")]
    public int Status { get; set; }
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
    public string UserId { get; set; } = "";

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
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("money")]
    public decimal Money { get; set; }

    [JsonPropertyName("medipacks")]
    public decimal Medipacks { get; set; }

    [JsonPropertyName("gtStars")]
    public decimal GTStars { get; set; }
}

public sealed class TeamExtendedInfoResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("teamData")]
    public TeamDataDto? TeamData { get; set; }

    [JsonPropertyName("season")]
    public string? Season { get; set; }

    [JsonPropertyName("matchday")]
    public int Matchday { get; set; }
}

public sealed class TeamDataDto
{
    [JsonPropertyName("id")]
    public string? Id { get; set; }

    [JsonPropertyName("name")]
    public string? Name { get; set; }

    [JsonPropertyName("country")]
    public string? Country { get; set; }

    [JsonPropertyName("strength")]
    public int Strength { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Squad / Lineup
// ────────────────────────────────────────────────────────────────

public sealed class PlayerDto
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = "";

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("strength")]
    public decimal Strength { get; set; }

    [JsonPropertyName("talent")]
    public int Talent { get; set; }

    [JsonPropertyName("age")]
    public int Age { get; set; }

    /// <summary>Position index: 0=GK, 1=DEF, 2=MID, 3=FWD.</summary>
    [JsonPropertyName("position")]
    public int Position { get; set; }

    [JsonPropertyName("fitness")]
    public int Fitness { get; set; }

    [JsonPropertyName("salary")]
    public decimal Salary { get; set; }

    [JsonPropertyName("marketValue")]
    public decimal MarketValue { get; set; }

    [JsonPropertyName("country")]
    public string? Country { get; set; }

    [JsonPropertyName("hasIndividualTraining")]
    public bool HasIndividualTraining { get; set; }
}

public sealed class SquadResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("players")]
    public List<PlayerDto> Players { get; set; } = [];

    [JsonPropertyName("playersOnTransfermarket")]
    public List<PlayerDto> PlayersOnTransfermarket { get; set; } = [];
}

public sealed class LineupSummaryDto
{
    [JsonPropertyName("matchId")]
    public string MatchId { get; set; } = "";

    [JsonPropertyName("id")]
    public string Id { get; set; } = "";

    [JsonPropertyName("opponent")]
    public string? Opponent { get; set; }

    [JsonPropertyName("isLocked")]
    public bool IsLocked { get; set; }

    [JsonPropertyName("hasLineup")]
    public bool HasLineup { get; set; }

    [JsonPropertyName("homeName")]
    public string? HomeName { get; set; }

    [JsonPropertyName("awayName")]
    public string? AwayName { get; set; }
}

public sealed class LineupsResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("lineups")]
    public List<LineupSummaryDto> Lineups { get; set; } = [];
}

public sealed class SaveLineupRequest : RequestObject
{
    [JsonPropertyName("matchId")]
    public string MatchId { get; set; } = "";

    [JsonPropertyName("playerIds")]
    public List<string> PlayerIds { get; set; } = [];

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

    [JsonPropertyName("strength")]
    public RangeFilter? Strength { get; set; }

    [JsonPropertyName("age")]
    public RangeFilter? Age { get; set; }

    [JsonPropertyName("skillIndex")]
    public int SkillIndex { get; set; } = -1;

    [JsonPropertyName("minimumBid")]
    public int? MinimumBid { get; set; }

    [JsonPropertyName("budget")]
    public decimal? Budget { get; set; }

    [JsonPropertyName("onlyKeeper")]
    public bool? OnlyKeeper { get; set; }
}

public sealed class RangeFilter
{
    [JsonPropertyName("min")]
    public int? Min { get; set; }

    [JsonPropertyName("max")]
    public int? Max { get; set; }
}

public sealed class TransferPlayerDto
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = "";

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("country")]
    public string? Country { get; set; }

    [JsonPropertyName("strength")]
    public decimal Strength { get; set; }

    [JsonPropertyName("talent")]
    public int Talent { get; set; }

    [JsonPropertyName("age")]
    public int Age { get; set; }

    [JsonPropertyName("position")]
    public int Position { get; set; }

    [JsonPropertyName("auctionId")]
    public string AuctionId { get; set; } = "";

    [JsonPropertyName("bid")]
    public long Bid { get; set; }

    [JsonPropertyName("bidTeamName")]
    public string? BidTeamName { get; set; }

    [JsonPropertyName("isFrozen")]
    public bool IsFrozen { get; set; }

    [JsonPropertyName("minimumBid")]
    public int MinimumBid { get; set; }
}

public sealed class TransfermarketResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("players")]
    public List<TransferPlayerDto> Players { get; set; } = [];

    [JsonPropertyName("favorites")]
    public List<TransferPlayerDto> Favorites { get; set; } = [];

    [JsonPropertyName("sellings")]
    public List<TransferPlayerDto> Sellings { get; set; } = [];

    [JsonPropertyName("myTeamId")]
    public string? MyTeamId { get; set; }
}

public sealed class BidRequest : IdRequest
{
    [JsonPropertyName("bid")]
    public int Bid { get; set; }
}

public sealed class BidResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }
}

public sealed class FavouritesResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("players")]
    public List<TransferPlayerDto> Players { get; set; } = [];
}

// ────────────────────────────────────────────────────────────────
// Training / Scouting
// ────────────────────────────────────────────────────────────────

public sealed class TeamTrainingDto
{
    [JsonPropertyName("mainSkillIndex")]
    public int MainSkillIndex { get; set; }

    [JsonPropertyName("subSkillIndex")]
    public int SubSkillIndex { get; set; }

    [JsonPropertyName("efficiencyValue")]
    public int EfficiencyValue { get; set; }

    [JsonPropertyName("noTraining")]
    public bool NoTraining { get; set; }
}

public sealed class TrainingResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("teamTraining")]
    public TeamTrainingDto? TeamTraining { get; set; }
}

public sealed class SaveTrainingRequest : RequestObject
{
    [JsonPropertyName("mainSkillIndex")]
    public int MainSkillIndex { get; set; }

    [JsonPropertyName("subSkillIndex")]
    public int SubSkillIndex { get; set; }
}

public sealed class IndividualTrainingRequest : IdRequest { }

public sealed class BookTrainingCampRequest : RequestObject
{
    [JsonPropertyName("campType")]
    public string? CampType { get; set; }
}

public sealed class ScoutedPlayerDto
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = "";

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("position")]
    public string? Position { get; set; }

    [JsonPropertyName("talent")]
    public int Talent { get; set; }

    [JsonPropertyName("strength")]
    public int Strength { get; set; }
}

public sealed class ScoutedPlayersResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("players")]
    public List<ScoutedPlayerDto> Players { get; set; } = [];

    [JsonPropertyName("scoutingCost")]
    public int ScoutingCost { get; set; }

    [JsonPropertyName("pendingScoutCount")]
    public int PendingScoutCount { get; set; }

    [JsonPropertyName("maxSimultaneousScouts")]
    public int MaxSimultaneousScouts { get; set; }
}

public sealed class InstructScoutRequest : RequestObject
{
    [JsonPropertyName("scoutType")]
    public string? ScoutType { get; set; }

    [JsonPropertyName("positionFilter")]
    public string? PositionFilter { get; set; }

    [JsonPropertyName("position")]
    public int Position { get; set; } = -1;

    [JsonPropertyName("price")]
    public int Price { get; set; }
}

public sealed class RecruitScoutedPlayerRequest : IdRequest { }

// ────────────────────────────────────────────────────────────────
// Sponsors
// ────────────────────────────────────────────────────────────────

public sealed class SponsorOfferDto
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = "";

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("description")]
    public string? Description { get; set; }

    [JsonPropertyName("money")]
    public int Money { get; set; }

    [JsonPropertyName("stars")]
    public int Stars { get; set; }

    [JsonPropertyName("bonusPerWin")]
    public int BonusPerWin { get; set; }

    [JsonPropertyName("bonusPerGoal")]
    public int BonusPerGoal { get; set; }

    [JsonPropertyName("contractDays")]
    public int ContractDays { get; set; }

    [JsonPropertyName("isActive")]
    public bool IsActive { get; set; }
}

public sealed class SponsorOffersResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("offers")]
    public List<SponsorOfferDto> Offers { get; set; } = [];

    [JsonPropertyName("negotiateCost")]
    public int NegotiateCost { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Stadium
// ────────────────────────────────────────────────────────────────

public sealed class StadiumResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("stadium")]
    public StadiumDataDto? Stadium { get; set; }

    [JsonPropertyName("buildings")]
    public List<BuildingDto> Buildings { get; set; } = [];

    [JsonPropertyName("name")]
    public string? Name { get; set; }

    [JsonPropertyName("grassQuality")]
    public int GrassQuality { get; set; }

    [JsonPropertyName("maxBuildingLevel")]
    public int MaxBuildingLevel { get; set; }
}

public sealed class StadiumDataDto
{
    [JsonPropertyName("name")]
    public string? Name { get; set; }

    [JsonPropertyName("capacity")]
    public int Capacity { get; set; }

    [JsonPropertyName("grassQuality")]
    public int GrassQuality { get; set; }

    [JsonPropertyName("earningsAverage")]
    public int EarningsAverage { get; set; }
}

public sealed class BuildingDto
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = "";

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("description")]
    public string? Description { get; set; }

    [JsonPropertyName("effectName")]
    public string? EffectName { get; set; }

    [JsonPropertyName("currentValue")]
    public int CurrentValue { get; set; }

    [JsonPropertyName("maxValue")]
    public int MaxValue { get; set; }

    [JsonPropertyName("upgradeCost")]
    public decimal UpgradeCost { get; set; }

    [JsonPropertyName("capacity")]
    public int Capacity { get; set; }

    [JsonPropertyName("utilization")]
    public int Utilization { get; set; }
}

public sealed class BuildStadiumRequest : IdRequest { }

public sealed class PlaceOrder
{
    [JsonPropertyName("id")]
    public string Id { get; set; } = "";

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
    public string Id { get; set; } = "";

    [JsonPropertyName("userName")]
    public string? UserName { get; set; }

    [JsonPropertyName("teamName")]
    public string TeamName { get; set; } = "";

    [JsonPropertyName("teamId")]
    public string? TeamId { get; set; }

    [JsonPropertyName("isFriend")]
    public bool IsFriend { get; set; }

    [JsonPropertyName("isRequestIncoming")]
    public bool IsRequestIncoming { get; set; }

    [JsonPropertyName("isRequestOutgoing")]
    public bool IsRequestOutgoing { get; set; }

    [JsonPropertyName("isLiked")]
    public bool IsLiked { get; set; }

    [JsonPropertyName("strength")]
    public int Strength { get; set; }

    [JsonPropertyName("myLike")]
    public bool MyLike { get; set; }

    [JsonPropertyName("likesMe")]
    public bool LikesMe { get; set; }

    [JsonPropertyName("challengeStatus")]
    public int ChallengeStatus { get; set; }
}

public sealed class FriendsResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

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
}

public sealed class ChatHistoryResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("messages")]
    public List<ChatMessageDto> Messages { get; set; } = [];

    [JsonPropertyName("userId")]
    public string? UserId { get; set; }
}

public sealed class ChatMessageDto
{
    [JsonPropertyName("userId")]
    public string UserId { get; set; } = "";

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("message")]
    public string Message { get; set; } = "";

    [JsonPropertyName("date")]
    public string? Date { get; set; }

    [JsonPropertyName("isMine")]
    public bool IsMine { get; set; }
}

// ────────────────────────────────────────────────────────────────
// Ladder / Match
// ────────────────────────────────────────────────────────────────

public sealed class LadderResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("teams")]
    public List<LadderTeamDto> Teams { get; set; } = [];

    [JsonPropertyName("endDate")]
    public string? EndDate { get; set; }

    [JsonPropertyName("ladderId")]
    public string? LadderId { get; set; }
}

public sealed class LadderTeamDto
{
    [JsonPropertyName("teamId")]
    public string TeamId { get; set; } = "";

    [JsonPropertyName("teamName")]
    public string TeamName { get; set; } = "";

    [JsonPropertyName("points")]
    public int Points { get; set; }

    [JsonPropertyName("rank")]
    public int Rank { get; set; }

    [JsonPropertyName("strength")]
    public int Strength { get; set; }

    [JsonPropertyName("isMine")]
    public bool IsMine { get; set; }
}

public sealed class RunMatchRequest : RequestObject
{
    [JsonPropertyName("teamId")]
    public string TeamId { get; set; } = "";
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
    public string Id { get; set; } = "";

    [JsonPropertyName("name")]
    public string Name { get; set; } = "";

    [JsonPropertyName("isoCode")]
    public string IsoCode { get; set; } = "";
}

public sealed class CountriesResponse
{
    [JsonPropertyName("success")]
    public bool Success { get; set; }

    [JsonPropertyName("countries")]
    public List<CountryDto> Countries { get; set; } = [];
}

public sealed class SendChallengeRequest : IdRequest { }
