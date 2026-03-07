# Legacy To New API Mapping (Phase 3 Final)

Target host:
- API: `https://gt.nikolai-linschmann.de/api/*`
- Chat: `wss://gt.nikolai-linschmann.de/chat`
- Auction: `wss://gt.nikolai-linschmann.de/auc`

Legacy host to remove:
- `https://engine.goaltactics.de/GameEngine/*`

## Core migration rules
- Active call paths may only use `/api/*`, `/chat`, `/auc`.
- Keep `x-goaltactics-version` and `x-goaltactics-capabilities` on authenticated API calls.
- Remove legacy signed-request envelope logic from migrated service code.
- Persist and reuse JWT returned from `/api/Login` and `/api/VerifyLogin`.

## Mapping by subsystem

### Authentication
- `/GameEngine/Login` -> `/api/Login`
- legacy verify/login bootstrap -> `/api/VerifyLogin`
- legacy register -> `/api/Register`
- `/GameEngine/GetCurrentAppVersion` -> `/api/GetVersion`

### Team and club state
- `/GameEngine/GetTeam` -> `/api/GetTeamInfo` and `/api/GetMyTeamInfo`
- legacy team detail aggregates -> `/api/GetMyTeamExtendedInfo`
- legacy news/resources/mail routes -> `/api/GetClubNews`, `/api/GetMyResources`, `/api/GetMyMail`
- legacy mail actions -> `/api/MarkAsRead`, `/api/MarkAllAsRead`, `/api/DeleteMail`, `/api/DeleteAllRead`
- legacy finance/accomplishment routes -> `/api/GetAccomplishments`, `/api/GetFinanceHistory`, `/api/GetFinances`
- `/GameEngine/ChangeTeamName` -> `/api/ChangeTeamName`

### League, lineup, and live
- `/GameEngine/GetLeague*` -> `/api/GetLeagueTable`, `/api/GetMatches`, `/api/GetGoalGetters`
- `/GameEngine/GetMatchDetails` -> `/api/GetMatchDetails` (and `/api/GetMatchReport` where needed)
- `/GameEngine/GetMatchFormation` + `/GameEngine/GetLineupStatus` -> `/api/GetLineups`, `/api/GetMatchLineup`
- `/GameEngine/SetMatchFormation` -> `/api/SaveLineup`

### Squad and player actions
- legacy player endpoints -> `/api/GetSquad`, `/api/GetPlayerStatistics`
- rename/origin/shirt routes -> `/api/ChangePlayerName`, `/api/ChangePlayerOrigin`, `/api/ChangePlayerShirt`
- contract/upgrade/skill/heal routes -> `/api/ExtendPlayerContract`, `/api/UpgradePlayer`, `/api/UseSkillCard`, `/api/HealPlayer`
- sell/fire routes -> `/api/SellPlayer`, `/api/FirePlayer`

### Training and scouting
- `/GameEngine/GetTraining` -> `/api/GetTeamTraining`
- `/GameEngine/SaveTeamTraining` -> `/api/SaveTeamTraining`
- `/GameEngine/SaveTraining` -> `/api/SaveTacticTraining`
- camp routes -> `/api/BookTrainingCamp`
- individual training routes -> `/api/SaveIndividualTraining`, `/api/RenewIndividualTraining`, `/api/RenewAllIndividualTraining`
- youth/scout routes -> `/api/GetScoutedPlayers`, `/api/InstructScout`, `/api/RecruitScoutedPlayer`, `/api/SpeedupScout`

### Stadium and sponsors
- `/GameEngine/GetStadium2` -> `/api/GetStadium`
- build flow routes -> `/api/GetBuildPlaces`, `/api/BuildStadium`, `/api/SpeedupBuilding`
- grass/rename -> `/api/RenewStadiumGrass`, `/api/RenameStadium`
- sponsor routes -> `/api/GetSponsorOffers`, `/api/AcceptSponsor`, `/api/NegotiateSponsor`

### Transfer market
- `/GameEngine/SearchTransfermarket` -> `/api/SearchTransfermarket` (or `/api/Search` for new-query flow)
- `/GameEngine/BidPlayer` -> `/api/BidPlayer`
- favorites routes -> `/api/GetTransfermarketFavourites`, `/api/UpdateTransfermarketFavourites`
- details route -> `/api/GetTransferDetails`

### Friends, chat, and realtime
- friend/challenge routes -> `/api/GetFriends`, `/api/GetChallenges`, `/api/ReplyChallenge`, `/api/SendChallenge`, `/api/Like`, `/api/Unlike`, `/api/Accept`, `/api/Decline`
- chat REST routes -> `/api/GetChatHistory`, `/api/Post`, `/api/Typing`
- old chat/auction realtime host -> `wss://gt.nikolai-linschmann.de/chat` and `wss://gt.nikolai-linschmann.de/auc`

### Shop, rewards, and user settings
- product/equipment/purchase routes -> `/api/GetProducts`, `/api/GetEquipment`, `/api/BuyProduct`, `/api/UseEquipment`, `/api/VerifyPurchase`
- user routes -> `/api/ClaimDailyReward`, `/api/GetPreferences`, `/api/SavePreferences`, `/api/UpdateUser`, `/api/DeleteAccount`, `/api/GetHelpshiftUserInfo`, `/api/EnableMatchPush`

## Completion criteria
- No active references to `/GameEngine/*` in client runtime services.
- All hubs use `/chat` and `/auc` on `gt.nikolai-linschmann.de`.
- No legacy request-signing requirement on migrated calls.
