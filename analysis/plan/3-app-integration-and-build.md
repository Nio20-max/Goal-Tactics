# Phase 3 - App Integration And Build

This phase rewires the mobile client so it depends only on the rebuilt new backend. The goal is not just to change a base URL. The goal is to remove or replace every remaining legacy `/GameEngine/*` dependency, reconnect the app to `/api/*`, `/chat`, and `/auc`, and produce working signed builds.

## 3.1 Inputs required from earlier phases

Phase 3 depends on:

- the Phase 0 legacy-to-new API mapping being complete
- the new backend routes being implemented and contract-tested in Phase 1
- the chat and auction hubs being live
- purchase verification, daily reward, preferences, and notification services being functional

## 3.2 Main client rewrite objective

The rebuilt app should make calls only to:

- `https://<new-host>/api/*`
- `wss://<new-host>/chat`
- `wss://<new-host>/auc`

The app should no longer depend on:

- `https://engine.goaltactics.de/GameEngine/*`
- any request-signing flow specific to the legacy surface
- legacy `Json*` service wrappers that are no longer needed after the migration

## 3.3 Required client analysis and patch set

Create these rewrite documents before changing code:

- `docs/rebuild/client/service-callsite-inventory.md`
- `docs/rebuild/client/legacy-to-new-api-mapping.md`
- `docs/rebuild/client/client-dto-migration-plan.md`
- `docs/rebuild/client/realtime-reconnection-plan.md`
- `docs/rebuild/client/build-environment.md`

The callsite inventory must list for every service method:

- current client class and file
- current route or base service
- target new route
- DTO conversion requirement
- whether the UI behavior also changes

## 3.4 Code areas to inspect and patch

The app rewrite should search and patch all of these categories:

- URL helper and base URL constants
- Refit interface registrations
- service classes that still depend on legacy `BaseServiceUrl`
- service classes that still send legacy signed request envelopes
- auth bootstrap and session refresh logic
- SignalR connection setup for chat and auction
- client DTO mapping code that still expects legacy `Json*` payloads
- push-notification deep links and event routing
- purchase verification and shop flows
- tutorial progression and first-run onboarding

Likely file and symbol targets to inspect in the reconstructed client code:

- `URLHelper`
- `BaseService<T>`
- `AuthenticationManager`
- all Refit API interfaces
- transfer-market services
- team and player services
- training and stadium services
- chat and realtime connection setup

## 3.5 Exact migration work by subsystem

### Authentication

- keep login, verify login, and register on the new auth API
- ensure token persistence uses the new `AuthResponse.Token`
- remove legacy request-signing code from new-service call paths
- keep app-version and capabilities headers on every new API call

### Team and club state

- replace legacy team-overview fetches with `GetMyTeamInfo`, `GetMyTeamExtendedInfo`, `GetClubNews`, `GetMyResources`, `GetMyMail`, `GetAccomplishments`, `GetFinances`, and `GetFinanceHistory`
- replace legacy rename and mail actions with new API equivalents

### League, live, and lineup

- replace any old league or match-detail services with `GetLeagueTable`, `GetMatches`, `GetGoalGetters`, `GetLineups`, `GetMatchLineup`, `SaveLineup`, and `GetMatchDetails`
- preserve lineup lock behavior in the UI using `MatchLineupResponse.IsLocked`
- preserve captain, penalty, corner, and free-kick bonus displays from the new lineup response

### Squad, training, and scouting

- replace old player-service calls with new squad endpoints for rename, shirt, origin, sell, fire, heal, upgrade, skill cards, and contract cost or extension
- replace old training calls with `GetTraining`, `SaveTeamTraining`, `SaveTacticTraining`, camp actions, and individual-training actions
- replace youth-player legacy scouting with new scouting endpoints and timers

### Stadium and sponsors

- replace old stadium building and sponsor flows with `GetStadium`, `Build`, `BuildPlaces`, `Speedup`, `RenewGrass`, `RenameStadium`, `GetSponsors`, `Accept`, and `Negotiate`

### Transfer market

- rewire the entire market feature to the new `Search`, `GetDetails`, `PlaceBid`, `GetFavorites`, `AddFavorite`, and `RemoveFavorite` routes
- remove any remaining calls to legacy `SearchTransfermarket`, `GetTransfermarketBids`, or bid submission methods after the new UI data flow is verified

### Friends, chat, and realtime

- move friend search, requests, likes, and friendlies to the new friends API
- reconnect chat history, typing, and post flows to `/api/GetChatHistory`, `/api/Typing`, `/api/Post`, and the `/chat` hub
- reconnect transfer-market live updates to the `/auc` hub and its `Bidded` event

### Shop, rewards, preferences, support

- wire product and equipment flows to the new shop endpoints
- verify Google Play purchase completion against the new backend only
- wire `ClaimDailyReward`, `GetPreferences`, `SavePreferences`, `UpdateUser`, `DeleteAccount`, and `GetHelpshiftUserInfo`

## 3.6 DTO migration strategy

The app phase must explicitly decide for each screen whether to:

- keep existing UI models and map new DTOs into them
- or replace old UI models with new contracts directly

Recommended rule:

- keep presentation models when they are already stable and local to the screen
- remove legacy transport DTOs from the app service layer as soon as the screen is migrated

Create adapter classes for temporary overlap, then delete them once the entire subsystem is migrated.

## 3.7 Realtime reconnect and offline behavior

The app must preserve practical mobile behavior:

- retry JWT-authenticated SignalR connection after app resume
- reload latest chat history after reconnect to close message gaps
- reload latest auction details after reconnect to close bid-state gaps
- keep user-visible states for connecting, reconnecting, and stale data
- unsubscribe and resubscribe cleanly on logout and account switching

## 3.8 Build and signing requirements

Document exact build prerequisites:

- Xamarin or the exact toolchain needed by the recovered app project
- Android SDK version
- Java SDK version
- NuGet restore flow
- signing keystore setup
- Firebase configuration file placement
- IronSource or ad SDK configuration if retained in test builds

Required build outputs:

- debug APK for local QA
- release APK or AAB for internal testing
- symbol files or crash-reporting artifacts if supported

## 3.9 Verification checklist for the rewritten app

Every migrated subsystem must be tested on device or emulator:

- login, register, and session restore
- club overview, resources, and mail
- lineup fetch, edit, lock display, and save
- league table, fixtures, and match reports
- squad actions: rename, shirt, origin, heal, contract, upgrade, skill cards
- training actions: team, tactic, individual, camps
- scouting actions: standard, premium, speedup, recruit
- stadium actions: build, build places, grass, speedup, rename
- sponsor negotiation and acceptance
- transfer-market search, details, favorite, bid, and live updates
- chat history, typing, post, reconnect
- daily reward, preferences, support identity, account update, account deletion
- purchase verification and reward grant with test credentials

## 3.10 CI and release packaging

Create these build and release artifacts:

- `azure-pipelines.yml` or equivalent CI file
- `docs/rebuild/client/build-environment.md`
- `docs/rebuild/client/release-checklist.md`
- `scripts/android-build-debug.sh`
- `scripts/android-build-release.sh`

The release checklist must include:

- backend environment URL
- correct Firebase project
- correct billing product IDs
- correct signing identity
- version code and version name bump
- smoke-test signoff from core gameplay flows

## 3.11 Exit criteria

Phase 3 is complete only when:

- the app contains no remaining required dependency on the legacy `/GameEngine/*` API
- every active screen hits the new backend only
- chat and auction realtime flows reconnect correctly
- test purchases verify against the rebuilt backend
- signed debug and release builds are produced successfully