package com.goaltactics.app.data.model

import java.util.UUID

// ── Base types ──────────────────────────────────────────────

open class RequestObject

open class ResponseObject(
    val success: Boolean = true,
    val message: String? = null
)

class IdRequest(val id: UUID) : RequestObject()

class TextRequest(val text: String)

// ── Auth ────────────────────────────────────────────────────

data class AuthRequest(
    val email: String,
    val password: String
)

data class AuthResponse(
    val success: Boolean,
    val token: String?,
    val managerName: String?,
    val message: String?
)

data class RegisterRequest(
    val email: String,
    val password: String,
    val managerName: String
)

data class RegisterResponse(
    val success: Boolean,
    val userId: String?,
    val message: String?
)

// ── Team / Club ─────────────────────────────────────────────

data class TeamData(
    val id: String?,
    val name: String?,
    val country: String?,
    val countryName: String?,
    val leagueName: String?,
    val marketValue: Double,
    val mood: Int,
    val teamMood: String?,
    val wins: Int,
    val losses: Int,
    val fans: Int,
    val members: Int,
    val strength: Int,
    val matchTrend: String?,
    val userData: UserData?
)

data class ExtendedTeamData(
    val id: String?,
    val name: String?,
    val country: String?,
    val countryName: String?,
    val leagueName: String?,
    val marketValue: Double,
    val mood: Int,
    val teamMood: String?,
    val wins: Int,
    val losses: Int,
    val fans: Int,
    val members: Int,
    val strength: Int,
    val matchTrend: String?,
    val userData: UserData?,
    val leaguePosition: Int,
    val playersCount: Int,
    val bestVictory: String?,
    val worstDefeat: String?,
    val stadiumSize: Int
)

data class TeamDataResponse(
    val success: Boolean,
    val teamData: TeamData?,
    val message: String?
)

data class ExtendedTeamDataResponse(
    val success: Boolean,
    val teamData: ExtendedTeamData?,
    val news: List<ClubNews>?,
    val season: String?,
    val seasonStartDate: String?,
    val matchday: Int,
    val renameTeamCost: Int
)

data class ClubNews(
    val date: String?,
    val title: String?,
    val text: String?
)

data class ClubNewsResponse(
    val success: Boolean,
    val news: List<ClubNews>
)

data class UserData(
    val name: String?,
    val score: Int,
    val created: String?,
    val lastActivity: String?,
    val facebookId: String?,
    val appleId: String?,
    val email: String?,
    val password: String?,
    val rank: String?
)

// ── Resources / Currency ────────────────────────────────────

data class ResourcesResponse(
    val success: Boolean,
    val money: Double,
    val medipacks: Double,
    val gtStars: Double,
    val message: String?
)

data class ValueResponse(
    val success: Boolean,
    val value: Double,
    val message: String?
)

data class TextResponse(
    val value: String?
)

// ── Squad / Players ─────────────────────────────────────────

data class SquadResponse(
    val success: Boolean,
    val players: List<SquadPlayerData>,
    val message: String?
)

data class SquadPlayerData(
    val id: UUID,
    val name: String?,
    val position: String?,
    val strength: Int,
    val fitness: Int
)

data class PlayerStatisticsResponse(
    val success: Boolean,
    val statistics: PlayerStatisticsData?
)

data class PlayerStatisticsData(
    val playerId: UUID,
    val matches: Int,
    val goals: Int,
    val yellowCards: Int,
    val redCards: Int
)

data class PlayerTextChangeRequest(
    val id: UUID,
    val value: String
)

data class PlayerShirtRequest(
    val id: UUID,
    val shirtNumber: Int
)

// ── Stadium ─────────────────────────────────────────────────

data class StadiumResponse(
    val success: Boolean,
    val stadium: StadiumData?,
    val message: String?
)

data class StadiumData(
    val name: String?,
    val grassQuality: Int,
    val capacity: Int,
    val earningsAverage: Int
)

data class BuildPlacesResponse(
    val success: Boolean,
    val places: List<BuildPlaceData>
)

data class BuildPlaceData(
    val id: UUID,
    val buildingType: String?,
    val level: Int,
    val canBuild: Boolean
)

// ── Training ────────────────────────────────────────────────

data class TeamTrainingResponse(
    val success: Boolean,
    val teamTraining: TeamTrainingData?,
    val message: String?
)

data class TeamTrainingData(
    val mainSkillIndex: Int,
    val subSkillIndex: Int,
    val efficiencyText: String?,
    val efficiencyValue: Int
)

data class TeamTrainingSaveRequest(
    val mainSkillIndex: Int,
    val subSkillIndex: Int
)

data class TacticTrainingSaveRequest(
    val tacticId: String?
)

data class TrainingCampRequest(
    val campType: String?
)

data class IndividualTrainingRequest(
    val id: UUID,
    val skillType: String?
)

// ── Lineup ──────────────────────────────────────────────────

data class LineupsResponse(
    val success: Boolean,
    val lineups: List<LineupSummaryData>
)

data class LineupSummaryData(
    val matchId: UUID,
    val opponent: String?,
    val isLocked: Boolean
)

data class LineupRequest(
    val matchId: UUID
)

data class MatchLineupResponse(
    val success: Boolean,
    val players: List<MatchLineupPlayerData>,
    val systems: List<String>,
    val tactics: List<String>,
    val isLocked: Boolean
)

data class MatchLineupPlayerData(
    val playerId: UUID,
    val name: String?,
    val position: String?,
    val isStarting: Boolean
)

data class SaveLineupRequest(
    val matchId: UUID,
    val playerIds: List<UUID>,
    val system: String?,
    val tactic: String?
)

// ── League ──────────────────────────────────────────────────

data class LeagueTableResponse(
    val success: Boolean,
    val teams: List<LeagueTableData>,
    val leagueName: String?,
    val mount: Int,
    val dismount: Int
)

data class LeagueTableData(
    val id: UUID,
    val name: String?,
    val strength: Double,
    val logo: String?,
    val country: String?,
    val isOnline: Boolean,
    val isMine: Boolean,
    val matches: LeagueTableValue,
    val wins: LeagueTableValue,
    val losses: LeagueTableValue,
    val draws: LeagueTableValue,
    val goalsScored: LeagueTableValue,
    val goalsReceived: LeagueTableValue,
    val points: LeagueTableValue
)

data class LeagueTableValue(
    val home: Int = 0,
    val away: Int = 0
)

// ── Ladder ──────────────────────────────────────────────────

data class LadderResponse(
    val success: Boolean,
    val teams: List<LadderTeamData>,
    val endDate: String?,
    val ladderId: UUID
)

data class LadderTeamData(
    val teamId: UUID,
    val teamName: String?,
    val teamLogo: String?,
    val points: Int,
    val rank: Int,
    val strength: Int,
    val isMine: Boolean
)

data class LadderChallengeRequest(
    val teamId: UUID
)

data class LadderChallengeResponse(
    val success: Boolean,
    val homeTeam: LadderTeamData?,
    val awayTeam: LadderTeamData?,
    val winPoints: Int,
    val losePoints: Int,
    val stamina: Int,
    val staminaCost: Int,
    val ladderDate: String?,
    val matchCost: Int
)

data class LadderMatchResponse(
    val success: Boolean,
    val matchReport: String?,
    val stamina: Int
)

// ── Live / Match ────────────────────────────────────────────

data class LiveMatchResponse(
    val success: Boolean,
    val match: LiveMatchData?,
    val message: String?
)

data class LiveMatchData(
    val matchId: UUID,
    val homeTeam: String?,
    val awayTeam: String?,
    val homeScore: Int,
    val awayScore: Int,
    val report: String?
)

// ── Transfer Market ─────────────────────────────────────────

data class TransferSearchRequest(
    val minimumBid: Int?,
    val strength: Int?,
    val onlyKeeper: Boolean?
)

data class TransferSearchResponse(
    val success: Boolean,
    val players: List<TransferPlayerData>
)

data class TransferPlayerData(
    val id: UUID,
    val name: String?,
    val position: String?,
    val strength: Int,
    val minimumBid: Int,
    val endDate: String?
)

data class TransferDetailsResponse(
    val success: Boolean,
    val player: TransferPlayerData?
)

data class BidRequest(
    val id: UUID,
    val bid: Int
)

// ── Scouting ────────────────────────────────────────────────

data class ScoutingPlayersResponse(
    val success: Boolean,
    val players: List<ScoutedPlayerData>
)

data class ScoutedPlayerData(
    val id: UUID,
    val name: String?,
    val position: String?,
    val talent: Int,
    val strength: Int
)

data class ScoutInstructionRequest(
    val scoutType: String?,
    val positionFilter: String?
)

// ── Friends ─────────────────────────────────────────────────

data class SearchRequest(
    val text: String?,
    val value: Int,
    val language: String?
)

data class FriendsResponse(
    val success: Boolean,
    val friends: List<FriendData>,
    val friendName: String?
)

data class FriendData(
    val id: UUID,
    val foreignUserId: UUID,
    val foreignTeamId: UUID,
    val name: String?,
    val isFriend: Boolean,
    val isRequestIncoming: Boolean,
    val isRequestOutgoing: Boolean,
    val isLiked: Boolean
)

data class ChallengesResponse(
    val success: Boolean,
    val challenges: List<ChallengeData>,
    val friends: List<FriendData>,
    val matchDate: String?,
    val endDate: String?
)

data class ChallengeData(
    val id: UUID,
    val foreignTeamId: UUID,
    val opponentName: String?,
    val accepted: Boolean,
    val matchDate: String?
)

data class ChallengeReplyRequest(
    val id: UUID,
    val accept: Boolean
)

// ── Chat ────────────────────────────────────────────────────

data class ChatHistoryResponse(
    val success: Boolean,
    val messages: List<ChatMessageData>
)

data class ChatMessageData(
    val id: UUID,
    val userId: UUID,
    val userName: String?,
    val message: String?,
    val createdAt: String?
)

data class ChatPostRequest(
    val message: String?
)

// ── Realtime ────────────────────────────────────────────────

data class ChatMessage(
    val id: UUID,
    val userId: UUID,
    val userName: String?,
    val text: String?,
    val createdAt: String?
)

data class JsonRealtimeBid(
    val auctionId: UUID,
    val teamId: UUID,
    val bid: Int,
    val createdAt: String?
)

// ── Shop ────────────────────────────────────────────────────

data class ShopProductsResponse(
    val success: Boolean,
    val products: List<ShopProductData>
)

data class ShopProductData(
    val id: UUID,
    val name: String?,
    val category: String?,
    val price: Int
)

data class ShopEquipmentResponse(
    val success: Boolean,
    val equipment: List<EquipmentData>
)

data class EquipmentData(
    val id: UUID,
    val name: String?,
    val costStars: Int
)

data class ShopPurchaseVerifyRequest(
    val platform: String?,
    val productIdentifier: String?,
    val purchaseToken: String?
)

// ── Sponsors ────────────────────────────────────────────────

data class SponsorOffersResponse(
    val success: Boolean,
    val offers: List<SponsorOfferData>
)

data class SponsorOfferData(
    val id: UUID,
    val name: String?,
    val description: String?,
    val money: Int,
    val stars: Int
)

// ── Finances ────────────────────────────────────────────────

data class FinancesResponse(
    val success: Boolean,
    val today: Int,
    val yesterday: Int,
    val todays: List<FinanceData>,
    val yesterdays: List<FinanceData>
)

data class FinanceData(
    val bookingType: String?,
    val value: Double,
    val description: String?,
    val isEarning: Boolean
)

data class FinanceHistoryResponse(
    val success: Boolean,
    val financeHistory: List<FinanceHistoryData>
)

data class FinanceHistoryData(
    val date: String,
    val income: Double,
    val outcome: Double,
    val balance: Double
)

// ── Mail ────────────────────────────────────────────────────

data class MailResponse(
    val success: Boolean,
    val mails: List<MailData>
)

data class MailData(
    val id: UUID,
    val date: String?,
    val subject: String?,
    val sender: String?,
    val message: String?,
    val extra: String?,
    val isNew: Boolean,
    val senderType: Int
)

// ── Accomplishments ─────────────────────────────────────────

data class AccomplishmentsResponse(
    val success: Boolean,
    val accomplishments: List<AccomplishmentData>
)

data class AccomplishmentData(
    val name: String?,
    val image: String?
)

// ── Countries ───────────────────────────────────────────────

data class CountriesResponse(
    val countries: List<CountryDto>
)

data class CountryDto(
    val id: Int,
    val name: String,
    val isoCode: String
)

// ── Tutorial ────────────────────────────────────────────────

data class TutorialRequest(
    val topicID: String?
)

data class TutorialResponse(
    val success: Boolean,
    val currentStep: TutorialStep?,
    val message: String?
)

data class TutorialStep(
    val topicID: String?,
    val title: String?,
    val message: String?,
    val characterID: String?,
    val controlID: String?,
    val nextTopicID: String?,
    val rewardMoney: Int,
    val rewardStars: Int,
    val canSkip: Boolean,
    val screen: String?,
    val submenu: String?
)

// ── User settings ───────────────────────────────────────────

data class PreferencesResponse(
    val success: Boolean,
    val notificationSettings: NotificationSettings?,
    val userData: UserData?
)

data class PreferencesRequest(
    val notificationSettings: NotificationSettings?
)

data class NotificationSettings(
    val auctionOverbid: Boolean,
    val matchResults: Boolean,
    val lineupIncomplete: Boolean,
    val friendInvite: Boolean,
    val ineffectiveTraining: Boolean,
    val friendlyMatch: Boolean,
    val system: Boolean,
    val auctionEnd: Boolean
)

data class UpdateUserRequest(
    val userData: UserData?
)

data class UpdateUserResponse(
    val success: Boolean,
    val emailReward: Double,
    val facebookReward: Double
)

data class EnableMatchPushRequest(
    val matchId: UUID
)

data class EnableMatchPushResponse(
    val success: Boolean,
    val matchId: UUID,
    val isEnabled: Boolean
)

data class HelpshiftUserResponse(
    val success: Boolean,
    val userId: UUID,
    val managerName: String?,
    val purchasesAmount: Int,
    val creationDate: String?,
    val purchasesLTV: Double,
    val clubName: String?,
    val leagueName: String?,
    val userLevel: Int
)

data class RenameRequest(
    val id: UUID,
    val name: String?
)
