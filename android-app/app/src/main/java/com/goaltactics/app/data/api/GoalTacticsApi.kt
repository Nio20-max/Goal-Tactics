package com.goaltactics.app.data.api

import com.goaltactics.app.data.model.*
import retrofit2.Response
import retrofit2.http.Body
import retrofit2.http.GET
import retrofit2.http.POST
import java.util.UUID

/**
 * Retrofit service matching the Goal Tactics backend API surface exactly.
 * All POST endpoints use JSON request/response bodies.
 * Auth-required endpoints have the JWT token injected via AuthInterceptor.
 */
interface GoalTacticsApi {

    // ── Auth (no auth required for register/login/verify) ───

    @POST("Register")
    suspend fun register(@Body request: RegisterRequest): Response<RegisterResponse>

    @POST("Login")
    suspend fun login(@Body request: AuthRequest): Response<AuthResponse>

    @POST("VerifyLogin")
    suspend fun verifyLogin(@Body request: TextRequest): Response<AuthResponse>

    @GET("Me")
    suspend fun me(): Response<AuthResponse>

    @POST("Logout")
    suspend fun logout(): Response<ResponseObject>

    // ── Common ──────────────────────────────────────────────

    @GET("Ping")
    suspend fun ping(): Response<ResponseObject>

    @GET("GetVersion")
    suspend fun getVersion(): Response<String>

    @POST("GetCountries")
    suspend fun getCountries(@Body request: RequestObject = RequestObject()): Response<CountriesResponse>

    @POST("GetSeasonInfo")
    suspend fun getSeasonInfo(@Body request: RequestObject = RequestObject()): Response<TextResponse>

    // ── Team / Club ─────────────────────────────────────────

    @POST("GetTeamInfo")
    suspend fun getTeamInfo(@Body request: IdRequest): Response<TeamDataResponse>

    @POST("GetMyTeamInfo")
    suspend fun getMyTeamInfo(@Body request: RequestObject = RequestObject()): Response<TeamDataResponse>

    @POST("GetMyTeamExtendedInfo")
    suspend fun getMyTeamExtendedInfo(@Body request: RequestObject = RequestObject()): Response<ExtendedTeamDataResponse>

    @POST("GetClubNews")
    suspend fun getClubNews(@Body request: IdRequest): Response<ClubNewsResponse>

    @POST("GetMyResources")
    suspend fun getMyResources(@Body request: RequestObject = RequestObject()): Response<ResourcesResponse>

    @POST("GetMyMail")
    suspend fun getMyMail(@Body request: RequestObject = RequestObject()): Response<MailResponse>

    @POST("MarkAsRead")
    suspend fun markAsRead(@Body request: IdRequest): Response<ResponseObject>

    @POST("MarkAllAsRead")
    suspend fun markAllAsRead(@Body request: RequestObject = RequestObject()): Response<ResponseObject>

    @POST("DeleteMail")
    suspend fun deleteMail(@Body request: IdRequest): Response<ResponseObject>

    @POST("DeleteAllRead")
    suspend fun deleteAllRead(@Body request: RequestObject = RequestObject()): Response<ResponseObject>

    @POST("GetAccomplishments")
    suspend fun getAccomplishments(@Body request: RequestObject = RequestObject()): Response<AccomplishmentsResponse>

    @POST("GetFinanceHistory")
    suspend fun getFinanceHistory(@Body request: RequestObject = RequestObject()): Response<FinanceHistoryResponse>

    @POST("GetFinances")
    suspend fun getFinances(@Body request: RequestObject = RequestObject()): Response<FinancesResponse>

    @POST("ChangeTeamName")
    suspend fun changeTeamName(@Body request: RenameRequest): Response<ResponseObject>

    // ── Squad ───────────────────────────────────────────────

    @POST("GetSquad")
    suspend fun getSquad(@Body request: RequestObject = RequestObject()): Response<SquadResponse>

    @POST("GetPlayerStatistics")
    suspend fun getPlayerStatistics(@Body request: IdRequest): Response<PlayerStatisticsResponse>

    @POST("ChangePlayerName")
    suspend fun changePlayerName(@Body request: PlayerTextChangeRequest): Response<ResponseObject>

    @POST("ChangePlayerOrigin")
    suspend fun changePlayerOrigin(@Body request: PlayerTextChangeRequest): Response<ResponseObject>

    @POST("ChangePlayerShirt")
    suspend fun changePlayerShirt(@Body request: PlayerShirtRequest): Response<ResponseObject>

    @POST("SellPlayer")
    suspend fun sellPlayer(@Body request: IdRequest): Response<ResponseObject>

    @POST("FirePlayer")
    suspend fun firePlayer(@Body request: IdRequest): Response<ResponseObject>

    @POST("ExtendPlayerContract")
    suspend fun extendPlayerContract(@Body request: IdRequest): Response<ResponseObject>

    @POST("UpgradePlayer")
    suspend fun upgradePlayer(@Body request: IdRequest): Response<ResponseObject>

    @POST("UseSkillCard")
    suspend fun useSkillCard(@Body request: IdRequest): Response<ResponseObject>

    @POST("HealPlayer")
    suspend fun healPlayer(@Body request: IdRequest): Response<ResponseObject>

    // ── Stadium ─────────────────────────────────────────────

    @POST("GetStadium")
    suspend fun getStadium(@Body request: RequestObject = RequestObject()): Response<StadiumResponse>

    @POST("GetBuildPlaces")
    suspend fun getBuildPlaces(@Body request: RequestObject = RequestObject()): Response<BuildPlacesResponse>

    @POST("BuildStadium")
    suspend fun buildStadium(@Body request: IdRequest): Response<ResponseObject>

    @POST("SpeedupBuilding")
    suspend fun speedupBuilding(@Body request: IdRequest): Response<ResponseObject>

    @POST("RenewStadiumGrass")
    suspend fun renewStadiumGrass(@Body request: RequestObject = RequestObject()): Response<ResponseObject>

    @POST("RenameStadium")
    suspend fun renameStadium(@Body request: TextRequest): Response<ResponseObject>

    // ── Training ────────────────────────────────────────────

    @POST("GetTeamTraining")
    suspend fun getTeamTraining(@Body request: RequestObject = RequestObject()): Response<TeamTrainingResponse>

    @POST("SaveTeamTraining")
    suspend fun saveTeamTraining(@Body request: TeamTrainingSaveRequest): Response<ResponseObject>

    @POST("SaveTacticTraining")
    suspend fun saveTacticTraining(@Body request: TacticTrainingSaveRequest): Response<ResponseObject>

    @POST("BookTrainingCamp")
    suspend fun bookTrainingCamp(@Body request: TrainingCampRequest): Response<ResponseObject>

    @POST("SaveIndividualTraining")
    suspend fun saveIndividualTraining(@Body request: IndividualTrainingRequest): Response<ResponseObject>

    @POST("RenewIndividualTraining")
    suspend fun renewIndividualTraining(@Body request: IdRequest): Response<ResponseObject>

    @POST("RenewAllIndividualTraining")
    suspend fun renewAllIndividualTraining(@Body request: RequestObject = RequestObject()): Response<ResponseObject>

    // ── Lineup ──────────────────────────────────────────────

    @POST("GetLineups")
    suspend fun getLineups(@Body request: RequestObject = RequestObject()): Response<LineupsResponse>

    @POST("GetMatchLineup")
    suspend fun getMatchLineup(@Body request: LineupRequest): Response<MatchLineupResponse>

    @POST("SaveLineup")
    suspend fun saveLineup(@Body request: SaveLineupRequest): Response<ResponseObject>

    // ── League ──────────────────────────────────────────────

    @POST("GetLeagueTable")
    suspend fun getLeagueTable(@Body request: IdRequest): Response<LeagueTableResponse>

    // ── Ladder ──────────────────────────────────────────────

    @POST("GetLadder")
    suspend fun getLadder(@Body request: IdRequest): Response<LadderResponse>

    @POST("GetLadderChallenge")
    suspend fun getLadderChallenge(@Body request: LadderChallengeRequest): Response<LadderChallengeResponse>

    @POST("RestoreStamina")
    suspend fun restoreStamina(@Body request: RequestObject = RequestObject()): Response<TextResponse>

    @POST("RunMatch")
    suspend fun runMatch(@Body request: LadderChallengeRequest): Response<LadderMatchResponse>

    // ── Live / Match ────────────────────────────────────────

    @POST("GetLiveMatch")
    suspend fun getLiveMatch(@Body request: IdRequest): Response<LiveMatchResponse>

    @POST("GetMatchReport")
    suspend fun getMatchReport(@Body request: IdRequest): Response<LiveMatchResponse>

    @POST("GetMatchDetails")
    suspend fun getMatchDetails(@Body request: IdRequest): Response<LiveMatchResponse>

    // ── Scouting ────────────────────────────────────────────

    @POST("GetScoutedPlayers")
    suspend fun getScoutedPlayers(@Body request: RequestObject = RequestObject()): Response<ScoutingPlayersResponse>

    @POST("InstructScout")
    suspend fun instructScout(@Body request: ScoutInstructionRequest): Response<ResponseObject>

    @POST("RecruitScoutedPlayer")
    suspend fun recruitScoutedPlayer(@Body request: IdRequest): Response<ResponseObject>

    @POST("SpeedupScout")
    suspend fun speedupScout(@Body request: IdRequest): Response<ResponseObject>

    // ── Transfer Market ─────────────────────────────────────

    @POST("SearchTransfermarket")
    suspend fun searchTransfermarket(@Body request: TransferSearchRequest): Response<TransferSearchResponse>

    @POST("GetTransferDetails")
    suspend fun getTransferDetails(@Body request: IdRequest): Response<TransferDetailsResponse>

    @POST("BidPlayer")
    suspend fun bidPlayer(@Body request: BidRequest): Response<ResponseObject>

    @POST("UpdateTransfermarketFavourites")
    suspend fun updateTransfermarketFavourites(@Body request: IdRequest): Response<ResponseObject>

    @POST("GetTransfermarketFavourites")
    suspend fun getTransfermarketFavourites(@Body request: RequestObject = RequestObject()): Response<TransferSearchResponse>

    // ── Shop ────────────────────────────────────────────────

    @POST("GetProducts")
    suspend fun getProducts(@Body request: RequestObject = RequestObject()): Response<ShopProductsResponse>

    @POST("GetEquipment")
    suspend fun getEquipment(@Body request: RequestObject = RequestObject()): Response<ShopEquipmentResponse>

    @POST("VerifyPurchase")
    suspend fun verifyPurchase(@Body request: ShopPurchaseVerifyRequest): Response<ResponseObject>

    @POST("BuyProduct")
    suspend fun buyProduct(@Body request: IdRequest): Response<ResponseObject>

    @POST("UseEquipment")
    suspend fun useEquipment(@Body request: IdRequest): Response<ResponseObject>

    // ── Sponsors ────────────────────────────────────────────

    @POST("GetSponsorOffers")
    suspend fun getSponsorOffers(@Body request: RequestObject = RequestObject()): Response<SponsorOffersResponse>

    @POST("NegotiateSponsor")
    suspend fun negotiateSponsor(@Body request: IdRequest): Response<ResponseObject>

    @POST("AcceptSponsor")
    suspend fun acceptSponsor(@Body request: IdRequest): Response<ResponseObject>

    // ── Friends ─────────────────────────────────────────────

    @POST("GetFriends")
    suspend fun getFriends(@Body request: SearchRequest): Response<FriendsResponse>

    @POST("GetChallenges")
    suspend fun getChallenges(@Body request: RequestObject = RequestObject()): Response<ChallengesResponse>

    @POST("ReplyChallenge")
    suspend fun replyChallenge(@Body request: ChallengeReplyRequest): Response<ChallengesResponse>

    @POST("SendChallenge")
    suspend fun sendChallenge(@Body request: IdRequest): Response<ChallengesResponse>

    @POST("Like")
    suspend fun like(@Body request: IdRequest): Response<ResponseObject>

    @POST("Unlike")
    suspend fun unlike(@Body request: IdRequest): Response<ResponseObject>

    @POST("Accept")
    suspend fun acceptFriend(@Body request: IdRequest): Response<FriendsResponse>

    @POST("Decline")
    suspend fun declineFriend(@Body request: IdRequest): Response<FriendsResponse>

    // ── Chat ────────────────────────────────────────────────

    @POST("GetChatHistory")
    suspend fun getChatHistory(@Body request: RequestObject = RequestObject()): Response<ChatHistoryResponse>

    @POST("PostChatMessage")
    suspend fun postChatMessage(@Body request: ChatPostRequest): Response<ResponseObject>

    @POST("Post")
    suspend fun post(@Body request: ChatPostRequest): Response<ResponseObject>

    @POST("Typing")
    suspend fun typing(@Body request: RequestObject = RequestObject()): Response<ResponseObject>

    // ── Tutorial ────────────────────────────────────────────

    @POST("GetTutorial")
    suspend fun getTutorial(@Body request: RequestObject = RequestObject()): Response<TutorialResponse>

    @POST("SkipTutorial")
    suspend fun skipTutorial(@Body request: RequestObject = RequestObject()): Response<TutorialResponse>

    @POST("FinishTutorialStep")
    suspend fun finishTutorialStep(@Body request: RequestObject = RequestObject()): Response<TutorialResponse>

    @POST("ResetTutorial")
    suspend fun resetTutorial(@Body request: TutorialRequest): Response<TutorialResponse>

    // ── User ────────────────────────────────────────────────

    @POST("ClaimDailyReward")
    suspend fun claimDailyReward(@Body request: RequestObject = RequestObject()): Response<ValueResponse>

    @POST("GetHelpshiftUserInfo")
    suspend fun getHelpshiftUserInfo(@Body request: RequestObject = RequestObject()): Response<HelpshiftUserResponse>

    @POST("GetPreferences")
    suspend fun getPreferences(@Body request: RequestObject = RequestObject()): Response<PreferencesResponse>

    @POST("SavePreferences")
    suspend fun savePreferences(@Body request: PreferencesRequest): Response<ResponseObject>

    @POST("UpdateUser")
    suspend fun updateUser(@Body request: UpdateUserRequest): Response<UpdateUserResponse>

    @POST("DeleteAccount")
    suspend fun deleteAccount(@Body request: RequestObject = RequestObject()): Response<ResponseObject>

    @POST("EnableMatchPush")
    suspend fun enableMatchPush(@Body request: EnableMatchPushRequest): Response<EnableMatchPushResponse>
}
