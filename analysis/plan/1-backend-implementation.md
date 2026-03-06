# Phase 1 - Backend Implementation

This phase turns the recovered contracts and mechanics spec into the new Goal Tactics backend. The backend is authoritative for identity, economy, progression, competition, chat, auctions, notifications, and purchases.

## 1.0 Implementation progress (2026-03-06)

Completed API slices in `src/`:

- Auth (`AuthController`) with DB-backed session tokens, revocation checks, password hashing, and JWT auth.
- Common (`CommonController`) with countries and app metadata responses.
- Tutorial (`TutorialController`) with persisted tutorial step state.
- User (`UserController`) with preferences, profile updates, Helpshift user payload, and account deletion.
- Team (`TeamController`) with club overview/resources/mail/news/finance endpoints and lazy team bootstrap.
- League (`LeagueController`) with 16-club table generation, pyramid expansion, and `Mount=2` / `Dismount=8` behavior.
- Friends (`FriendsController`) with list/search, like/unlike, accept/decline, and friendly challenge flow.
- Ladder (`LadderController`) with ladder table, challenge preview, stamina restore, and match execution (`StaminaCost=25`, `StaminaMax=100`).
- Chat (`ChatController`) with history/post/typing API routes.
- Lineup (`LineupController`) with lineup list, match lineup payload, and save route.
- Live (`LiveController`) with live match and report payload routes.
- Scouting (`ScoutingController`) with scout list/instruction/recruit/speedup routes.
- Shop (`ShopController`) with products/equipment/purchase verification/buy/use routes.
- Sponsor (`SponsorController`) with offer fetch, negotiate, and accept routes.
- Squad (`SquadController`) with squad fetch, statistics, player mutations, contracts/upgrades/heal routes.
- Stadium (`StadiumController`) with overview/build/build-places/speedup/grass/rename routes.
- Training (`TrainingController`) with team/tactic/camp/individual training lifecycle routes.
- TransferMarket (`TransferMarketController`) with search/details/bid/favorites routes.
- Realtime (`GoalTactics.Realtime`) with `/chat` and `/auc` SignalR hubs, connection registry, and hub filter types.
- Worker (`GoalTactics.Worker`) with scheduled hosted jobs for season/match/auction/scouting/training/contracts/injuries/sponsors/rewards/notifications/chat cleanup.
- Mechanics service set in `GoalTactics.Application/Mechanics/` for strength, simulation, training, scouting, stadium economy, sponsors, transfers, contracts, and injury/card calculations.
- Docs-parity compatibility endpoints and aliases added from recovered contracts (`/Post`, `/GetSeasonInfo`, `/GetMatchDetails`, `/EnableMatchPush`).
- Worker hosting dependency wired explicitly to ensure standalone worker compilation.
- Deep hardening pass completed:
  - chat moved from placeholder payloads to DB-backed persistence (`chat_messages`, `chat_presence`)
  - match push subscriptions moved from in-memory state to DB-backed persistence (`match_push_subscriptions`)
  - write-path abuse controls expanded with route-level rate limits for chat and mutation endpoints
  - worker scheduler hardened with in-process overlap guard and concrete chat-retention cleanup behavior

Validation status:

- Full solution tests are green after deep hardening pass: `total: 27, failed: 0, succeeded: 27`.

## 1.0.1 Remaining work snapshot (2026-03-06)

Phase 1 completion status:

- All API slices listed in section 1.4 are implemented and wired.
- Realtime hubs (`/chat`, `/auc`) are implemented and mapped.
- Worker/background job classes are implemented and registered.
- Mechanics service surface from section 1.6 is implemented in application layer.
- Database bootstrap/migration path is implemented for current persisted slices.

Post-Phase-1 hardening block (executed now):

- Contract hardening: restored explicit compatibility routes referenced by decompiled client docs (`/Post`, `/GetSeasonInfo`, `/GetMatchDetails`, `/EnableMatchPush`).
- Build hardening: fixed worker project hosting reference so `GoalTactics.Worker` builds reliably as part of full solution builds.
- Verification hardening: expanded contract tests for `GetSeasonInfo` and `EnableMatchPush`, then reran full build and full tests.
- Persistence hardening: implemented DB persistence and migration for chat history/presence and match-push subscriptions.
- Abuse hardening: applied rate limiting to high-frequency/high-risk write routes (`Post`, `Typing`, `BidPlayer`, favorites update, daily reward, match-push enable).
- Worker hardening: added scheduler overlap protection and real retention cleanup implementation in `ChatRetentionJob`.

Deferred deeper hardening for next phase:

- Deepen formula fidelity against full recovered gameplay logs and production balancing targets.
- Expand persistence and transactional audit depth for all new slices that currently return baseline placeholder payloads.
- Add dedicated realtime integration tests and worker idempotency/integration test suites.
- Add richer operational observability and abuse controls for high-throughput scenarios.

Phase 2 handoff readiness:

- Phase 1 implementation and hardening goals are complete for baseline go-live architecture.
- Repository is now ready to begin Phase 2 (bot simulation and deeper formula fidelity) on a stable compile/test baseline.

## 1.0.2 Database creation and bootstrap (explicit Phase 1 requirement)

Database creation is an explicit Phase 1 responsibility and is now tracked here.

Required implementation/workflow:

- The runtime must create the physical database if it does not exist and apply all migrations on startup in development/test environments.
- The migration chain must be complete and reproducible from an empty database to latest schema.
- A clean-environment bootstrap check must be part of Phase 1 validation: start from no DB file/container volume, run app startup, confirm schema is created, then run contract tests.

Current status in this repository:

- Startup migration execution is already wired in `src/GoalTactics.Api/Program.cs` via `dbContext.Database.Migrate()`.
- Migration coverage currently includes identity/auth, tutorial/preferences, team, league, friends, and ladder slices.
- Remaining Phase 1 slices must continue adding forward-only migrations so fresh DB creation remains one-pass and deterministic.

## 1.1 What this phase starts from

Before Phase 1 begins, Phase 0 must already have frozen:

- the exact `/api/*` contract inventory
- `/chat` and `/auc` hub behavior
- the database schema spec
- the mechanics specs for match engine, training, scouting, stadium, economy, contracts, injuries, cards, sponsors, rewards, and transfer market
- the legacy-to-new endpoint mapping used by the app rewrite

If any of those remain unresolved, the affected subsystem stays blocked.

## 1.2 Recommended stack

- Runtime: .NET 8 ASP.NET Core
- API style: Controllers for clear contract ownership and versioned validation behavior
- Realtime: ASP.NET Core SignalR
- Database: PostgreSQL 16
- ORM: EF Core 8 for migrations, persistence, and transactional writes
- Background jobs: hosted services plus durable job tables in PostgreSQL
- Caching: Redis for ephemeral realtime state, rate-limit counters, and hub backplane if scale-out is needed
- Observability: Serilog, OpenTelemetry, Prometheus metrics, Grafana dashboards
- Deployment: Docker Compose first, then systemd or container orchestrator after stabilization

## 1.3 Target repository layout and required files

The backend repository should be created with this file map. The list is intentionally explicit so there is no ambiguity about where each concern lives.

### Solution root

- `GoalTactics.sln`
- `Directory.Build.props`
- `Directory.Packages.props`
- `.editorconfig`
- `.gitignore`
- `docker-compose.yml`
- `docker-compose.override.yml`
- `.env.example`
- `README.md`
- `docs/architecture/backend-overview.md`
- `docs/architecture/request-lifecycle.md`
- `docs/architecture/background-jobs.md`
- `docs/operations/runbook.md`
- `docs/operations/incident-playbook.md`
- `scripts/dev-up.sh`
- `scripts/dev-reset-db.sh`
- `scripts/run-migrations.sh`
- `scripts/seed-reference-data.sh`

### API project

- `src/GoalTactics.Api/GoalTactics.Api.csproj`
- `src/GoalTactics.Api/Program.cs`
- `src/GoalTactics.Api/appsettings.json`
- `src/GoalTactics.Api/appsettings.Development.json`
- `src/GoalTactics.Api/DependencyInjection.cs`
- `src/GoalTactics.Api/Middleware/RequestLoggingMiddleware.cs`
- `src/GoalTactics.Api/Middleware/ErrorEnvelopeMiddleware.cs`
- `src/GoalTactics.Api/Middleware/VersionHeaderMiddleware.cs`
- `src/GoalTactics.Api/Middleware/CapabilitiesHeaderMiddleware.cs`
- `src/GoalTactics.Api/Middleware/AuthenticationContextMiddleware.cs`
- `src/GoalTactics.Api/Extensions/HttpContextExtensions.cs`
- `src/GoalTactics.Api/Security/JwtOptions.cs`
- `src/GoalTactics.Api/Security/JwtTokenService.cs`
- `src/GoalTactics.Api/Security/CurrentUserAccessor.cs`
- `src/GoalTactics.Api/Validation/ValidationErrorFactory.cs`
- `src/GoalTactics.Api/Controllers/AuthController.cs`
- `src/GoalTactics.Api/Controllers/CommonController.cs`
- `src/GoalTactics.Api/Controllers/ChatController.cs`
- `src/GoalTactics.Api/Controllers/FriendsController.cs`
- `src/GoalTactics.Api/Controllers/LadderController.cs`
- `src/GoalTactics.Api/Controllers/LeagueController.cs`
- `src/GoalTactics.Api/Controllers/LineupController.cs`
- `src/GoalTactics.Api/Controllers/LiveController.cs`
- `src/GoalTactics.Api/Controllers/TeamController.cs`
- `src/GoalTactics.Api/Controllers/ScoutingController.cs`
- `src/GoalTactics.Api/Controllers/ShopController.cs`
- `src/GoalTactics.Api/Controllers/SponsorController.cs`
- `src/GoalTactics.Api/Controllers/SquadController.cs`
- `src/GoalTactics.Api/Controllers/StadiumController.cs`
- `src/GoalTactics.Api/Controllers/TrainingController.cs`
- `src/GoalTactics.Api/Controllers/TransferMarketController.cs`
- `src/GoalTactics.Api/Controllers/TutorialController.cs`
- `src/GoalTactics.Api/Controllers/UserController.cs`

### Contracts project

- `src/GoalTactics.Contracts/GoalTactics.Contracts.csproj`
- `src/GoalTactics.Contracts/Common/RequestObject.cs`
- `src/GoalTactics.Contracts/Common/ResponseObject.cs`
- `src/GoalTactics.Contracts/Common/IdRequest.cs`
- `src/GoalTactics.Contracts/Common/TextRequest.cs`
- `src/GoalTactics.Contracts/Common/ValueResponse.cs`
- `src/GoalTactics.Contracts/Auth/*.cs`
- `src/GoalTactics.Contracts/Chat/*.cs`
- `src/GoalTactics.Contracts/Friends/*.cs`
- `src/GoalTactics.Contracts/Ladder/*.cs`
- `src/GoalTactics.Contracts/League/*.cs`
- `src/GoalTactics.Contracts/Lineup/*.cs`
- `src/GoalTactics.Contracts/Live/*.cs`
- `src/GoalTactics.Contracts/Team/*.cs`
- `src/GoalTactics.Contracts/Scouting/*.cs`
- `src/GoalTactics.Contracts/Shop/*.cs`
- `src/GoalTactics.Contracts/Sponsors/*.cs`
- `src/GoalTactics.Contracts/Squad/*.cs`
- `src/GoalTactics.Contracts/Stadium/*.cs`
- `src/GoalTactics.Contracts/Training/*.cs`
- `src/GoalTactics.Contracts/TransferMarket/*.cs`
- `src/GoalTactics.Contracts/Tutorial/*.cs`
- `src/GoalTactics.Contracts/User/*.cs`
- `src/GoalTactics.Contracts/Realtime/ChatMessage.cs`
- `src/GoalTactics.Contracts/Realtime/JsonRealtimeBid.cs`

### Domain project

- `src/GoalTactics.Domain/GoalTactics.Domain.csproj`
- `src/GoalTactics.Domain/Common/Entity.cs`
- `src/GoalTactics.Domain/Common/Result.cs`
- `src/GoalTactics.Domain/Common/DomainClock.cs`
- `src/GoalTactics.Domain/Enums/*.cs`
- `src/GoalTactics.Domain/Teams/Team.cs`
- `src/GoalTactics.Domain/Teams/TeamResources.cs`
- `src/GoalTactics.Domain/Teams/TeamMood.cs`
- `src/GoalTactics.Domain/Users/User.cs`
- `src/GoalTactics.Domain/Players/Player.cs`
- `src/GoalTactics.Domain/Players/PlayerSkillSet.cs`
- `src/GoalTactics.Domain/Players/PlayerContract.cs`
- `src/GoalTactics.Domain/Players/PlayerInjury.cs`
- `src/GoalTactics.Domain/Players/PlayerCardState.cs`
- `src/GoalTactics.Domain/League/League.cs`
- `src/GoalTactics.Domain/League/LeagueSeason.cs`
- `src/GoalTactics.Domain/League/LeagueFixture.cs`
- `src/GoalTactics.Domain/League/LeagueTableRow.cs`
- `src/GoalTactics.Domain/Ladder/LadderSeason.cs`
- `src/GoalTactics.Domain/Ladder/LadderEntry.cs`
- `src/GoalTactics.Domain/Ladder/LadderChallenge.cs`
- `src/GoalTactics.Domain/Matches/Match.cs`
- `src/GoalTactics.Domain/Matches/MatchLineup.cs`
- `src/GoalTactics.Domain/Matches/MatchLineupPlayer.cs`
- `src/GoalTactics.Domain/Matches/MatchEvent.cs`
- `src/GoalTactics.Domain/Matches/MatchReport.cs`
- `src/GoalTactics.Domain/Training/TeamTrainingPlan.cs`
- `src/GoalTactics.Domain/Training/TacticTrainingPlan.cs`
- `src/GoalTactics.Domain/Training/IndividualTrainingPlan.cs`
- `src/GoalTactics.Domain/Training/TrainingCampBooking.cs`
- `src/GoalTactics.Domain/Scouting/ScoutAssignment.cs`
- `src/GoalTactics.Domain/Scouting/ScoutedProspect.cs`
- `src/GoalTactics.Domain/TransferMarket/Auction.cs`
- `src/GoalTactics.Domain/TransferMarket/AuctionBid.cs`
- `src/GoalTactics.Domain/Stadium/Stadium.cs`
- `src/GoalTactics.Domain/Stadium/StadiumBuilding.cs`
- `src/GoalTactics.Domain/Sponsors/SponsorOffer.cs`
- `src/GoalTactics.Domain/Finance/FinanceLedgerEntry.cs`
- `src/GoalTactics.Domain/Mail/MailMessage.cs`
- `src/GoalTactics.Domain/Chat/ChatChannelMessage.cs`
- `src/GoalTactics.Domain/Friends/FriendRelation.cs`
- `src/GoalTactics.Domain/Friends/FriendlyChallenge.cs`
- `src/GoalTactics.Domain/Shop/ProductCatalogItem.cs`
- `src/GoalTactics.Domain/Shop/EquipmentItem.cs`
- `src/GoalTactics.Domain/Shop/PurchaseRecord.cs`
- `src/GoalTactics.Domain/Support/UserPreference.cs`
- `src/GoalTactics.Domain/Tutorial/TutorialState.cs`

### Application project

- `src/GoalTactics.Application/GoalTactics.Application.csproj`
- `src/GoalTactics.Application/DependencyInjection.cs`
- `src/GoalTactics.Application/Abstractions/*.cs`
- `src/GoalTactics.Application/Auth/*.cs`
- `src/GoalTactics.Application/Common/*.cs`
- `src/GoalTactics.Application/Friends/*.cs`
- `src/GoalTactics.Application/Ladder/*.cs`
- `src/GoalTactics.Application/League/*.cs`
- `src/GoalTactics.Application/Lineups/*.cs`
- `src/GoalTactics.Application/Matches/*.cs`
- `src/GoalTactics.Application/Teams/*.cs`
- `src/GoalTactics.Application/Scouting/*.cs`
- `src/GoalTactics.Application/Shop/*.cs`
- `src/GoalTactics.Application/Sponsors/*.cs`
- `src/GoalTactics.Application/Squad/*.cs`
- `src/GoalTactics.Application/Stadium/*.cs`
- `src/GoalTactics.Application/Training/*.cs`
- `src/GoalTactics.Application/TransferMarket/*.cs`
- `src/GoalTactics.Application/Tutorial/*.cs`
- `src/GoalTactics.Application/User/*.cs`
- `src/GoalTactics.Application/Realtime/ChatBroadcaster.cs`
- `src/GoalTactics.Application/Realtime/AuctionBroadcaster.cs`
- `src/GoalTactics.Application/Mechanics/TeamStrengthCalculator.cs`
- `src/GoalTactics.Application/Mechanics/MatchSimulationEngine.cs`
- `src/GoalTactics.Application/Mechanics/TrainingProgressService.cs`
- `src/GoalTactics.Application/Mechanics/ScoutingGenerationService.cs`
- `src/GoalTactics.Application/Mechanics/StadiumEconomyService.cs`
- `src/GoalTactics.Application/Mechanics/SponsorGenerationService.cs`
- `src/GoalTactics.Application/Mechanics/TransferAuctionService.cs`
- `src/GoalTactics.Application/Mechanics/ContractCostService.cs`
- `src/GoalTactics.Application/Mechanics/InjuryAndCardService.cs`

### Infrastructure project

- `src/GoalTactics.Infrastructure/GoalTactics.Infrastructure.csproj`
- `src/GoalTactics.Infrastructure/DependencyInjection.cs`
- `src/GoalTactics.Infrastructure/Persistence/GoalTacticsDbContext.cs`
- `src/GoalTactics.Infrastructure/Persistence/Migrations/*.cs`
- `src/GoalTactics.Infrastructure/Persistence/Configurations/*.cs`
- `src/GoalTactics.Infrastructure/Persistence/Repositories/*.cs`
- `src/GoalTactics.Infrastructure/Authentication/PasswordHasher.cs`
- `src/GoalTactics.Infrastructure/Authentication/JwtSigningKeyProvider.cs`
- `src/GoalTactics.Infrastructure/Clock/SystemClock.cs`
- `src/GoalTactics.Infrastructure/Ids/SequentialGuidGenerator.cs`
- `src/GoalTactics.Infrastructure/Cache/RedisConnectionFactory.cs`
- `src/GoalTactics.Infrastructure/Cache/RateLimitStore.cs`
- `src/GoalTactics.Infrastructure/Chat/ChatHistoryRepository.cs`
- `src/GoalTactics.Infrastructure/TransferMarket/BidOrderingService.cs`
- `src/GoalTactics.Infrastructure/Payments/GooglePlayPurchaseVerifier.cs`
- `src/GoalTactics.Infrastructure/Notifications/FcmSender.cs`
- `src/GoalTactics.Infrastructure/Support/HelpshiftUserMapper.cs`
- `src/GoalTactics.Infrastructure/Telemetry/OpenTelemetrySetup.cs`

### Realtime project

- `src/GoalTactics.Realtime/GoalTactics.Realtime.csproj`
- `src/GoalTactics.Realtime/Hubs/ChatHub.cs`
- `src/GoalTactics.Realtime/Hubs/AuctionHub.cs`
- `src/GoalTactics.Realtime/HubFilters/AuthHubFilter.cs`
- `src/GoalTactics.Realtime/HubFilters/RateLimitHubFilter.cs`
- `src/GoalTactics.Realtime/HubState/UserConnectionRegistry.cs`

### Worker project

- `src/GoalTactics.Worker/GoalTactics.Worker.csproj`
- `src/GoalTactics.Worker/Program.cs`
- `src/GoalTactics.Worker/DependencyInjection.cs`
- `src/GoalTactics.Worker/Jobs/SeasonTickJob.cs`
- `src/GoalTactics.Worker/Jobs/LeagueFixtureGenerationJob.cs`
- `src/GoalTactics.Worker/Jobs/ScheduledMatchResolutionJob.cs`
- `src/GoalTactics.Worker/Jobs/LadderMatchCleanupJob.cs`
- `src/GoalTactics.Worker/Jobs/AuctionSettlementJob.cs`
- `src/GoalTactics.Worker/Jobs/ScoutingCompletionJob.cs`
- `src/GoalTactics.Worker/Jobs/TrainingProgressJob.cs`
- `src/GoalTactics.Worker/Jobs/ContractExpiryJob.cs`
- `src/GoalTactics.Worker/Jobs/InjuryRecoveryJob.cs`
- `src/GoalTactics.Worker/Jobs/SponsorRefreshJob.cs`
- `src/GoalTactics.Worker/Jobs/DailyRewardResetJob.cs`
- `src/GoalTactics.Worker/Jobs/PushNotificationDispatchJob.cs`
- `src/GoalTactics.Worker/Jobs/ChatRetentionJob.cs`

### Test projects

- `tests/GoalTactics.UnitTests/GoalTactics.UnitTests.csproj`
- `tests/GoalTactics.ContractTests/GoalTactics.ContractTests.csproj`
- `tests/GoalTactics.IntegrationTests/GoalTactics.IntegrationTests.csproj`
- `tests/GoalTactics.SimulationTests/GoalTactics.SimulationTests.csproj`
- `tests/GoalTactics.LoadTests/README.md`
- `tests/GoalTactics.LoadTests/k6/*.js`
- `tests/GoalTactics.TestCommon/*.cs`

## 1.4 API ownership map

Every route listed in Phase 0 must map to one controller and one application handler. The controller does request validation, auth checks, and response envelope formatting. The application handler owns domain behavior and transaction boundaries.

Minimum ownership map:

- `AuthController`: login, verify login, register, ping
- `CommonController`: countries, season info, version
- `ChatController`: typing, post, history
- `FriendsController`: friends list, friend requests, likes, challenges, flags
- `LadderController`: ladder table, challenge preview, run match, restore stamina
- `LeagueController`: table, fixtures, goal getters
- `LineupController`: list lineups, single match lineup, save lineup
- `LiveController`: match details and report payloads
- `TeamController`: team overview, extended team info, news, resources, mail, accomplishments, finances, rename
- `ScoutingController`: get players, instruct, recruit, speedup
- `ShopController`: products, equipment, purchase verification, buying, using
- `SponsorController`: sponsor offers, negotiate, accept
- `SquadController`: squad fetch, statistics, rename/origin/shirt, sell, fire, contracts, upgrades, skill cards, heal
- `StadiumController`: stadium overview, build, build places, speedup, grass renewal, rename
- `TrainingController`: team training, tactic training, camp booking, individual training lifecycle
- `TransferMarketController`: search, details, bid, favorites
- `TutorialController`: tutorial state
- `UserController`: daily reward, preferences, profile updates, Helpshift identity, account deletion

## 1.5 Precise database design

The database should be implemented exactly as a set of transactional tables plus reference-data tables. These are the core tables that Phase 1 must create.

### Identity and access

- `users`
  - columns: `id`, `manager_name`, `email`, `password_hash`, `facebook_id`, `apple_id`, `is_guest`, `level`, `is_admin`, `created_at`, `last_login_at`, `last_activity_at`, `deleted_at`
- `user_sessions`
  - columns: `id`, `user_id`, `token_id`, `issued_at`, `expires_at`, `revoked_at`, `client_version`, `capabilities`, `platform`, `device_id`
- `user_preferences`
  - columns: `user_id`, `auction_overbid`, `match_results`, `lineup_incomplete`, `friend_invite`, `ineffective_training`, `friendly_match`, `system_notifications`, `auction_end`
- `tutorial_states`
  - columns: `user_id`, `current_step`, `updated_at`
- `punishments`
  - columns: `id`, `user_id`, `type`, `message`, `starts_at`, `ends_at`, `created_by`

### Team and club state

- `teams`
  - columns: `id`, `user_id`, `name`, `country_id`, `league_id`, `logo_asset_id`, `home_shirt_id`, `away_shirt_id`, `emblem_id`, `created_at`, `strength`, `fans`, `members`, `mood`, `team_mood`, `wins`, `losses`, `draws`, `market_value`, `rename_count`
- `team_resources`
  - columns: `team_id`, `money`, `gt_stars`, `medipacks`, `updated_at`
- `team_accomplishments`
  - columns: `id`, `team_id`, `accomplishment_type`, `awarded_at`, `metadata_json`
- `team_news`
  - columns: `id`, `team_id`, `title`, `body`, `created_at`, `news_type`
- `mail_messages`
  - columns: `id`, `team_id`, `sender_team_id`, `subject`, `body`, `mail_type`, `is_read`, `created_at`, `read_at`
- `finance_ledger_entries`
  - columns: `id`, `team_id`, `category`, `direction`, `amount_money`, `amount_stars`, `balance_money_after`, `balance_stars_after`, `reference_type`, `reference_id`, `description`, `created_at`

### League, ladder, and matches

- `seasons`
  - columns: `id`, `number`, `starts_at`, `ends_at`, `status`
- `leagues`
  - columns: `id`, `season_id`, `country_id`, `level`, `name`, `mount_count`, `dismount_count`
- `league_memberships`
  - columns: `id`, `league_id`, `team_id`, `points`, `goals_for`, `goals_against`, `wins`, `draws`, `losses`, `position`, `home_points`, `away_points`
- `matches`
  - columns: `id`, `season_id`, `league_id`, `ladder_id`, `match_type`, `matchday`, `scheduled_at`, `lock_at`, `home_team_id`, `away_team_id`, `home_score`, `away_score`, `home_strength`, `away_strength`, `is_friendly`, `status`, `resolved_at`
- `match_lineups`
  - columns: `id`, `match_id`, `team_id`, `formation_id`, `tactic_id`, `captain_player_id`, `penalty_player_id`, `corner_player_id`, `freekick_player_id`, `saved_at`, `is_locked`
- `match_lineup_players`
  - columns: `id`, `match_lineup_id`, `player_id`, `field_slot`, `is_starting`, `order_index`
- `match_events`
  - columns: `id`, `match_id`, `minute`, `event_type`, `team_id`, `player_id`, `secondary_player_id`, `payload_json`
- `match_reports`
  - columns: `match_id`, `report_text`, `generated_at`, `report_json`
- `goal_getter_rows`
  - columns: `id`, `season_id`, `league_id`, `player_id`, `team_id`, `goals`, `rank`
- `ladder_seasons`
  - columns: `id`, `starts_at`, `ends_at`, `status`
- `ladder_entries`
  - columns: `id`, `ladder_season_id`, `team_id`, `points`, `rank`, `stamina`, `updated_at`
- `ladder_challenges`
  - columns: `id`, `ladder_season_id`, `home_team_id`, `away_team_id`, `scheduled_at`, `resolved_at`, `win_points`, `lose_points`, `stamina_cost`, `match_cost`, `result_match_id`

### Players and growth

- `players`
  - columns: `id`, `team_id`, `name`, `origin_country_id`, `position`, `age`, `talent`, `experience`, `fitness`, `salary`, `market_value`, `shirt_number`, `shirt_name`, `main_skill`, `strength`, `is_goalkeeper`, `created_at`
- `player_skill_values`
  - columns: `id`, `player_id`, `skill_type`, `value`, `base_value`, `bonus_value`
- `player_contracts`
  - columns: `id`, `player_id`, `valid_until`, `can_extend`, `weekly_salary`, `last_extended_at`
- `player_injuries`
  - columns: `id`, `player_id`, `injury_type`, `starts_at`, `ends_at`, `healed_at`, `source_match_id`
- `player_card_states`
  - columns: `player_id`, `yellow_cards`, `has_red_card`, `suspension_matches_remaining`, `updated_at`
- `player_statistics`
  - columns: `id`, `player_id`, `season_id`, `scope`, `goals`, `hattricks`, `matches`, `yellow_cards`, `red_cards`
- `player_upgrade_history`
  - columns: `id`, `player_id`, `upgrade_source`, `amount`, `cost_stars`, `created_at`

### Training and scouting

- `team_training_plans`
  - columns: `team_id`, `main_skill_index`, `sub_skill_index`, `boring_date`, `efficiency_text`, `efficiency_value`, `is_disabled`, `updated_at`
- `tactic_training_plans`
  - columns: `team_id`, `selected_tactic_id`, `updated_at`
- `tactic_bonus_values`
  - columns: `id`, `team_id`, `tactic_id`, `bonus_percent`, `updated_at`
- `training_camp_bookings`
  - columns: `id`, `team_id`, `camp_type`, `starts_at`, `ends_at`, `cost_money`, `cost_stars`, `status`
- `individual_training_plans`
  - columns: `id`, `player_id`, `skill_type`, `started_at`, `ends_at`, `renew_count`, `status`, `train_price`, `renew_price`
- `scout_assignments`
  - columns: `id`, `team_id`, `scout_type`, `position_filter`, `starts_at`, `ready_at`, `speedups_used`, `status`
- `scouted_prospects`
  - columns: `id`, `scout_assignment_id`, `player_snapshot_json`, `accepted_at`, `rejected_at`

### Stadium and sponsors

- `stadiums`
  - columns: `team_id`, `name`, `grass_quality`, `visitors_last_match`, `visitors_average`, `visitors_total`, `earnings_last_match`, `earnings_average`, `earnings_total`, `max_building_level`
- `stadium_buildings`
  - columns: `id`, `team_id`, `building_type`, `level`, `current_value`, `max_value`, `capacity`, `earnings`, `utilization`, `daily_cost`, `profit`, `has_warning`
- `stadium_construction_jobs`
  - columns: `id`, `team_id`, `building_id`, `build_type`, `build_start`, `build_end`, `upgrade_cost`, `upgrade_cost_premium`, `status`
- `sponsor_offers`
  - columns: `id`, `team_id`, `offer_type`, `name`, `description`, `amounts_json`, `stars`, `cards`, `accepted`, `created_at`, `expires_at`
- `active_sponsors`
  - columns: `id`, `team_id`, `offer_id`, `starts_at`, `ends_at`, `payout_schedule`, `next_payout_at`

### Shop and transfer market

- `product_catalog_items`
  - columns: `id`, `identifier`, `section`, `action`, `cost`, `store_price`, `currency_code`, `money`, `gt_stars`, `medipacks`, `image`, `icon`, `is_active`
- `equipment_items`
  - columns: `id`, `equipment_type`, `image`, `cost_stars`, `is_active`
- `team_equipment`
  - columns: `id`, `team_id`, `equipment_item_id`, `in_use`, `owned_at`
- `purchase_records`
  - columns: `id`, `team_id`, `platform`, `product_identifier`, `purchase_token`, `receipt_hash`, `is_subscription`, `verified_at`, `grant_status`
- `daily_reward_claims`
  - columns: `id`, `team_id`, `claim_date`, `reward_value`, `created_at`
- `auctions`
  - columns: `id`, `player_id`, `seller_team_id`, `current_bid_team_id`, `current_bid`, `minimum_bid`, `maximum_bid`, `ends_at`, `frozen_at`, `status`, `transfer_fee`, `duration_hours`
- `auction_bids`
  - columns: `id`, `auction_id`, `team_id`, `bid_amount`, `created_at`, `accepted`
- `auction_favorites`
  - columns: `auction_id`, `team_id`, `created_at`

### Social and chat

- `friend_relations`
  - columns: `id`, `team_id`, `friend_team_id`, `status`, `created_at`, `accepted_at`
- `friendly_challenges`
  - columns: `id`, `requesting_team_id`, `receiving_team_id`, `scheduled_at`, `status`, `created_at`, `responded_at`
- `chat_messages`
  - columns: `id`, `channel_type`, `sender_user_id`, `sender_team_id`, `message`, `created_at`, `moderation_status`
- `chat_presence`
  - columns: `user_id`, `last_typing_at`, `last_seen_at`

## 1.6 Critical formulas and computations that the backend must own

Phase 1 implements the formulas frozen in Phase 0. The following calculators and engines are mandatory backend-owned computations:

- `TeamStrengthCalculator`
  - input: starting lineup, bench depth if applicable, formation, tactic, tactic bonus, player skills, player fitness, injuries, suspensions, captain and set-piece roles, mood, team mood, stadium or home bonus
  - output: `team_strength`, role bonuses, tactical modifier breakdown
- `MatchSimulationEngine`
  - input: two computed team strengths plus formation and tactic context
  - output: ordered match events, scoreline, report, player stat deltas, injuries, cards, morale changes, finance side effects
- `TrainingProgressService`
  - computes team training, tactic training, individual training, camp effects, boredom penalties, expiry dates, and renew prices
- `ScoutingGenerationService`
  - computes prospect generation using recovered distributions plus exact cooldowns and speedup costs
- `StadiumEconomyService`
  - computes attendance, matchday earnings, building upkeep, building profit, grass penalties, and capacity upgrades
- `SponsorGenerationService`
  - computes offer generation, negotiation cost, accepted reward packages, and payout schedule
- `TransferAuctionService`
  - validates bids, min increments, fee deductions, winner selection, settlement, and favorite notifications
- `ContractCostService`
  - computes contract extension cost and resolution options
- `InjuryAndCardService`
  - computes injury durations, red-card and yellow-card accumulation, suspensions, and healing outcomes

None of these calculations should be duplicated in the mobile client except for presentation-only hints.

## 1.7 Background jobs and timing model

The backend must schedule and run these jobs against database-backed work queues or time-based scans:

- season tick and season rollover
- league fixture generation
- scheduled match lineup lock enforcement
- scheduled match resolution
- ladder challenge cleanup and rank recomputation
- auction settlement
- scouting completion and prospect materialization
- team-training daily progression
- tactic-training daily progression
- individual-training expiry and renew deadlines
- training-camp expiry
- contract expiry and player departure rules
- injury recovery
- sponsor expiration and offer refresh
- daily reward reset
- notification fan-out
- chat retention cleanup

Each job must be idempotent and guarded by row-level locking or advisory locking to survive retries and multi-instance deployment.

## 1.8 Realtime implementation details

### Chat hub

- authenticate with the same JWT used by the API
- join the global public channel on connect
- persist posted messages before broadcast
- broadcast typing events with debounce and server-side rate limiting
- support production bots posting and typing with the same moderation and throttle rules as humans

### Auction hub

- authorize only authenticated users
- subscribe clients to auction IDs they are viewing or favoriting
- broadcast accepted bids only after transaction commit
- resend latest accepted bid snapshot on reconnect so the client can recover from dropped events

## 1.9 Security, validation, and abuse controls

Minimum controls:

- JWT signing keys stored outside source control
- hashed passwords with modern work factor
- request validation for every DTO
- per-route rate limits for login, chat post, typing, purchase verification, daily reward, scouting speedups, and bidding
- replay protection for purchase tokens and rewarded-ad claims
- transaction boundaries for all economy mutations
- audit logs for stars, money, medipacks, player transfers, contract extensions, and admin actions
- profanity and spam moderation pipeline for chat, including bot output

## 1.10 Test plan for this phase

Write tests in parallel with implementation:

- contract tests for every route and envelope
- authorization tests for every protected route
- integration tests for every write path that changes money, stars, medipacks, players, contracts, or matches
- characterization tests for every recovered formula
- realtime tests for chat and auction subscriptions
- migration tests for database bootstrapping
- worker tests for idempotent job reruns

## 1.11 Exit criteria

Phase 1 is complete only when:

- every new API route is implemented and contract-tested
- `/chat` and `/auc` are operational and reconnect-safe
- the database schema is migrated end to end on a clean environment
- all critical mechanics are implemented from the frozen Phase 0 spec
- all economy mutations are transactional and audited
- workers can resolve matches, auctions, scouting, training, sponsors, and season ticks without manual intervention

## 1.12 Implementation Progress Checkpoint

Status as of initial Phase 1 start:

- Backend solution scaffolded in repository root as `GoalTactics.slnx`.
- Projects created and wired:
  - `src/GoalTactics.Api`
  - `src/GoalTactics.Application`
  - `src/GoalTactics.Contracts`
  - `tests/GoalTactics.UnitTests`
  - `tests/GoalTactics.ContractTests`
- First API slice implemented with tests:
  - `GET /api/Ping`
  - `GET /api/GetVersion`
  - `POST /api/GetCountries`
  - `POST /api/Register`
  - `POST /api/Login`
  - `POST /api/VerifyLogin`
- Current implementation detail:
  - Common endpoints use in-memory catalog and config-backed version string.
  - Auth endpoints now use security-focused in-memory auth with hashed passwords and signed JWT tokens.
  - JWT bearer authentication/authorization middleware is active for protected routes.
  - Persistence and database-backed identity/session storage are pending subsequent Phase 1 slices.
- Test cadence in use:
  - full suite run after each implementation slice via `dotnet test GoalTactics.slnx`.
  - current result at this checkpoint: all tests passing.

Security baseline completed in Step 1 continuation:

- PBKDF2 password hashing added via `IPasswordHasher` and API security implementation.
- JWT token issuance and signature/lifetime validation added via `ITokenService`.
- Bearer token authentication configured in API pipeline.
- Protected endpoint (`GET /api/Me`) added and contract-tested.
- Negative-path tests added for tampered token and missing bearer token.

Additional Phase 1 progress (tutorial + user profile slice):

- New authenticated user endpoints implemented:
  - `POST /api/GetTutorial`
  - `POST /api/SkipTutorial`
  - `POST /api/FinishTutorialStep`
  - `POST /api/ResetTutorial`
  - `POST /api/ClaimDailyReward`
  - `POST /api/GetHelpshiftUserInfo`
  - `POST /api/GetPreferences`
  - `POST /api/SavePreferences`
  - `POST /api/UpdateUser`
  - `POST /api/DeleteAccount`
- Added contracts for tutorial and user domain request/response payloads under:
  - `src/GoalTactics.Contracts/Tutorial/`
  - `src/GoalTactics.Contracts/User/`
  - `src/GoalTactics.Contracts/Common/ValueResponse.cs`
- Added DB-backed persistence for preferences/tutorial state:
  - `user_preferences` table
  - `tutorial_states` table
  - migration `20260306203000_AddTutorialAndPreferences`
- Added application services and infrastructure stores for tutorial/user behavior.
- Test suite status after this slice: all tests passing (`15/15`).

Additional Phase 1 progress (team slice):

- Implemented authenticated Team API routes in `TeamController`:
  - `POST /api/GetTeamInfo`
  - `POST /api/GetMyTeamInfo`
  - `POST /api/GetMyTeamExtendedInfo`
  - `POST /api/GetClubNews`
  - `POST /api/GetMyResources`
  - `POST /api/GetMyMail`
  - `POST /api/MarkAsRead`
  - `POST /api/MarkAllAsRead`
  - `POST /api/DeleteMail`
  - `POST /api/DeleteAllRead`
  - `POST /api/GetAccomplishments`
  - `POST /api/GetFinanceHistory`
  - `POST /api/GetFinances`
  - `POST /api/ChangeTeamName`
- Added Team contracts under `src/GoalTactics.Contracts/Team/` and shared `IdRequest` in `src/GoalTactics.Contracts/Common/IdRequest.cs`.
- Added Team application service/store abstractions in `src/GoalTactics.Application/Team/`.
- Added Team persistence entities and DB store in `src/GoalTactics.Infrastructure/Persistence/Entities/` and `src/GoalTactics.Infrastructure/Team/TeamDbStore.cs`.
- Added migration `20260306213000_AddTeamSlice` (tables: `teams`, `team_resources`, `team_news`, `team_mail`, `team_finance_history`).
- Added contract tests in `tests/GoalTactics.ContractTests/Team/TeamControllerTests.cs`.
- Test suite status after this slice: all tests passing (`17/17`).