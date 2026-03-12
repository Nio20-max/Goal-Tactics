# Production Readiness Plan — Goal Tactics Backend

**Date:** 2026-03-12  
**Last Updated:** 2026-03-12 (all sections complete)

This document outlines a prioritized sequence of work items and milestones required to take the Goal
Tactics backend from its current bug‑fixed state to a production‑ready service.  It complements the
`production-readiness-analysis.md` report by focusing on *when* and *how* to tackle remaining
features, hardening tasks, and improvements.

---

## 1. Immediate critical path ✅
All critical-path items are implemented, tested, and verified (60/60 tests passing).

1. **Transfer market engine** ✅
   - Created `AuctionEntity`, `AuctionBidEntity` entities and `auctions`/`auction_bids` tables (migration `20260312020000_AddAuctionTables`).
   - Implemented `IAuctionStore` / `AuctionDbStore` with listing, bidding (extends expiry by 20s), and settlement.
   - `TransferMarketService` rewritten: real auctions replace `BuildTransferPlayers()`, paginated via `SearchRequest`.
   - `AuctionSettlementJob` background worker expires/settles old listings.
   - `AuctionHub` broadcasts bids in real-time via SignalR.

2. **Per-player goal tracking** ✅
   - `MatchSimulationEngine.SimulateDetailed()` returns `MatchScorerEvent` list with player IDs and minutes.
   - `LeagueDbStore.ResolveMatchAsync()` persists scorers.
   - `LeagueService.GetGoalGettersAsync()` queries real player stats.

3. **Match simulation rewrite** ✅
   - Event-driven engine with minute-by-minute resolution: goals, yellow/red cards, injuries.
   - Tactic bonus system (rock-paper-scissors across 7 tactics) with training-time scaling.
   - Deterministic seeding via match GUID hash for reproducibility.
   - `ScheduledMatchResolutionJob` loads real player lineups and tactic training state.

4. **Resolve failing tests** ✅
   - `FriendsControllerTests`: fixed pagination flow with `SearchRequest` extends `RequestObject`.
   - `TeamAccomplishmentTests`: corrected to pass teamId instead of userId.

5. **Authentication hardening** ✅
   - JWT refresh rotation with `UserSessionEntity` tracking (migration `20260312030000_AddAuthHardeningColumns`).
   - Account lockout: `FailedLoginCount` / `LockedUntilUtc` on `UserEntity` with 5-attempt threshold + 15-minute lockout.
   - PBKDF2 (SHA-512, 210,000 iterations) password hashing.

6. **Database migrations deployment** ✅
   - All migrations applied via `dbContext.Database.Migrate()` at startup.
   - Migrations: `AddAuctionTables`, `AddAuthHardeningColumns`, `AddScoutingReadyAtAndHead`, `AddSponsorContracts`, `AddLadderGoalTracking`.

## 2. Secondary backend improvements ✅
All secondary items complete.

1. **Scouting mechanics** ✅ — `NextScoutingDate` honoured, `ReadyAtUtc` added to entity (migration `20260312040000_AddScoutingReadyAtAndHead`), star speed-ups implemented (halves wait time), simultaneous scout cap enforced.

2. **Transfer market favorites and selling** ✅ — Implemented via `IAuctionStore.ToggleFavoriteAsync()` and `TransferMarketService.SellPlayerAsync()`.

3. **Pagination** ✅ — `SearchRequest` extends `RequestObject` with `Page`/`PageSize`. Applied to friends search, transfer market, and league queries. `LeagueController` passes pagination to `LeagueService`.

4. **Sponsor system overhaul** ✅ — `SponsorContractEntity` with durations and renewals (migration `20260312050000_AddSponsorContracts`). `SponsorService` rewritten with season/short-term contracts. `SponsorRefreshJob` handles expiry and renewal. Performance bonuses: `secondarySponsorPerWin` / `secondarySponsorPerGoal`.

5. **Equipment image validation** ✅ — `EquipmentCatalog` (Application/Common/) with validated shirt/emblem lists. `ShopService.BuyProductAsync()` validates via `EquipmentCatalog.IsValidDrawable()`. `LegacyAppCompatibility.BuildShirtId()` uses catalog instead of raw modulo.

6. **Financial ledger formatting** ✅ — Economy tick creates matching ledger entries: "Zuschauer"/"Eintrittsgelder" (gate receipts), "Nebensponsor"/"Siegprämie" (win bonus), "Nebensponsor"/"Torprämie" (goal bonus). Income calculation includes all bonus types.

## 3. Long-term polish & operational readiness ✅
All polish items complete.

- **Bot AI expansion** ✅ — All three core planners (`BotTrainingPlanner`, `BotScoutingPlanner`, `BotTransferPlanner`) rewritten with trait-driven scoring using `IBotProfile` traits (`TrainingDiscipline`, `RiskTolerance`, `TransferAppetite`). `PlannerUtilities.ResolveProfile()` maps persona string → profile. Planners consider team strength, training center level, squad health risk, contract risk, money reserves, and upcoming matches. Training gain scales with training center level (2× at level 4+).

- **Live match event broadcasting** ✅ — `IMatchEventBroadcaster` interface (Application/Live/). `SignalRMatchEventBroadcaster` (Realtime/) pushes `MatchResult` events to the `ChatHub` "public" group. `ScheduledMatchResolutionJob` calls broadcaster after each match resolution. API process runs worker jobs to enable real-time broadcasting.

- **Localization framework** ✅ — `GameStrings.cs` (Application/Common/) centralizes all German UI strings (building names, finance categories, positions, months, accomplishments). `AddLocalization()` and `UseRequestLocalization()` configured with de/en cultures. Building name inconsistency fixed ("Fitnessstudio" matches original API).

- **Stadium cost tuning** ✅ — `RenameStadiumAsync` now deducts 500€ (was advisory-only). FanShop (180m/level) and Parking (150m/level) maintenance costs added to economy tick via `RecordBuildingCost`.

- **Ladder/ranking validation** ✅ — Added `Played`, `GoalsScored`, `GoalsReceived` to `LadderEntryEntity` (migration `20260312060000_AddLadderGoalTracking`). Match cost (50 GT Stars) deducted in `RunMatchAsync`. `LadderMatchCleanupJob` rewritten with season-end reward distribution (1M→100K by rank) and expired season cleanup.

- **Structured logging & health checks** ✅ — `DatabaseHealthCheck` (Api/Extensions/) verifies SQLite connectivity. JSON structured logging (`AddJsonConsole`) in non-Development. Health endpoint at `/health` returns JSON status.

- **Rate limiting enhancement** ✅ — `GlobalLimiter` (600 req/min per IP) added as fallback for all endpoints. `OnRejected` handler logs warnings with IP/path/policy and returns JSON error.

- **Backup/restore testing** ✅ — `restore-goaltactics.sh` created: decompresses backup, validates integrity + table count, replaces production DB. `test-backup-restore.sh` integration test: creates test DB, runs Python `sqlite3.backup`, gzip round-trip, verifies data consistency and PRAGMA integrity check. All checks pass.

## 4. Deployment checklist (reuse from analysis)

1. Build and publish the API project (`dotnet publish ...`).
2. Stop the `goaltactics-api.service` and `goaltactics-worker.service`.
3. Migrations are applied automatically via `dbContext.Database.Migrate()` at startup.
4. Start the API service (now includes worker jobs for real-time broadcasting).
5. Run smoke tests: health endpoint (`/health`), countries count, fixed features.
6. Run full test suite and verify contract tests against deployed API.

## 5. Risk mitigation and notes

- Document all DB schema changes and keep them additive.
- Maintain a changelog for API contract modifications.
- Use feature flags for any behavioural changes to allow quick rollback.
- Ensure unit/contract tests run in CI with the persisted SQLite DB reset at assembly load.

## 6. Next steps

The following items are recommended for future sprints:

1. **Prometheus metrics export** — Add `/metrics` endpoint with request duration, active connections, match resolution throughput, and bot simulation stats.
2. **Email verification and password reset** — Currently stubs; wire to an SMTP provider.
3. **CI/CD pipeline** — `azure-pipelines.yml` exists but needs test + deploy stages configured.
4. **Bot persistence** — Move bot simulation from in-memory to a separate SQLite database per the `bot_concept_new.md` plan (timezone-based activity schedules, friends/enemies graph, separate schema).
5. **Transfer market enhancements** — Player valuation model, market price history, auction sniping protection.
6. **Replay system** — Store detailed match events for client-side replay (minute-by-minute progression).
7. **Admin dashboard** — Stats overview, player management, manual season control.
8. **Load testing** — Simulate concurrent users to validate rate limiting, SignalR backpressure, and SQLite write throughput.

---
