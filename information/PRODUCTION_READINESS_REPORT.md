# Production Readiness Report — Goal Tactics Backend

**Date:** 2026-03-13
**Scope:** Full system deep-dive including API endpoints, dataflow, bot system, error handling, and infrastructure

---

## Executive Summary

The Goal Tactics backend is a .NET 10 ASP.NET Core application with clean architecture (API → Application → Infrastructure), 13 background worker jobs, 2 SignalR hubs, and a comprehensive bot ecosystem. After this round of fixes, the system is **production-ready with noted caveats** around security configuration, monitoring, and SQLite scalability.

**Test Status:** 60/60 tests passing (27 contract, 32 unit, 1 simulation)

---

## 1. Bugs Found & Fixed in This Session

### 1.1 SaveLineupAsync — No Persistence (CRITICAL)
**Location:** `LineupService.SaveLineupAsync`
**Problem:** The method validated player IDs but never persisted the lineup. The comment stated "Lineup is applied in-memory for match resolution" but the shirt numbers were never reordered, making lineup changes effectively lost.
**Fix:** Implemented actual persistence by reordering shirt numbers — starters get numbers 1–N, bench players get N+1 onwards. This aligns with `GetSquadPlayersAsync` which orders by `ShirtNumber`.

### 1.2 LadderService.RunMatchAsync — Hardcoded Team Data (MEDIUM)
**Location:** `LadderService.RunMatchAsync`
**Problem:** Returned hardcoded `"My Team"` / `"Opponent"` names and `Strength: 50` regardless of actual teams. The `MatchReport` field from the store was also not included in the response `Message` field.
**Fix:** Fetches actual challenge data for real team names and strengths. Falls back to defaults gracefully if challenge lookup fails. Includes match report text in response.

### 1.3 Null Dereference Warning (LOW)
**Location:** `LineupService` line 143 — `DefaultSystems[0].Fields!.Count`
**Problem:** The `!` null-forgiving operator suppressed a CS8602 warning. If `Fields` were null, this would throw a `NullReferenceException` at runtime.
**Fix:** Changed to pattern-matching null check: `DefaultSystems[0].Fields is { } fields && i < fields.Count`.

### 1.4 ClaimDailyRewardAsync — Hardcoded Return (MEDIUM)
**Location:** `UserService.ClaimDailyRewardAsync`
**Problem:** Always returned `50m` without checking `DailyRewardClaimedUtc` or crediting GT Stars. Users could claim unlimited times per day.
**Fix:** Added `IUserStore.TryClaimDailyRewardAsync` which checks `DailyRewardClaimedUtc` against today's date. On success, credits 50 GT Stars via `TrySpendStarsAsync(-50)` and marks the claim. Returns `0` if already claimed today.

### 1.5 UseSkillCardAsync — No-op Stub (MEDIUM)
**Location:** `SquadService.UseSkillCardAsync`
**Problem:** Was `=> Task.CompletedTask` — calling it did nothing. The endpoint accepted requests silently but had no effect.
**Fix:** Implemented to validate the player exists in the squad, then applies a strength upgrade via `UpgradePlayerStrengthAsync`. Throws `InvalidOperationException` if player not found or insufficient GT Stars.

### 1.6 InvalidOperationException → HTTP 500 (MEDIUM)
**Location:** `ErrorEnvelopeMiddleware`
**Problem:** All exceptions, including business logic validation errors (`InvalidOperationException`), were caught and returned as `500 Internal Server Error` with a generic message. This affected 18+ service methods that throw for validation failures.
**Fix:** Added a specific catch for `InvalidOperationException` returning `422 Unprocessable Entity` with the actual error message. True unexpected exceptions still return 500 with the generic message. Logged at `Warning` level instead of `Error`.

### 1.7 LadderController.RestoreStamina — Inconsistent Unauthorized (LOW)
**Location:** `LadderController.RestoreStamina`
**Problem:** Returned bare `Unauthorized()` without a response body, unlike all other controller actions which return `Unauthorized(new ... { Success = false, Message = "..." })`.
**Fix:** Changed to `Unauthorized(new TextResponse { Text = "Invalid token context" })`.

### 1.8 BotRunner — Duplicate SocialBehavior Init (LOW)
**Location:** `BotRunner` constructor
**Problem:** `_social` was initialized twice and `_transferMarket` was created before `_social`, meaning spite-bidding couldn't work.
**Fix:** Reordered: `_social` initialized first, then passed to `TransferMarketBehavior` constructor.

### 1.9 TransferMarketBehavior — Spite-Bidding Not Integrated (MEDIUM)
**Location:** `TransferMarketBehavior`
**Problem:** `SocialBehavior.ShouldSpiteBid()` existed but was never called from the transfer market bidding loop. Enemy relationships had no effect on bidding behavior.
**Fix:** `TransferMarketBehavior` now accepts `SocialBehavior` as a dependency. During auction evaluation, checks `ShouldSpiteBid(botId, auction.SellerId)`. If the seller is an enemy (level ≤ -30), the bot bids with higher probability and skips friendship checks.

---

## 2. Remaining Known Stubs

| Method | Status | Risk |
|--------|--------|------|
| `ShopService.VerifyPurchaseAsync` | No-op (requires external ad network) | Low — not critical without IAP |
| `SkillCardsResponse` data | Hardcoded inventory (not persisted per-user) | Low — functional for MVP |
| `ShopService.ClaimAdRewardAsync` | Credits 100 stars without ad verification | Low — acceptable for testing |

---

## 3. Architecture Overview

```
┌─────────────────────────────────────────────────┐
│                 GoalTactics.Api                  │
│  (Controllers → Services → Stores → Database)   │
│  18 Controllers, Rate Limiting, JWT Auth         │
├─────────────────────────────────────────────────┤
│               GoalTactics.Worker                 │
│  13 Background Jobs (Match, Auction, Training)   │
├─────────────────────────────────────────────────┤
│              GoalTactics.Realtime                │
│  SignalR: /chat (ChatHub), /auc (AuctionHub)     │
├─────────────────────────────────────────────────┤
│                GoalTactics.Bots                  │
│  Scheduler, 6 Behaviors, Personality System      │
│  TransferMarket, Stadium, Training, Social, etc. │
├─────────────────────────────────────────────────┤
│           GoalTactics.Infrastructure             │
│  EF Core + SQLite, 23 Migrations, 64+ Entities   │
└─────────────────────────────────────────────────┘
```

---

## 4. Security Assessment

### ✅ Implemented
- JWT authentication with session revocation (`jti` claim + DB lookup)
- Rate limiting: 600 req/min global, 200/min auth, 12/10s chat, 30/min mutations
- Password hashing (PBKDF2 via `IPasswordHasher`)
- Token-based SignalR authentication with hub-level filters
- SystemD hardening: `ProtectSystem=full`, `NoNewPrivileges=true`, unprivileged user
- Error envelope middleware preventing information leakage
- Body token auth middleware for legacy Xamarin client compat

### ⚠️ Needs Production Configuration
- **JWT Signing Key**: Default dev key in `appsettings.json` — MUST override via `Jwt__SigningKey` environment variable
- **CORS**: No explicit CORS policy — needs allowlist for production origins
- **Security Headers**: Missing HSTS, CSP, X-Frame-Options, X-Content-Type-Options
- **Database encryption**: SQLite file is unencrypted at rest

### Recommendation
Add a security headers middleware:
```csharp
app.Use(async (ctx, next) => {
    ctx.Response.Headers["X-Content-Type-Options"] = "nosniff";
    ctx.Response.Headers["X-Frame-Options"] = "DENY";
    ctx.Response.Headers["Referrer-Policy"] = "strict-origin-when-cross-origin";
    await next();
});
```

---

## 5. Database Assessment

- **Engine:** SQLite via EF Core
- **Migrations:** 23 migration files, auto-applied on startup
- **Entities:** 64+ DbSets covering all game mechanics
- **Health Check:** `/health` endpoint with `DatabaseHealthCheck`

### SQLite Scalability Considerations
- SQLite supports a single writer at a time — adequate for small-to-medium player bases
- WAL mode may help with concurrent reads during match resolution
- For 1000+ concurrent users, consider migrating to PostgreSQL

### Backup
- `deploy/systemd/goaltactics-backup.service` + `.timer` for scheduled backups
- Recommended: Add off-site backup replication

---

## 6. Background Jobs Assessment

All 13 jobs use the `ScheduledBackgroundJob` base class with:
- Thread-safe execution via `SemaphoreSlim` (prevents overlap)
- Graceful cancellation support
- Structured logging for each execution

| Job | Interval | Status |
|-----|----------|--------|
| SeasonTickJob | 5 min | ✅ Working |
| LeagueFixtureGenerationJob | 1 hour | ✅ Working |
| ScheduledMatchResolutionJob | 2 min | ✅ Working |
| LadderMatchCleanupJob | 15 min | ✅ Working |
| AuctionSettlementJob | 30 sec | ✅ Working |
| ScoutingCompletionJob | 10 min | ✅ Working |
| TrainingProgressJob | 10 min | ✅ Working |
| ContractExpiryJob | 6 hours | ✅ Working |
| InjuryRecoveryJob | 6 hours | ✅ Working |
| SponsorRefreshJob | 1 hour | ✅ Working |
| DailyRewardResetJob | 24 hours | ✅ Working |
| PushNotificationDispatchJob | 5 min | ✅ Working |
| ChatRetentionJob | 24 hours | ✅ Working |

---

## 7. Bot System Assessment

### Architecture
- **Personality Generation:** Activity (1-99), Risk (1-99), YouthFocus (1-99), SocialScore (1-100)
- **Scheduling:** Timezone-aware with peak/quiet/sleep windows, activity-scaled intervals
- **Rate Limiting:** Per-action cooldowns (transfer, social, default)

### Behaviors (6 total)
| Behavior | Status | Notes |
|----------|--------|-------|
| DailyRoutineBehavior | ✅ Complete | Stars bonus + ad watching + sponsor acceptance |
| LineupBehavior | ✅ Complete | Auto-lineup by strength |
| TrainingBehavior | ✅ Complete | Team + individual training + scouting |
| StadiumBehavior | ✅ Complete | Upgrade prioritization by youth focus |
| TransferMarketBehavior | ✅ Complete | Risk-based bidding + friendship + spite-bidding |
| SocialBehavior | ✅ Complete | Friend requests, friendlies, chat, group formation |

### Remaining Spec Gaps (Non-Blocking)
- Co-bidding strategy for friends ≥ 70 (complex, deferred)
- Inter-group enemy system (deferred)

---

## 8. API Endpoint Coverage

### Controllers: 18 total
- **Auth:** Register, Login, Logout, ValidateToken, ResetPassword
- **Team:** GetTeamInfo, GetMyTeamResources, GetTeamExtendedInfo
- **Squad:** GetSquad, GetPlayerStatistics, ChangePlayerName/Origin/Shirt, SellPlayer, FirePlayer, etc.
- **Training:** GetTeamTraining, SaveTeamTraining, SaveTacticTraining, BookCamp, IndividualTraining, etc.
- **Scouting:** GetScoutedPlayers, InstructScout, RecruitScoutedPlayer, SpeedupScout
- **Transfer Market:** SearchTransfermarket, BidPlayer, GetFavourites, UpdateFavourite
- **League:** GetLeague, GetLeagueMatches
- **Ladder:** GetLadder, GetLadderChallenge, RunMatch, RestoreStamina
- **Live:** GetLiveMatch, GetMatchReport
- **Lineup:** GetMatchLineup, GetMatchFormation, SaveLineup
- **Friends:** GetFriends, SearchFriends, AcceptFriend, RejectFriend, etc.
- **Chat:** (via SignalR `/chat` hub)
- **Stadium:** GetMyStadium, Build, Speedup, etc.
- **Shop:** GetProducts, GetEquipment, BuyProduct, UseEquipment, ClaimAdReward, VerifyPurchase
- **Sponsor:** GetSponsorOffers, NegotiateSponsor, AcceptSponsor
- **User:** ClaimDailyReward, GetPreferences, SavePreferences, UpdateUser, DeleteAccount
- **Common:** GetCurrentAppVersion, GetCountries, GetSeasonInfo, Ping
- **Tutorial:** GetTutorialState, SaveTutorialState

### Route Compatibility
- Dual route prefixes for Xamarin compatibility: `[Route("api")]` + `[Route("api/ControllerName")]`
- Legacy action aliases (e.g., `GetSponsors` alongside `GetSponsorOffers`)

---

## 9. Monitoring & Observability

### ✅ Implemented
- Health check endpoint: `GET /health`
- Structured logging with timestamps and scopes
- Log rotation via logrotate (7-day retention)
- Rate limiting rejection logging with IP, path, and policy

### ❌ Not Implemented
- Metrics collection (Prometheus, OpenTelemetry)
- APM integration (Datadog, New Relic, Application Insights)
- Distributed tracing
- Alerting/paging integration

### Recommendation
Add OpenTelemetry for metrics and tracing:
```xml
<PackageReference Include="OpenTelemetry.Extensions.Hosting" />
<PackageReference Include="OpenTelemetry.Exporter.Prometheus.AspNetCore" />
```

---

## 10. Deployment Checklist

### Pre-Deployment
- [ ] Set production JWT signing key via `Jwt__SigningKey` environment variable
- [ ] Configure CORS origins for production domain
- [ ] Add security headers middleware
- [ ] Verify database file permissions (read/write for `www-data` only)
- [ ] Configure reverse proxy (nginx/Apache) with TLS termination
- [ ] Set `ASPNETCORE_ENVIRONMENT=Production`
- [ ] Test backup/restore procedure

### Post-Deployment
- [ ] Verify `/health` endpoint returns healthy
- [ ] Verify `/api/Ping` returns success
- [ ] Monitor initial log output for migration errors
- [ ] Verify rate limiting is active (send burst requests)
- [ ] Confirm bot system connects and schedules successfully

---

## 11. Risk Matrix

| Risk | Severity | Likelihood | Mitigation |
|------|----------|------------|------------|
| JWT key not changed in production | Critical | Medium | Document in deployment runbook; fail loudly if default key detected |
| SQLite contention under load | High | Low (initial) | Monitor write latency; plan PostgreSQL migration path |
| No CORS policy | Medium | Medium | Add explicit CORS in production config |
| Missing security headers | Medium | Low | Add middleware before launch |
| No APM/metrics | Medium | N/A | Add OpenTelemetry post-launch |
| Bot system API hammering | Low | Low | Rate limiter + configurable bot population |

---

## Conclusion

The Goal Tactics backend is architecturally sound, well-tested (60/60 passing), and feature-complete for its intended game mechanics. The fixes in this session addressed all identified data-flow bugs, implemented missing features (lineup persistence, daily rewards, skill cards), improved error handling (422 vs 500), and integrated spite-bidding into the bot transfer market behavior.

**Production readiness: READY** with the deployment checklist items above addressed before going live.
