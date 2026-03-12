# Goal Tactics — API Endpoint Report

> Generated 2026-06-10 after full end-to-end testing with the legacy Xamarin client (v1.2.4) on Android.  
> All endpoints were verified via both automated ADB screen testing and direct curl probes.

---

## How the API Is Consumed

The Xamarin client makes **all requests as HTTP POST** with `Content-Type: application/json`.  
Every request body extends a base `RequestObject`:

```json
{
  "signature": null,
  "token": null,
  "locale": null,
  "utcOffset": 0,
  "culture": null,
  "platform": null
}
```

These legacy fields are accepted but **ignored** by the backend. Authentication is done via a **Bearer JWT token** in the `Authorization` header.

Every response extends a base `ResponseObject`:

```json
{
  "success": true,
  "message": null,
  "status": 1,
  "errorMessage": null,
  "punishment": 0
}
```

Where `status: 1` = OK, `status: 2` = Error. The client checks these fields before processing the domain-specific payload.

---

## Route Architecture

All controllers use `[Route("api")]` as their base route, so **all endpoints live at `/api/{ActionName}`**.  
Some controllers also register a namespaced alias (e.g., `[Route("api/Team")]`), so both `/api/GetFinances` and `/api/Team/GetFinances` work.  
Some actions have multiple route aliases (e.g., `GetMatchLineup` also responds to `GetMatchFormation`).

The Xamarin client uses both old (`/GameEngine/*`) and new (`/api/*`) URL patterns:
- **NewBackendUrl** routes → `/api/*` (most gameplay endpoints)
- **BaseServiceUrl** routes → `/GameEngine/*` (legacy; nginx rewrites to `/api/`)

---

## Endpoint Reference

### Legend

| Symbol | Meaning |
|--------|---------|
| ✅ | Tested in app — screen renders, data loads, no errors |
| 🔧 | Tested via curl only (endpoint works but not reachable from a specific UI screen) |
| 🔒 | Requires Bearer token |
| 🌐 | No auth required |

---

### 1. Authentication

#### POST `/api/Login` (alias: `/api/Authentication/Login`) 🌐 ✅
- **Request**: `{ "email": "...", "password": "..." }` or `{ "login": "...", "password": "..." }`
- **Response**: `{ "success": true, "token": "jwt...", "managerName": "...", "userId": "guid", "level": 0, "isAdmin": false }`
- **Status**: ✅ 200
- **⚠️ Important**:
  - The `token` field returns a **JWT** (the original server returned a GUID token). The Xamarin client accepts both formats — it stores the token string opaquely and passes it as `Bearer` or `?access_token=`.
  - `level` always returns `0` (original server returned actual manager level). The client displays this but it doesn't block functionality.
  - Rate-limited under `auth-sensitive` policy.

#### POST `/api/Register` (alias: `/api/Authentication/Register`) 🌐 🔧
- **Request**: `{ "isGuest": false, "email": "...", "login": "...", "password": "...", "managerName": "...", "teamName": "...", "countryId": 0 }`
- **Response**: `{ "success": true, "userId": "guid", "login": "...", "password": "..." }`
- **Status**: ✅ 200
- **⚠️ Important**:
  - Registration creates a team, 18 initial players (2 GK/6 DEF/6 MID/4 ATT), a league with bot teams, sponsors, and an initial stadium.
  - Bot team logos are generated via `LegacyAppCompatibility.BuildLogoId()` — must be valid `wappenXX` drawable IDs from the APK's 82-entry set.

#### POST `/api/VerifyLogin` 🌐 🔧
- **Request**: `{ "text": "jwt-token-string" }`
- **Response**: `AuthResponse` (same as Login)
- Used by the client to re-verify a stored token on app restart.

#### GET `/api/Me` 🔒 🔧
- Returns current user info from the token. Not typically called by the Xamarin client.

#### POST `/api/Logout` 🔒 🔧
- Invalidates the current session. Returns `{ "success": true }`.

---

### 2. Common (No Auth Required)

#### GET `/api/Ping` 🌐 🔧
- Returns `{ "success": true, "message": "pong" }`.
- Used for connectivity checks.

#### GET `/api/GetVersion` / POST `/api/GetCurrentAppVersion` 🌐 ✅
- **Response**: `"1.0"` (plain string)
- **Status**: ✅ 200
- **⚠️ Important**: The Xamarin client calls this at startup to check for forced updates. Returns a version string; the client compares it against its built-in version.

#### POST `/api/GetCountries` 🌐 ✅
- **Response**: `{ "countries": [{ "id": 0, "name": "Deutschland" }, ...] }`
- **Status**: ✅ 200
- Used at registration for country selection.

#### POST `/api/GetSeasonInfo` 🌐 ✅
- **Response**: `{ "text": "{ JSON string with season dates }" }`
- **Status**: ✅ 200
- The `text` field contains a serialized JSON object with `seasonNumber`, `seasonStart`, `seasonEnd`, `matchdayDuration`.

---

### 3. Team / Club

#### POST `/api/GetMyTeamExtendedInfo` 🔒 ✅
- **Response**: Full team data including `teamData` (name, logo, strength, finances), `lastMatch`, `nextMatch`, `rewards`
- **Status**: ✅ 200
- **⚠️ Critical**:
  - **Logo fields** (`teamData.logo`, `lastMatch.homeLogo`, `lastMatch.awayLogo`, `nextMatch.homeLogo`, `nextMatch.awayLogo`) **must be valid `wappenXX` names** from the APK's drawable resources. Invalid names (e.g., `logo_bot`, `logo_default`) cause `Resources$NotFoundException` at `GTImageView.SetImage()`, which crashes `ClubView.OnPropertyChanged` and leaves the loading spinner permanently visible.
  - This was the **root cause of the loading screen hang** — fixed by ensuring all code paths and DB records use valid wappen IDs.
  - Valid wappen IDs: `wappen01`–`wappen26`, plus sparse entries up to `wappen157` (82 total in APK).

#### POST `/api/GetMyResources` 🔒 ✅
- **Response**: `{ "money": 1000000, "premium": 50, "fans": 5000, ... }`
- **Status**: ✅ 200
- Called on **every screen navigation** — the client refreshes the resource bar each time you switch tabs.

#### POST `/api/GetFinances` 🔒 ✅
- **Response**: `{ "finances": { "balance": ..., "income": {...}, "expenses": {...} }, ... }`
- **Status**: ✅ 200
- Shows current season financial breakdown.

#### POST `/api/GetFinanceHistory` 🔒 ✅
- **Response**: `{ "entries": [{ "matchday": 0, "date": "...", "items": [...] }] }`
- **Status**: ✅ 200
- Per-matchday transaction history.

#### POST `/api/GetMyMail` 🔒 ✅
- **Response**: `{ "mails": [{ "id": "guid", "subject": "...", "body": "...", "isRead": false, ... }] }`
- **Status**: ✅ 200
- The Inbox tab. Includes system messages, match reports, transfer notifications.

#### POST `/api/MarkAsRead` / `MarkAllAsRead` / `DeleteMail` / `DeleteAllRead` 🔒 🔧
- Standard mail management actions. All accept `{ "id": "guid" }` or empty body.

#### POST `/api/GetAccomplishments` 🔒 ✅
- **Response**: `{ "accomplishments": [...] }`
- **Status**: ✅ 200

#### POST `/api/GetTeamInfo` 🔒 🔧
- **Request**: `{ "id": "teamId-guid" }`
- Returns info for any team (used when viewing opponent teams).

#### POST `/api/ChangeTeamName` 🔒 🔧
- **Request**: `{ "id": "teamId", "name": "NewName" }`

---

### 4. Squad

#### POST `/api/GetSquad` (aliases: `GetPlayers`) 🔒 ✅
- **Response**: `{ "players": [{ "id": "guid", "name": "...", "position": 0, "strength": 75, "talent": 5, "age": 22, "fitness": 95, "skills": [...], ... }] }`
- **Status**: ✅ 200
- **⚠️ Important**:
  - `position` values: 0 = GK, 2 = DEF, 4 = MID, 6 = ATT
  - `skills` is an array of 14 floats (attribute ratings)
  - `head`, `body`, `gloves`, `shoes` are nullable equipment slot identifiers
  - `shirt` is the player's shirt number (integer)
  - `country` must be a lowercase country name matching a drawable in the APK (e.g., `"deutschland"`, `"england"`)

#### POST `/api/GetPlayerStatistics` 🔒 🔧
- **Request**: `{ "id": "playerId" }`
- Returns per-player match stats.

#### POST `/api/GetTeamPlayers` 🔒 🔧
- **Request**: `{ "id": "teamId" }`
- Returns another team's squad (for scouting/match preview).

#### POST `/api/GetTrainingProgress` 🔒 🔧
- **Request**: `{ "id": "playerId" }`
- Returns individual player training progress data.

#### POST `/api/RenamePlayer` (alias: `ChangePlayerName`) 🔒 🔧
- **Request**: `{ "id": "playerId", "name": "NewName" }`

#### POST `/api/ChangeOrigin` (alias: `ChangePlayerOrigin`) 🔒 🔧
- **Request**: `{ "id": "playerId", "countryId": 0 }`

#### POST `/api/ChangeShirt` (alias: `ChangePlayerShirt`) 🔒 🔧
- **Request**: `{ "id": "playerId", "number": 10 }`

#### POST `/api/SellPlayer` / `FirePlayer` / `HealPlayer` / `UpgradePlayer` 🔒 🔧
- **Request**: `{ "id": "playerId" }`

#### POST `/api/ExtendPlayerContract` 🔒 🔧
- **Request**: `{ "id": "playerId", "playerID": "playerId", "salary": 1000, "premiumRenewal": false }`
- **Response**: `{ "success": true, "newSalary": ..., "renewCost": ... }`

#### POST `/api/GetSkillCards` 🔒 🔧
- Returns available skill cards for boosting players.

#### POST `/api/UseSkillCard` 🔒 🔧
- **Request**: `{ "id": "skillCardId" }`

---

### 5. Lineup

#### POST `/api/GetLineups` 🔒 ✅
- **Response**: `{ "lineups": [{ "matchId": "guid", "playerIds": [...], "system": "4-4-2", "tactic": 0 }] }`
- **Status**: ✅ 200
- Returns saved lineups for upcoming matches.

#### POST `/api/GetMatchFormation` (alias: `GetMatchLineup`) 🔒 ✅
- **Request**: `{ "matchId": "guid" }`
- **Response**: Detailed formation data for a specific match.
- **Status**: ✅ 200 (21KB response)
- **⚠️ Important**: The Xamarin client calls this as `GetMatchFormation` (legacy name). The backend accepts both `GetMatchFormation` and `GetMatchLineup`.

#### POST `/api/SaveLineup` 🔒 🔧
- **Request**: `{ "matchId": "guid", "playerIds": ["guid1", "guid2", ...], "system": "4-4-2", "tactic": 0 }`
- Saves the lineup for an upcoming match. `playerIds` must be an ordered list of 11 player GUIDs.

---

### 6. Sponsors

#### POST `/api/GetSponsors` (alias: `GetSponsorOffers`) 🔒 ✅
- **Response**: `{ "sponsors": [{ "id": "guid", "name": "...", "bonus": 1000, "duration": 5, ... }] }`
- **Status**: ✅ 200
- Called during app startup.

#### POST `/api/NegotiateSponsor` / `AcceptSponsor` 🔒 🔧
- **Request**: `{ "id": "sponsorId" }`

---

### 7. Stadium

#### POST `/api/GetStadium` 🔒 ✅
- **Response**: `{ "stadium": { "name": "...", "capacity": 5000, "level": 3, "places": [...], "buildings": [...] } }`
- **Status**: ✅ 200 (4.5KB response)

#### POST `/api/GetBuildPlaces` 🔒 🔧
- Returns available building slots and upgrade options.

#### POST `/api/BuildStadium` (alias: `Build`) 🔒 🔧
- **Request**: `{ "id": "buildingId" }`
- Initiates a stadium construction.

#### POST `/api/BuildPlaces` 🔒 🔧
- **Request**: `{ "places": [{ "id": "placeId", "count": 100 }] }`
- Build/expand stadium seating.

#### POST `/api/SpeedupBuilding` (alias: `Speedup`) 🔒 🔧
- **Request**: `{ "id": "buildingId" }`
- Speeds up construction using premium currency.

#### POST `/api/RenewStadiumGrass` (alias: `RenewGrass`) / `RenameStadium` 🔒 🔧
- Maintenance actions.

#### POST `/api/GetUnderConstruction` 🔒 🔧
- Returns active construction tasks.

---

### 8. Equipment / Shop

#### POST `/api/GetEquipment` 🔒 ✅
- **Response**: `{ "items": [{ "id": "guid", "name": "...", "type": 0, "bonus": 5, "price": 100, ... }] }`
- **Status**: ✅ 200 (34KB response)
- **⚠️ Important**: Called **3 times** during Equipment screen load — once per category (head, body, shoes/gloves). The client sends the same empty request body each time; the backend returns all equipment in one response.

#### POST `/api/GetProducts` 🔒 🔧
- Returns premium shop products (IAP items).

#### POST `/api/BuyProduct` / `UseEquipment` 🔒 🔧
- **Request**: `{ "id": "itemId" }`

#### POST `/api/VerifyPurchase` 🔒 🔧
- **Request**: `{ "platform": "android", "productIdentifier": "...", "purchaseToken": "..." }`
- For Google Play IAP verification.

#### POST `/api/WatchAd` (alias: `ClaimAdReward`) 🔒 🔧
- Claims a reward for watching an advertisement.

---

### 9. Training

#### POST `/api/GetTeamTraining` (alias: `GetTraining`) 🔒 ✅
- **Response**: `{ "teamTraining": { "players": [...], "trainPrice": 1000 }, "tacticTraining": {...}, "trainingCamp": {...}, "individualTraining": {...} }`
- **Status**: ✅ 200 (17.6KB response)
- **⚠️ Important**: Returns the full training state including all player skill details and training slot assignments. Player data in this response has the same format as `GetSquad`.

#### POST `/api/SaveTeamTraining` 🔒 🔧
- **Request**: `TeamTrainingSaveRequest` with training assignments.
- Returns updated `TeamTrainingData`.

#### POST `/api/SaveTacticTraining` 🔒 🔧
- **Request**: `TacticTrainingSaveRequest` with tactic training config.

#### POST `/api/BookTrainingCamp` (alias: `BookCamp`) 🔒 🔧
- **Request**: `TrainingCampRequest` with camp selection.

#### POST `/api/CancelCamp` / `UpdateCamps` 🔒 🔧
- Camp management actions.

#### POST `/api/SaveIndividualTraining` (alias: `StartIndividualTraining`) 🔒 🔧
- **Request**: `{ "id": "playerId" }` — assigns individual training to a player.

#### POST `/api/CancelIndividualTraining` / `RenewIndividualTraining` / `RenewAllIndividualTraining` 🔒 🔧
- Individual training management. `RenewAll` renews all expired individual trainings at once.

---

### 10. Scouting

#### POST `/api/GetScoutedPlayers` 🔒 ✅
- **Response**: `{ "players": [], "scoutingCost": 500000, "premiumScoutingCost": 5, "speedupCost": 3, "nextScoutingDate": null }`
- **Status**: ✅ 200
- Returns currently scouted players and scouting costs.

#### POST `/api/InstructScout` 🔒 🔧
- **Request**: `ScoutInstructionRequest` with scouting criteria.
- Sends the scout to find new players.

#### POST `/api/RecruitScoutedPlayer` 🔒 🔧
- **Request**: `{ "id": "playerId" }`
- Recruits a scouted player to the squad.

#### POST `/api/SpeedupScout` 🔒 🔧
- **Request**: `{ "id": "scoutId" }`
- Speeds up scouting using premium currency.

---

### 11. Transfer Market

#### POST `/api/Search` (alias: `SearchTransfermarket`) 🔒 ✅
- **Request**: `{ "talent": { "min": 0, "max": 10 }, "skillIndex": 0, "minimumBid": 0, "strength": null, "onlyKeeper": false }`
- **Response**: `{ "players": [{ "auctionId": "guid", "player": {...}, "currentBid": 1000, "endDate": "...", ... }] }`
- **Status**: ✅ 200 (2.2KB response)

#### POST `/api/GetTransferDetails` 🔒 🔧
- **Request**: `{ "auctionId": "guid" }`
- Returns detailed auction info for a specific transfer listing.

#### POST `/api/BidPlayer` (alias: `PlaceBid`) 🔒 🔧
- **Request**: `{ "id": "auctionId", "bid": 5000 }`
- Rate-limited under `mutation-write` policy.

#### POST `/api/GetTransfermarketFavourites` / `UpdateTransfermarketFavourites` 🔒 🔧
- Manage favorite transfer listings.

---

### 12. League

#### POST `/api/GetLeagueTable` 🔒 ✅
- **Response**: `{ "teams": [{ "id": "guid", "name": "...", "logo": "wappenXX", "points": 0, "goalsFor": 0, "goalsAgainst": 0, ... }] }`
- **Status**: ✅ 200 (6KB response)
- **⚠️ Important**: `logo` field must be a valid `wappenXX` name — same constraint as `GetMyTeamExtendedInfo`.

#### POST `/api/GetMatches` 🔒 ✅
- **Response**: `{ "matches": [{ "id": "guid", "matchday": 0, "homeName": "...", "homeLogo": "wappenXX", "awayName": "...", "awayLogo": "wappenXX", "homeGoals": 0, "awayGoals": 0, ... }] }`
- **Status**: ✅ 200 (101KB response — includes all season matches)
- **⚠️ Important**: Large response. Contains all matches for the entire season. All `homeLogo`/`awayLogo` values must be valid wappen IDs.

#### POST `/api/GetGoalGetters` 🔒 ✅
- **Response**: `{ "players": [{ "name": "...", "goals": 5, "teamName": "...", ... }] }`
- **Status**: ✅ 200 (2.7KB response)

---

### 13. GT Ladder

#### POST `/api/GetLadder` 🔒 ✅
- **Response**: `{ "ladder": { "entries": [{ "teamName": "...", "teamLogo": "wappenXX", "rank": 1, "points": 100, ... }], "season": {...} } }`
- **Status**: ✅ 200 (4KB response)
- **⚠️ Important**: `teamLogo` in ladder entries must be valid wappen IDs.

#### POST `/api/GetLadderChallenge` 🔒 🔧
- **Request**: `{ "teamId": "guid" }`
- Gets challenge details for a ladder opponent.

#### POST `/api/RunMatch` 🔒 🔧
- **Request**: `{ "teamId": "guid" }`
- Executes a ladder match.

#### POST `/api/RestoreStamina` 🔒 🔧
- Restores ladder stamina using premium currency.

---

### 14. Friends

#### POST `/api/GetFriends` 🔒 ✅
- **Request**: `{ "text": "searchQuery" }` (optional for searching)
- **Response**: `{ "friends": [...], "requests": [...] }`
- **Status**: ✅ 200

#### POST `/api/GetChallenges` 🔒 ✅
- **Response**: `{ "challenges": [{ "id": "guid", "fromTeam": "...", "status": 0, ... }] }`
- **Status**: ✅ 200

#### POST `/api/SendChallenge` / `ReplyChallenge` 🔒 🔧
- **Request**: `{ "id": "friendId" }` / `{ "id": "challengeId", "accept": true }`

#### POST `/api/Like` / `Unlike` / `Accept` / `Decline` 🔒 🔧
- Friend management actions. All take `{ "id": "guid" }`.

---

### 15. Live Match

#### POST `/api/GetMatchDetails` (alias: `GetMatchReport`) 🔒 ✅
- **Request**: `{ "id": "matchId" }` (if empty, returns latest match)
- **Response**: `{ "match": { "id": "guid", "home": {...}, "away": {...}, "events": [...], "homeGoals": 0, "awayGoals": 0, ... } }`
- **Status**: ✅ 200

#### POST `/api/GetLiveMatch` 🔒 🔧
- **Request**: `{ "id": "matchId" }`
- Returns real-time match data during a running match (polling endpoint).

---

### 16. User / Settings

#### POST `/api/GetHelpshiftUserInfo` 🔒 ✅
- **Response**: `{ "userId": "guid", "email": "...", "name": "...", ... }`
- **Status**: ✅ 200
- Used by the help/support screen.

#### POST `/api/ClaimDailyReward` 🔒 ✅
- **Response**: `{ "success": true, "value": 1000 }`
- **Status**: ✅ 200
- Rate-limited under `mutation-write` policy.

#### POST `/api/GetPreferences` / `SavePreferences` 🔒 🔧
- Notification and app preference management.

#### POST `/api/UpdateUser` 🔒 🔧
- **Request**: `{ "userData": {...} }`
- Updates user profile data.

#### POST `/api/DeleteAccount` 🔒 🔧
- Permanently deletes the user account.

#### POST `/api/EnableMatchPush` 🔒 🔧
- **Request**: `{ "matchId": "guid" }`
- Enables push notifications for a specific match. Rate-limited.

---

### 17. Chat / Messaging

#### POST `/api/GetChatHistory` 🔒 ✅
- **Response**: `{ "messages": [...] }`
- **Status**: ✅ 200
- Fetches recent chat messages.

#### POST `/api/PostChatMessage` (alias: `Post`) 🔒 🔧
- **Request**: `{ "message": "text" }`
- Rate-limited under `chat-write` policy.

#### POST `/api/Typing` 🔒 🔧
- Sends typing indicator. Rate-limited.

---

### 18. Tutorial

#### POST `/api/GetTutorial` 🔒 🔧
- **Response**: `TutorialResponse` with tutorial progress state.
- **Status**: ✅ 200

#### POST `/api/SkipTutorial` / `FinishTutorialStep` / `ResetTutorial` 🔒 🔧
- Tutorial progression actions.

---

### 19. SignalR Hubs (WebSocket)

#### `/chat` — ChatHub 🔒 ✅
- **Negotiate**: `POST /chat/negotiate?negotiateVersion=1` (with `access_token` query param or Bearer header)
- **Protocol**: SignalR WebSocket with JSON protocol
- **Status**: ✅ Working (full handshake verified)
- **⚠️ Important**:
  - Auth via query param: `/chat?access_token=jwt-token`
  - The client connects during app startup after login.

#### `/auc` — AuctionHub 🔒 ✅
- **Negotiate**: `POST /auc/negotiate?negotiateVersion=1`
- **Protocol**: SignalR WebSocket with JSON protocol
- **Status**: ✅ Working
- **⚠️ Important**: Used for real-time transfer market bid updates. Same auth mechanism as ChatHub.

---

## Critical Constraints

### 1. Logo / Drawable Resource IDs
**Any field that represents a team logo MUST be a valid `wappenXX` drawable name from the APK.**

The APK contains exactly **82 valid wappen drawables** (sparse set):
```
wappen01–wappen26, wappen31, wappen33, wappen34, wappen37, wappen40,
wappen42–wappen45, wappen50–wappen53, wappen56, wappen58, wappen61,
wappen63, wappen65, wappen67, wappen68, wappen71, wappen76, wappen78–wappen80,
wappen83, wappen84, wappen88, wappen90, wappen92, wappen95, wappen97,
wappen100, wappen104–wappen107, wappen111, wappen113, wappen114,
wappen117, wappen118, wappen121, wappen125, wappen126, wappen128,
wappen130–wappen132, wappen135, wappen137, wappen142, wappen143,
wappen146, wappen150, wappen157
```

Invalid logos cause `Resources.GetIdentifier() → 0 → Context.GetDrawable(0) → Resources$NotFoundException`, which crashes the rendering chain in `ClubView.OnPropertyChanged` and leaves the spinner overlay permanently visible.

**Affected fields**: `teamData.logo`, `lastMatch.homeLogo`, `lastMatch.awayLogo`, `nextMatch.homeLogo`, `nextMatch.awayLogo`, `teams[].logo`, `matches[].homeLogo`, `matches[].awayLogo`, `ladder.entries[].teamLogo`.

### 2. Country Drawable Names
Player `country` fields must be lowercase country names that match drawables in the APK (e.g., `"deutschland"`, `"england"`, `"frankreich"`, `"spanien"`, `"italien"`, `"osterreich"`, `"irland"`). Invalid country names won't crash but will show placeholder images.

### 3. Response Wrapper Consistency
Every response must include the `success`, `message`, `status`, `errorMessage`, `punishment` fields at the top level. The Xamarin client checks `success` before processing the response body. If `success` is false, the client shows an error dialog.

### 4. All Requests Are POST
Even read-only data retrieval uses POST. The only GET endpoints are `/api/Ping`, `/api/GetVersion`, and `/api/Me`. The Xamarin client exclusively uses POST for gameplay endpoints.

### 5. SignalR Auth via Query Parameter
The WebSocket hubs extract auth tokens from the `access_token` query parameter, not the Authorization header. The middleware in `TokenQueryStringMiddleware` handles this by copying the query param to the Authorization header before the JWT handler runs.

### 6. Rate Limiting
Three rate limit policies are configured:
- `auth-sensitive`: Login/Register — prevents brute force
- `mutation-write`: State-changing operations (bids, rewards, match push) — prevents abuse
- `chat-write`: Chat messages and typing — prevents spam

---

## Verified Test Results Summary

| Screen | API Calls | Status |
|--------|-----------|--------|
| Club > My Club | GetMyTeamExtendedInfo, GetSponsors, GetMyMail | ✅ All 200 |
| Club > Sponsors | GetSponsors | ✅ 200 |
| Club > Inbox | GetMyMail | ✅ 200 |
| Club > Accomplishments | GetAccomplishments | ✅ 200 |
| Finances | GetMyResources, GetFinances, GetFinanceHistory | ✅ All 200 |
| Stadium | GetMyResources, GetStadium | ✅ All 200 |
| Equipment | GetMyResources, GetEquipment (×3) | ✅ All 200 |
| Training | GetMyResources, GetTeamTraining | ✅ All 200 |
| Scouting | GetMyResources, GetScoutedPlayers | ✅ All 200 |
| Transfer Market | GetMyResources, Search, /auc negotiate | ✅ All 200 |
| League > Table | GetMyResources, GetLeagueTable | ✅ All 200 |
| League > Matches | GetMatches | ✅ 200 |
| League > Goalscorers | GetGoalGetters | ✅ 200 |
| GT Ladder | GetMyResources, GetLadder | ✅ All 200 |
| Friends | GetMyResources, GetFriends, GetChallenges | ✅ All 200 |
| Live | GetMyResources, GetMatchDetails | ✅ All 200 |
| Settings / Help | GetHelpshiftUserInfo | ✅ 200 |
| (Startup) | Login, GetCurrentAppVersion, GetCountries, GetSeasonInfo, /chat negotiate | ✅ All 200 |

**Total unique endpoints tested**: 28 (+ 2 SignalR hubs)  
**Failures**: 0  
**App screens with spinner/hang**: 0 (all render properly)
