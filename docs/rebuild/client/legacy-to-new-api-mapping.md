# Legacy To New API Mapping (Phase 0)

## Phase 0 Step Log
1. Extracted old `/GameEngine/*` and new `/api/*` route surfaces from recovered docs.
2. Applied scope decision: rebuilt app targets new API only.
3. Defined migration buckets for service-level rewrite.

## Exact from client/docs
- Legacy surface exists under `/GameEngine/*` with `Json*` DTOs.
- New surface exists under `/api/*` with typed request/response objects.

## Mapping table (service bucket)
- Auth/login:
  - Legacy `/Login`, `/GetCurrentAppVersion`, `/CheckPunishments` -> New `/Login`, `/VerifyLogin`, `/GetVersion`, plus user/status routes.
- Team overview/resources/mail:
  - Legacy `/GetTeam`, `/GetMoney`, mail-related legacy routes -> New `/GetMyTeamInfo`, `/GetMyResources`, `/GetMyMail`, `Mark*`, `Delete*`.
- League/live:
  - Legacy `/GetLeague*`, `/GetMatchDetails` -> New `/GetLeagueTable`, `/GetMatches`, `/GetGoalGetters`, `/GetMatchDetails`.
- Lineup:
  - Legacy `/GetMatchFormation`, `/SetMatchFormation`, `/GetLineupStatus` -> New `/GetLineups`, `/GetMatchLineup`, `/SaveLineup`.
- Squad/contracts/upgrades:
  - Legacy player endpoints -> New squad endpoints (`RenamePlayer`, `ChangeOrigin`, `ChangeShirt`, `SellPlayer`, `FirePlayer`, `GetPlayerContractCost`, `ExtendPlayerContract`, `UpgradePlayer`, `UseSkillCard`, `HealPlayer`).
- Training:
  - Legacy `SaveTraining*` and camp endpoints -> New `GetTraining`, `SaveTeamTraining`, `SaveTacticTraining`, camp and individual training lifecycle endpoints.
- Scouting:
  - Legacy youth-player routes -> New `GetPlayers`, `Instruct`, `Recruit`, `Speedup` under scouting API.
- Transfer market:
  - Legacy `SearchTransfermarket`, `BidPlayer`, favorites update -> New `Search`, `GetDetails`, `PlaceBid`, `GetFavorites`, `AddFavorite`, `RemoveFavorite`.
- Stadium:
  - Legacy stadium build and speedup routes -> New `GetStadium`, `Build`, `BuildPlaces`, `Speedup`, `RenewGrass`, `RenameStadium`.
- Sponsors:
  - Legacy sponsor offer routes -> New `GetSponsors`, `Accept`, `Negotiate`.
- Friends/social/chat:
  - Legacy friend/friendly routes -> New friends API + chat API + `/chat` hub.
- Ladder:
  - Legacy ladder routes -> New `GetLadder`, `GetLadderChallenge`, `RunMatch`, `RestoreStamina`.
- Tutorial/user preferences:
  - Legacy duplicated tutorial endpoints -> New tutorial and user profile/preference routes.

## Exact from decompiled logic
- Remaining app usage should preserve headers `x-goaltactics-version` and `x-goaltactics-capabilities`.

## Fallback model selected after testing
- None. Mapping is deterministic rewrite work.

## Migration completion condition
- No required runtime call path should depend on `/GameEngine/*` after Phase 3.
