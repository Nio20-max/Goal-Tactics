# Service Callsite Inventory (Phase 3)

Host target:
- API: `https://gt.nikolai-linschmann.de/api/*`
- Chat hub: `wss://gt.nikolai-linschmann.de/chat`
- Auction hub: `wss://gt.nikolai-linschmann.de/auc`

Sources used:
- `reverse_engineering/decompiled/GT.Core.actual/store0_idx17.decompiled.cs`
- `analysis/game_analysis/managed-assembly-findings.md`
- `src/GoalTactics.Api/Controllers/*.cs`

## Header and auth invariants
- Keep `x-goaltactics-version` on all authenticated API calls.
- Keep `x-goaltactics-capabilities` on all authenticated API calls.
- Remove legacy body signing (`ICrypterService.Sign`) from new-backend call paths.
- Persist JWT from `AuthResponse.Token`; send as bearer for protected routes and hub auth.

## Inventory
Format:
- `Method | Current class/file | Current route/base | Target route | DTO conversion | UI behavior change`

### Authentication
- `Login | AuthenticationManager (GT.Core) | /GameEngine/Login and /api/Login | /api/Login | Legacy JsonAuth -> AuthResponse | Keep login UI, replace token plumbing`
- `VerifyLogin | AuthenticationManager/AuthService | /api/VerifyLogin | /api/VerifyLogin | Minimal, typed | None`
- `Register | AuthenticationManager/AuthService | mixed legacy/new | /api/Register | Legacy register dto -> RegisterRequest | None`
- `GetCurrentAppVersion | AuthenticationManager | /GameEngine/GetCurrentAppVersion | /api/GetVersion | int/string payload normalization | None`
- `CheckPunishments | AuthenticationManager | /GameEngine/CheckPunishments | /api/Me + flags | Remove old envelope | Add local punished-state cache`

### Team and resources
- `GetTeamInfo | TeamManager/NewTeamService | /GameEngine/GetTeam or /api/GetTeamInfo | /api/GetTeamInfo | Legacy team dto -> TeamData | None`
- `GetMyTeamInfo | NewTeamService | /api/GetMyTeamInfo | /api/GetMyTeamInfo | typed | None`
- `GetMyTeamExtendedInfo | NewTeamService | /api/GetMyTeamExtendedInfo | /api/GetMyTeamExtendedInfo | typed | None`
- `GetClubNews | NewTeamService | /api/GetClubNews | /api/GetClubNews | typed | None`
- `GetMyResources | NewTeamService | /api/GetMyResources | /api/GetMyResources | typed | None`
- `GetMyMail | NewTeamService | /api/GetMyMail | /api/GetMyMail | typed | None`
- `MarkAsRead | NewTeamService | /api/MarkAsRead | /api/MarkAsRead | typed | None`
- `MarkAllAsRead | NewTeamService | /api/MarkAllAsRead | /api/MarkAllAsRead | typed | None`
- `DeleteMail | NewTeamService | /api/DeleteMail | /api/DeleteMail | typed | None`
- `DeleteAllRead | NewTeamService | /api/DeleteAllRead | /api/DeleteAllRead | typed | None`
- `GetAccomplishments | NewTeamService | /api/GetAccomplishments | /api/GetAccomplishments | typed | None`
- `GetFinanceHistory | NewTeamService | /api/GetFinanceHistory | /api/GetFinanceHistory | typed | None`
- `GetFinances | NewTeamService | /api/GetFinances | /api/GetFinances | typed | None`
- `ChangeTeamName | TeamManager/NewTeamService | /GameEngine/ChangeTeamName and /api/ChangeTeamName | /api/ChangeTeamName | Normalize rename request | None`

### League and live
- `GetLeagueTable | LeagueManager | /GameEngine/GetLeague* and /api/GetLeagueTable | /api/GetLeagueTable | Legacy table -> LeagueTableResponse | None`
- `GetGoalGetters | LeagueManager | /GameEngine/GetLeagueGoalGetter and /api/GetGoalGetters | /api/GetGoalGetters | Legacy list -> typed list | None`
- `GetMatches | LeagueManager | /GameEngine/GetLeagueMatches and /api/GetMatches | /api/GetMatches | Legacy fixture dto -> typed | None`
- `GetMatchDetails | LiveManager | /GameEngine/GetMatchDetails and /api/GetMatchDetails | /api/GetMatchDetails | Legacy report dto -> LiveMatchData | None`
- `GetLiveMatch | LiveManager | mixed | /api/GetLiveMatch | typed | None`
- `GetMatchReport | LiveManager | mixed | /api/GetMatchReport | typed | None`

### Lineup
- `GetLineups | LineupManager | /GameEngine/GetLineupStatus and /api/GetLineups | /api/GetLineups | Legacy lineup status -> LineupSummaryData | Keep lock indicator`
- `GetMatchLineup | LineupManager | /GameEngine/GetMatchFormation and /api/GetMatchLineup | /api/GetMatchLineup | Legacy model -> MatchLineupResponse | Preserve captain/bonus displays`
- `SaveLineup | LineupManager | /GameEngine/SetMatchFormation and /api/SaveLineup | /api/SaveLineup | DTO transform formation->SaveLineupRequest | Show lock error state`

### Squad and player actions
- `GetSquad | SquadManager | /GameEngine/GetPlayers/GetTeamPlayers and /api/GetSquad | /api/GetSquad | Merge legacy dual endpoints into one | None`
- `GetPlayerStatistics | SquadManager | /GameEngine/GetPlayerStatistics and /api/GetPlayerStatistics | /api/GetPlayerStatistics | typed | None`
- `ChangePlayerName | PlayerManager/SquadManager | /GameEngine/ChangePlayerName* and /api/ChangePlayerName | /api/ChangePlayerName | Legacy stars variants removed | Keep rename validation`
- `ChangePlayerOrigin | PlayerManager/SquadManager | /GameEngine/ChangePlayerOriginStars and /api/ChangePlayerOrigin | /api/ChangePlayerOrigin | Remove stars-specific variant | None`
- `ChangePlayerShirt | PlayerManager/SquadManager | /GameEngine/ChangePlayerShirtNr* and /api/ChangePlayerShirt | /api/ChangePlayerShirt | Remove stars-specific variant | None`
- `SellPlayer | SquadManager | /GameEngine/SellPlayer/SellPlayerToBank and /api/SellPlayer | /api/SellPlayer | typed | Keep confirmation dialog`
- `FirePlayer | SquadManager | /GameEngine/FirePlayer and /api/FirePlayer | /api/FirePlayer | typed | None`
- `ExtendPlayerContract | SquadManager | /GameEngine/ExtendPlayerContract and /api/ExtendPlayerContract | /api/ExtendPlayerContract | typed | None`
- `GetPlayerContractCost | SquadManager | /GameEngine/GetPlayerContractCost | /api/GetPlayerStatistics + cost endpoint when added | temporary adapter | Show fallback text if unavailable`
- `UpgradePlayer | SquadManager | /GameEngine/UpgradePlayer2 and /api/UpgradePlayer | /api/UpgradePlayer | typed | None`
- `UseSkillCard | SquadManager | /GameEngine/UseSkillCard and /api/UseSkillCard | /api/UseSkillCard | typed | None`
- `HealPlayer | SquadManager | /GameEngine/HealPlayer and /api/HealPlayer | /api/HealPlayer | typed | None`

### Training and camps
- `GetTraining | TrainingManager | /GameEngine/GetTraining and /api/GetTeamTraining | /api/GetTeamTraining | Legacy training payload -> TeamTrainingData | None`
- `SaveTeamTraining | TrainingManager | /GameEngine/SaveTeamTraining and /api/SaveTeamTraining | /api/SaveTeamTraining | typed | None`
- `SaveTacticTraining | TrainingManager | /GameEngine/SaveTraining and /api/SaveTacticTraining | /api/SaveTacticTraining | typed | None`
- `BookCamp | TrainingManager | /GameEngine/BookCamp/SaveTrainingCamp and /api/BookTrainingCamp | /api/BookTrainingCamp | normalize camp type | None`
- `SaveIndividualTraining | TrainingManager | /GameEngine/SaveIndividualPlayerTraining and /api/SaveIndividualTraining | /api/SaveIndividualTraining | typed | None`
- `RenewIndividualTraining | TrainingManager | /GameEngine/RenewIndividualPlayerTraining and /api/RenewIndividualTraining | /api/RenewIndividualTraining | typed | None`
- `RenewAllIndividualTraining | TrainingManager | /GameEngine/RenewAllIndividualPlayerTraining and /api/RenewAllIndividualTraining | /api/RenewAllIndividualTraining | typed | None`

### Scouting
- `GetPlayers | ScoutingManager | /GameEngine/GetYouthPlayer and /api/GetScoutedPlayers | /api/GetScoutedPlayers | Legacy youth dto -> ScoutedPlayerData | None`
- `Instruct | ScoutingManager | /GameEngine/Find scout routes and /api/InstructScout | /api/InstructScout | typed | None`
- `Recruit | ScoutingManager | mixed | /api/RecruitScoutedPlayer | typed | None`
- `Speedup | ScoutingManager | /GameEngine/SpeedUpSpecialScout and /api/SpeedupScout | /api/SpeedupScout | typed | None`

### Stadium and sponsors
- `GetStadium | StadiumManager | /GameEngine/GetStadium2 and /api/GetStadium | /api/GetStadium | Legacy stadium dto -> StadiumData | None`
- `GetBuildPlaces | StadiumManager | /GameEngine/BuyStadiumBuilding* preflight and /api/GetBuildPlaces | /api/GetBuildPlaces | typed | None`
- `Build | StadiumManager | /GameEngine/BuyStadiumBuilding2/3 and /api/BuildStadium | /api/BuildStadium | normalize place id | None`
- `Speedup | StadiumManager | /GameEngine/SpeedUpStadiumBuilding2 and /api/SpeedupBuilding | /api/SpeedupBuilding | typed | None`
- `RenewGrass | StadiumManager | /GameEngine/RenewStadiumGrass and /api/RenewStadiumGrass | /api/RenewStadiumGrass | typed | None`
- `RenameStadium | StadiumManager | /GameEngine/ChangeStadiumName and /api/RenameStadium | /api/RenameStadium | typed | None`
- `GetSponsors | SponsorManager | /GameEngine/GetSponsorOffer and /api/GetSponsorOffers | /api/GetSponsorOffers | legacy sponsor dto -> SponsorOfferData | None`
- `Accept | SponsorManager | /GameEngine/AcceptSponsorOffer and /api/AcceptSponsor | /api/AcceptSponsor | typed | None`
- `Negotiate | SponsorManager | /GameEngine/CreateNewSponsorOffer and /api/NegotiateSponsor | /api/NegotiateSponsor | typed | None`

### Transfer market
- `SearchTransfermarket | TransfermarketManager | /GameEngine/SearchTransfermarket and /api/SearchTransfermarket | /api/SearchTransfermarket or /api/Search (preferred) | Legacy search dto -> TransferSearchRequest | None`
- `GetTransferDetails | TransfermarketManager | /GameEngine/GetTransfermarketBids and /api/GetTransferDetails | /api/GetTransferDetails | typed | None`
- `BidPlayer | TransfermarketManager | /GameEngine/BidPlayer and /api/BidPlayer | /api/BidPlayer | typed | None`
- `GetTransfermarketFavourites | TransfermarketManager | /GameEngine/GetTransfermarketFavourites and /api/GetTransfermarketFavourites | /api/GetTransfermarketFavourites | typed | None`
- `UpdateTransfermarketFavourites | TransfermarketManager | /GameEngine/UpdateTransfermarketFavourites and /api/UpdateTransfermarketFavourites | /api/UpdateTransfermarketFavourites | typed | None`

### Friends, chat, realtime
- `GetFriends | FriendsManager | legacy mixed | /api/GetFriends | typed | None`
- `GetChallenges | FriendsManager | legacy mixed | /api/GetChallenges | typed | None`
- `ReplyChallenge | FriendsManager | legacy mixed | /api/ReplyChallenge | typed | None`
- `SendChallenge | FriendsManager | legacy mixed | /api/SendChallenge | typed | None`
- `Like | FriendsManager | legacy mixed | /api/Like | typed | None`
- `Unlike | FriendsManager | legacy mixed | /api/Unlike | typed | None`
- `Accept | FriendsManager | legacy mixed | /api/Accept | typed | None`
- `Decline | FriendsManager | legacy mixed | /api/Decline | typed | None`
- `GetChatHistory | ChatService | /api/GetChatHistory | /api/GetChatHistory | typed | Reload on reconnect`
- `Post | ChatService | /api/Post and /api/PostChatMessage | /api/Post | typed | None`
- `Typing | ChatService | /api/Typing | /api/Typing | typed | None`
- `Auction hub connect | TransfermarketBidService | old new-backend url + /auc | wss://gt.nikolai-linschmann.de/auc | none | Add reconnect stale indicator`
- `Chat hub connect | ChatViewModel | old new-backend url + /chat | wss://gt.nikolai-linschmann.de/chat | none | Add reconnect stale indicator`

### Shop, rewards, preferences, support
- `GetProducts | ShopManager | legacy/new mixed | /api/GetProducts | typed | None`
- `GetEquipment | ShopManager | legacy/new mixed | /api/GetEquipment | typed | None`
- `BuyProduct | ShopManager | legacy/new mixed | /api/BuyProduct | typed | None`
- `UseEquipment | ShopManager | legacy/new mixed | /api/UseEquipment | typed | None`
- `VerifyPurchase | ShopManager | /GameEngine/VerifyPurchase and /api/VerifyPurchase | /api/VerifyPurchase | typed | None`
- `ClaimDailyReward | UserManager | mixed | /api/ClaimDailyReward | typed | None`
- `GetPreferences | UserManager | mixed | /api/GetPreferences | typed | None`
- `SavePreferences | UserManager | mixed | /api/SavePreferences | typed | None`
- `UpdateUser | UserManager | mixed | /api/UpdateUser | typed | None`
- `DeleteAccount | UserManager | mixed | /api/DeleteAccount | typed | Logout and clear hubs`
- `GetHelpshiftUserInfo | UserManager | mixed | /api/GetHelpshiftUserInfo | typed | None`

## Required source-level patch targets
- `GT.Core.URLHelper`: set `NewBackendUrl = "https://gt.nikolai-linschmann.de"` and remove legacy base usage in active paths.
- `GT.Core.BaseService<T>`: use only `NewBackendUrl + "api/"` in active service registrations.
- `GT.Core.AuthenticationManager`: remove legacy-sign envelope behavior for migrated services.
- `ChatViewModel` and `TransfermarketBidService`: force `/chat` and `/auc` hubs on new host.

## Acceptance condition for this inventory
- No active callsite points at `/GameEngine/*`.
- All active service methods map to `/api/*`, `/chat`, or `/auc` with typed DTOs.
