# Project State Report

## 1. Executive Summary

A comprehensive audit and implementation effort has been performed on the GoalTactics project:

- **Complete API audit**: 18 controllers, 117+ endpoints, 2 SignalR hubs documented
- **Per-endpoint analysis**: 19 detailed analysis files created in `information/api_analysis/`
- **New bot implementation**: API-client bot system created in `bots/` (16 C# files)
- **Existing bot analysis**: Simulation bot system in `src/GoalTactics.Bots/` analyzed and documented

The project is a football (soccer) manager game with an ASP.NET backend, originally built for a Xamarin mobile client. The new bot system simulates realistic player behavior by calling the same API endpoints a real player would use.

---

## 2. What Has Been Implemented

### 2.1 API Endpoint Audit

All 18 controllers in `src/GoalTactics.Api/Controllers/` have been audited:

| Controller | File | Endpoints | Key Functionality |
|-----------|------|-----------|-------------------|
| AuthController | `AuthController.cs` | Register, Login, VerifyEmail, ResetPassword | User authentication and account management |
| ChatController | `ChatController.cs` | PostChatMessage, GetChatHistory | In-game chat system |
| CommonController | `CommonController.cs` | GetCommonData, GetVersion | Shared game data and version info |
| FriendsController | `FriendsController.cs` | GetFriends, Like, Accept, Decline, Block | Social/friendship management |
| LadderController | `LadderController.cs` | GetLadder, RunMatch, GetMatchResult | Competitive ladder and matches |
| LeagueController | `LeagueController.cs` | GetLeague, GetStandings, GetFixtures | League system |
| LineupController | `LineupController.cs` | GetLineups, SaveLineup | Team lineup management |
| LiveController | `LiveController.cs` | GetLiveMatch, GetLiveEvents | Live match viewing |
| ScoutingController | `ScoutingController.cs` | InstructScout, GetScoutedPlayers, RecruitScoutedPlayer | Player scouting system |
| ShopController | `ShopController.cs` | GetShopItems, PurchaseItem, WatchAd | In-app purchases and ads |
| SponsorController | `SponsorController.cs` | GetSponsorOffers, AcceptSponsor | Sponsor deal system |
| SquadController | `SquadController.cs` | GetSquad, GetPlayerDetails | Squad management |
| StadiumController | `StadiumController.cs` | GetStadium, BuildStadium | Stadium building/upgrades |
| TeamController | `TeamController.cs` | GetTeam, GetEquipment, SaveEquipment | Team settings and equipment |
| TrainingController | `TrainingController.cs` | GetTeamTraining, SaveTeamTraining, SaveIndividualTraining | Training management |
| TransferMarketController | `TransferMarketController.cs` | SearchTransfermarket, BidPlayer, SellPlayer | Transfer market/auctions |
| TutorialController | `TutorialController.cs` | GetTutorial, CompleteTutorial | New player tutorial |
| UserController | `UserController.cs` | GetMyResources, GetProfile, ClaimDailyReward | User profile and resources |

**Total: 117+ endpoints documented across 18 controllers**

19 detailed analysis files were created under `information/api_analysis/`:

```
information/api_analysis/
├── authentication_endpoints.md
├── chat_endpoints.md
├── common_endpoints.md
├── friends_endpoints.md
├── ladder_endpoints.md
├── league_endpoints.md
├── lineup_endpoints.md
├── live_match_endpoints.md
├── realtime_hubs.md
├── scouting_endpoints.md
├── shop_endpoints.md
├── sponsors_endpoints.md
├── squad_endpoints.md
├── stadium_endpoints.md
├── team_endpoints.md
├── training_endpoints.md
├── transfer_market_endpoints.md
├── tutorial_endpoints.md
└── user_endpoints.md
```

### 2.2 Bot Implementation

A standalone .NET 10 console application was created in `bots/` with 16 C# source files:

| File | Purpose |
|------|---------|
| `Program.cs` | Entry point, CLI argument parsing |
| `BotConfig.cs` | Configuration model (API URL, DB path, bot count) |
| `BotPersonality.cs` | Personality trait definitions and generation |
| `BotRunner.cs` | Main orchestration loop |
| `BotFactory.cs` | Bot creation and API registration |
| `Database/BotDatabase.cs` | SQLite database management (4 tables) |
| `Scheduling/BotScheduler.cs` | Timezone-aware wake-up scheduling |
| `ApiClient/GoalTacticsApiClient.cs` | HTTP client for all API calls |
| `ApiClient/ApiModels.cs` | Request/response DTOs |
| `Behaviors/TransferMarketBehavior.cs` | Transfer market bidding logic |
| `Behaviors/StadiumBehavior.cs` | Stadium building decisions |
| `Behaviors/TrainingBehavior.cs` | Training and scouting management |
| `Behaviors/SocialBehavior.cs` | Friend/enemy social interactions |
| `Behaviors/DailyRoutineBehavior.cs` | Daily rewards, ads, sponsors |
| `Behaviors/LineupBehavior.cs` | Formation and lineup management |

**Supporting files:**
- `GoalTacticsBots.csproj` — Project file targeting .NET 10
- `gamertags.txt` — Bot username source list
- `premium_gamertags.txt` — Premium bot username source list
- Python scripts for name generation

**Key design decisions:**
- Calls only confirmed, documented API endpoints via HTTP
- No internal service references or shared assemblies with the API
- Own SQLite database for state persistence
- 6 behavior modules covering all major game activities
- Personality-driven decision making
- Timezone-aware scheduling with jitter

### 2.3 Existing Systems

#### Simulation Bot System (`src/GoalTactics.Bots/`)

An offline simulation system that does **not** call the API:
- 6 bot personas with different play styles
- 9 planning modules for different game aspects
- Multi-season simulation engine
- Outputs CSV/JSON analytics for game balance tuning

#### Core Application Structure

| Project | Purpose |
|---------|---------|
| `src/GoalTactics.Api/` | ASP.NET Web API with 18 controllers |
| `src/GoalTactics.Application/` | Business logic services and CQRS handlers |
| `src/GoalTactics.Infrastructure/` | Data access layer (Entity Framework Core + SQLite) |
| `src/GoalTactics.Contracts/` | Shared DTOs and interface contracts |
| `src/GoalTactics.Realtime/` | SignalR hubs (`/chat`, `/auc`) |
| `src/GoalTactics.Worker/` | Background job processing |

---

## 3. Client-Server Discrepancies

The following discrepancies were identified between the legacy Xamarin client and the current backend:

| Issue | Detail | Impact |
|-------|--------|--------|
| **Auth field naming** | Legacy client sends `login` field instead of `email` for authentication | Backend accepts both — no breaking change |
| **Login response level** | `level` field always returns 0 | Original server returned manager level; clients may show incorrect level |
| **Token format** | Original server returned GUID tokens; new backend returns JWT | Client accepts both formats transparently |
| **Route rewriting** | Legacy `/GameEngine/*` routes handled via nginx rewrite to `/api/*` | Deployment requires nginx configuration |
| **Ignored body fields** | Client sends `signature`, `token`, `locale` in request body | All ignored by backend — no validation |
| **Triple API call** | `GetEquipment` called 3 times on screen load | Performance concern — should be cached client-side |
| **Position codes** | 0=GK, 2=DEF, 4=MID, 6=ATT (non-contiguous) | Must be preserved exactly — any change breaks lineup logic |
| **Sponsor system** | No standalone sponsor entity in database | Sponsors generated deterministically from seed data |

---

## 4. Current Gaps and TODOs

### High Priority

| Gap | Description | Effort |
|-----|-------------|--------|
| **Bot integration testing** | Bot client not yet tested against live API | Medium — needs running API instance |
| **SignalR hub integration** | Bots don't connect to `/chat` or `/auc` hubs | Medium — would enable real-time auction sniping |
| **Rate limiting tuning** | Bots respect cooldowns but may need tuning against production rate limits | Low — configuration change |

### Medium Priority

| Gap | Description | Effort |
|-----|-------------|--------|
| **Ladder match testing** | RunMatch endpoint implemented but not extensively tested | Medium |
| **Multi-server deployment** | Bot database is local SQLite; needs migration path for distributed setup | High |
| **Bot monitoring dashboard** | No UI for monitoring bot behavior 8should be under gt.nikolai-linschmann.de | High |

### Low Priority

| Gap | Description | Effort |
|-----|-------------|--------|
| **Group dynamics balancing** | Enemy group mechanics implemented but need balancing | Medium |
| **Chat message variety** | Templates are basic; could use more diverse conversation patterns | Low |
| **Behavior replay/audit** | No logging of individual bot decisions for replay | Medium |

---

## 5. Testing Status

### Main Solution Tests

| Test Project | Type | Count | Status |
|-------------|------|-------|--------|
| Unit Tests | xUnit | 32 | ✅ Passing |
| Contract Tests | xUnit | 27 | ✅ Passing |
| Simulation Tests | xUnit | 1 | ✅ Passing |
| **Total** | | **60** | **✅ All Passing** |

### Bot Project

| Check | Status |
|-------|--------|
| Compilation | ✅ 0 errors, 0 warnings |
| Automated tests | ❌ None yet |
| Integration tests | ❌ Needs API mock or integration test server |

### Recommended Test Additions

1. **Unit tests** for bot personality generation and scheduling logic
2. **Integration tests** using `WebApplicationFactory` to test against in-memory API
3. **Behavior tests** verifying decision logic for each behavior module
4. **Load tests** to verify bot system can handle 96+ concurrent bots

---

## 6. Suggestions

### Short-Term (Next Sprint)

1. **Deploy bot client alongside API server** with shared configuration (environment variables or `appsettings.json`)
2. **Add health check endpoint** for bot monitoring (`/health` returning bot count, active count, last errors)
3. **Write integration tests** using `WebApplicationFactory` to test bot behaviors against the real API in-memory
4. **Tune rate limiting** by profiling bot behavior against production API rate limits

### Medium-Term (1–2 Sprints)

5. **Implement SignalR hub connections** for real-time auction participation (connect to `/auc` hub)
6. **Add Prometheus/OpenTelemetry metrics** to bot behaviors (bid counts, success rates, response times)
7. **Create bot population management UI** — simple web dashboard showing bot status and behavior stats
8. **Add configuration hot-reload support** — allow tuning bot parameters without restart

### Long-Term (Future)

9. **Migrate bot database to PostgreSQL** for production multi-server deployment
10. **Implement bot behavior replay/audit logging** — record all decisions for analysis
11. **Add machine learning** for dynamic behavior adjustment based on game state
12. **Create A/B testing framework** for bot behavior variants

---

## 7. File Inventory

### New Files Created

#### Bot System (`bots/`)

| File | Purpose |
|------|---------|
| `bots/GoalTacticsBots.csproj` | Project file (.NET 10 console app) |
| `bots/Program.cs` | Entry point and CLI argument parsing |
| `bots/BotConfig.cs` | Configuration model |
| `bots/BotPersonality.cs` | Personality trait definitions |
| `bots/BotRunner.cs` | Main orchestration loop |
| `bots/BotFactory.cs` | Bot creation and registration |
| `bots/Database/BotDatabase.cs` | SQLite database management |
| `bots/Scheduling/BotScheduler.cs` | Wake-up time calculation |
| `bots/ApiClient/GoalTacticsApiClient.cs` | HTTP API client |
| `bots/ApiClient/ApiModels.cs` | Request/response DTOs |
| `bots/Behaviors/TransferMarketBehavior.cs` | Transfer market logic |
| `bots/Behaviors/StadiumBehavior.cs` | Stadium building logic |
| `bots/Behaviors/TrainingBehavior.cs` | Training and scouting |
| `bots/Behaviors/SocialBehavior.cs` | Social interactions |
| `bots/Behaviors/DailyRoutineBehavior.cs` | Daily routine tasks |
| `bots/Behaviors/LineupBehavior.cs` | Lineup management |
| `bots/gamertags.txt` | Bot username source list |
| `bots/premium_gamertags.txt` | Premium username source list |

#### API Analysis (`information/api_analysis/`)

| File | Covers |
|------|--------|
| `authentication_endpoints.md` | AuthController — Register, Login, Verify, Reset |
| `chat_endpoints.md` | ChatController — Messages, History |
| `common_endpoints.md` | CommonController — Shared data, Version |
| `friends_endpoints.md` | FriendsController — Social features |
| `ladder_endpoints.md` | LadderController — Ranked matches |
| `league_endpoints.md` | LeagueController — League system |
| `lineup_endpoints.md` | LineupController — Lineup management |
| `live_match_endpoints.md` | LiveController — Live match viewing |
| `realtime_hubs.md` | SignalR Hubs — `/chat`, `/auc` |
| `scouting_endpoints.md` | ScoutingController — Player scouting |
| `shop_endpoints.md` | ShopController — Purchases, Ads |
| `sponsors_endpoints.md` | SponsorController — Sponsor deals |
| `squad_endpoints.md` | SquadController — Squad management |
| `stadium_endpoints.md` | StadiumController — Stadium building |
| `team_endpoints.md` | TeamController — Team settings |
| `training_endpoints.md` | TrainingController — Training system |
| `transfer_market_endpoints.md` | TransferMarketController — Auctions |
| `tutorial_endpoints.md` | TutorialController — New player tutorial |
| `user_endpoints.md` | UserController — Profile, Resources |

#### Documentation (`information/`)

| File | Purpose |
|------|---------|
| `information/bot_behavior_report.md` | Comprehensive bot system behavior documentation |
| `information/project_state_report.md` | This file — project state overview |
| `information/bot_concept_new.md` | Original bot concept specification |
| `information/BOT_README.md` | Bot system README |
| `information/api-endpoint-report.md` | API endpoint summary report |
| `information/api-capture-analysis.md` | API capture analysis from client traffic |
| `information/production-readiness-plan.md` | Production readiness planning |
| `information/production-readiness-analysis.md` | Production readiness analysis |

### Existing Solution Structure

```
src/
├── GoalTactics.Api/              # ASP.NET Web API (18 controllers)
├── GoalTactics.Application/      # Business logic (CQRS handlers)
├── GoalTactics.Infrastructure/   # Data access (EF Core + SQLite)
├── GoalTactics.Contracts/        # Shared DTOs
├── GoalTactics.Realtime/         # SignalR hubs
├── GoalTactics.Bots/             # Simulation bot system (offline)
└── GoalTactics.Worker/           # Background jobs

tests/
├── GoalTactics.UnitTests/        # 32 unit tests
├── GoalTactics.ContractTests/    # 27 contract tests
└── GoalTactics.SimulationTests/  # 1 simulation test

tools/
└── AssemblyUrlPatcher/           # Build tool for URL patching

bots/                             # New API-client bot system
├── ApiClient/
├── Behaviors/
├── Database/
└── Scheduling/
```
