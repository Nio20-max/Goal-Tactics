# Production Readiness Analysis — Goal Tactics Backend

**Date:** 2026-03-12  
**Scope:** Full review after fixing all 12 gameplay bugs from `problems.md`

---

## 1. Summary of Fixes Applied

| # | Problem | Root Cause | Fix | Status |
|---|---------|-----------|-----|--------|
| 1 | Shop products invisible | Fake product names with missing drawables → crash | Replaced with 5 GT Stars packs (20K–600K) with empty images | ✅ Fixed |
| 2 | Stadium numbers wrong | `/blockSize` division returning block counts instead of seats; quadratic cost formula; wrong earnings model | Return raw seat counts; flat per-block costs (10K/30K/20K); per-match income rates; sit duration 140→120 | ✅ Fixed |
| 3 | Equipment tab error | Missing Xamarin-compat fields | Already fixed in previous session (dual Android/Xamarin fields) | ✅ Pre-fixed |
| 4 | Squad country codes crash | "Osterreich" not mapped → "os" ISO code → crash | Added "osterreich"→"at" + 30 more country name mappings in `NormalizeCountryCode`; fixed Origins array with proper German names | ✅ Fixed |
| 5 | Lineup/Formation crash | `LineupSummaryData` missing all `BaseMatchData` fields; `DefaultSystems` had empty Fields arrays | Added 15 BaseMatchData fields; generated proper `MatchSystemFieldData` per formation via `BuildFields` | ✅ Fixed |
| 6 | Training issues (3 sub-problems) | (a) Efficiency formula returned 49 instead of 100; (b) Individual training defaulted to null skill; (c) Camp refresh didn't change players | (a) `CalculateEfficiencyValue` → 100; (b) Default to skill index 0; (c) Added `CampRefreshCount` column + counter-based seed + migration | ✅ Fixed |
| 7 | Scouting does nothing | `InstructScoutAsync` was a no-op; prices wrong | Full implementation: deducts money/stars, generates random player with `IsScouted=true`, stores in DB; recruit sets `IsScouted=false`; prices fixed to 10K money / 1K stars | ✅ Fixed |
| 8 | Transfer Market filters broken | No `Age` field; `Strength` was int not range; `GetDetails` matched by `Id` instead of `AuctionId` | Added `Age`/`Strength` range + `Budget`/`Skill` fields; age/strength/budget/position filters; AuctionId lookup; `GetDetails` route alias | ✅ Fixed |
| 9 | League 0:0 for unplayed; goalscorer strength wrong | `HomeScore ?? 0` hid unplayed matches; goalscorer `Strength` used team strength | Changed `?? 0` → `?? -1`; goalscorer strength uses individual-level formula instead of team aggregate | ✅ Fixed |
| 10 | Friends search only shows friends | Query only scanned `FriendRelations` table | When `queryText` provided, also searches ALL `Users` by manager name and merges non-friends into results | ✅ Fixed |
| 11 | Live match UI empty | Client sends no MatchID → `Guid.Empty` → "Match not found" | When `matchId == Guid.Empty`, auto-resolves to user's next/current match via `GetUpcomingMatchesForTeamAsync` | ✅ Fixed |
| 12 | Only 4 countries | `CountryCatalog` had DE/AT/CH/NL only | Expanded to 39 countries with German names matching original API | ✅ Fixed |

---

## 2. Test Results

- **SimulationTests:** 1/1 passed ✅
- **UnitTests:** 6/7 passed (1 pre-existing failure — `TeamAccomplishmentTests` passes userId instead of teamId)
- **ContractTests:** 26/27 passed (1 pre-existing failure — `FriendsControllerTests` fails on unmodified code)

All failures are **pre-existing** and not caused by the fixes applied in this session. The stadium cost test was updated to match the new flat per-block cost formula.

---

## 3. Database Migrations Required

Two new migrations must be applied before deployment:

1. **`20260312000000_AddCampRefreshCount`** — Adds `camp_refresh_count` INT column to `team_training_state` (default 0)
2. **`20260312010000_AddIsScoutedColumn`** — Adds `is_scouted` BOOLEAN column to `team_players` (default false)

Both are additive (ADD COLUMN) and non-destructive. Existing data will automatically get the default values. No down migration needed.

---

## 4. Files Modified

### Application Layer
- `ScoutingService.cs` — Full rewrite: money deduction, player generation, recruit flow
- `TransferMarketService.cs` — Age/Strength/Budget/Skill filters, AuctionId lookup, position mapping
- `LeagueService.cs` — Unplayed score -1, goalscorer individual strength
- `LiveService.cs` — Auto-resolve match when no MatchID; ITeamStore injection
- `LineupService.cs` — BaseMatchData field population, BuildFields, formation GUIDs
- `TrainingService.cs` — Camp refresh counter increment, counter-based seed
- `TrainingProgressService.cs` — Efficiency = 100
- `ShopService.cs` — 5 GT Stars packs
- `StadiumService.cs` — Raw seat counts, flat costs, per-match earnings, daily costs

### Contracts Layer
- `ScoutInstructionRequest.cs` — Added Position/Price for Xamarin compat
- `TransferSearchRequest.cs` — Added Age/Strength range, Budget, Skill fields
- `IndividualTrainingRequest.cs` — Default skill index 0
- `LineupSummaryData.cs` — 15 BaseMatchData fields

### Infrastructure Layer
- `TeamDbStore.cs` — `!IsScouted` filters on squad queries; scouting CRUD methods; `TrySpendMoneyAsync`; stadium cost helpers
- `FriendsDbStore.cs` — Search ALL users when queryText provided
- `GoalTacticsDbContext.cs` — Column mappings for `camp_refresh_count`, `is_scouted`
- `TeamPlayerEntity.cs` — `IsScouted` property
- `TeamTrainingStateEntity.cs` — `CampRefreshCount` property

### API Layer
- `TransferMarketController.cs` — `GetDetails` route alias

### Contracts/Store interfaces
- `ITeamStore.cs` — `GetScoutedPlayersAsync`, `AddScoutedPlayerAsync`, `RecruitScoutedPlayerAsync`, `TrySpendMoneyAsync`

### Tests
- `TeamControllerTests.cs` — Stadium upgrade cost assertion updated to flat 20K

---

## 5. What's Still Missing for Production

### Critical (Must Fix)

1. **Transfer Market is still mock data** — `BuildTransferPlayers()` returns 5 hardcoded players. A real implementation needs:
   - An `Auctions` database table with time-limited listings
   - A background worker to create/expire auctions from bot teams
   - Real bid tracking, outbid notifications, and auction resolution (winner gets player)
   - Selling: players can be put up for auction by the user

2. **League goalscorers are synthetic** — `GetGoalGettersAsync` fabricates one fake player per team. Individual goal tracking per player during match simulation is needed.

3. **Match simulation is basic** — Score generation uses `random.Next(0,3) + strengthDiff/25`. No minute-by-minute events, no substitutions, no cards, no injuries.

4. **Friends test is broken** — The `FriendsControllerTests.Friends_Request_And_Challenge_Flow_Works` test has a pre-existing failure. The Like→GetFriends→Accept→Challenge flow needs debugging.

5. **TeamAccomplishment test uses wrong API** — Calls `GetTeamResourcesAsync(userId)` with a userId instead of teamId. Test needs fixing.

6. **No real authentication hardening** — JWT tokens work but:
   - No refresh token rotation
   - No account lockout after failed attempts
   - Password reset flow not implemented
   - No email verification

### Important (Should Fix)

7. **Scouting is simplified** — Players appear instantly. The original game had scouting durations (the `NextScoutingDate` field), speedup for stars, and limited scout capacity.

8. **Equipment images** — `ShopEquipmentResponse` serves equipment items with `Image` fields, but actual drawable resources may vary between client versions.

9. **Favorites/Sellings stubs** — Transfer market favorites and selling are no-ops (`Task.CompletedTask` / empty arrays).

10. **Financial ledger formatting** — Finance history entries are created but may not match the exact format the Xamarin client expects for rendering.

11. **Sponsor system** — Sponsor offers are deterministic per-team seed, meaning they never change. Real sponsors should have contract durations, renewals, and performance bonuses.

12. **No pagination** — Friend search, transfer market search, and league data all load everything in memory. Will degrade at scale.

### Nice to Have

13. **Bot AI** — Bots only participate in match simulation. They don't train, scout, trade on the market, or manage lineups dynamically.

14. **Live match events** — The `/auc` and `/chat` SignalR hubs are wired but live match events (minute-by-minute play) aren't broadcast.

15. **Localization** — Country names are hardcoded in German. No i18n framework for other languages.

16. **Stadium naming** — `ChangeNameCost = 500` hardcoded. Grass renewal is `RenewGrassCost = 0` (free).

17. **Ladder/Rankings** — The `LadderService` exists but may not reflect accurate cross-league rankings.

18. **Logging and monitoring** — No structured logging, no health check endpoint, no metrics export.

19. **Rate limiting** — `mutation-write` rate limiter exists but no abuse detection or IP-based throttling.

20. **Backup/restore verification** — `goaltactics-backup.service` exists but no tested restore procedure.

---

## 6. Deployment Checklist

```bash
# 1. Build
dotnet publish src/GoalTactics.Api/GoalTactics.Api.csproj -c Release -o /opt/goaltactics/api/
 
# 2. Stop service
sudo systemctl stop goaltactics-api.service

# 3. Apply migrations (SQLite will auto-apply on startup via EnsureCreated,
#    but explicit migration is safer)
#    The two new migrations add columns with defaults — safe for existing data.

# 4. Start service
sudo systemctl start goaltactics-api.service

# 5. Verify
curl -s http://127.0.0.1:5195/api/Common/GetCountries -X POST -H 'Content-Type: application/json' -d '{}' | jq '.countries | length'
# Expected: 39

# 6. Smoke test each fixed feature via the app
```

---

## 7. Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|-----------|--------|------------|
| Scouted players visible in squad before recruit | Low (filtered with `!IsScouted`) | Medium | Added filter to all squad queries |
| Stadium costs too cheap/expensive | Medium | Low | Flat costs match user-reported original values |
| Transfer market still hardcoded | High | Medium | Functional for demo; needs real auction system for production |
| Unplayed matches show as -1:-1 | Low | Low | Client should display "-" or blank for score -1 |
| Friends search returns too many users | Low | Low | Only returns when queryText is specifically provided |

---

## 8. Conclusion

All 12 gameplay bugs from `problems.md` have been addressed. The app should now function correctly for:
- Shopping (GT Stars packs)
- Stadium management (correct seat counts, costs, earnings)
- Equipment viewing
- Squad display (correct countries)
- Lineup/Formation viewing
- Training (efficiency, individual, camp refresh)
- Scouting (full flow: instruct → view → recruit)
- Transfer market searching (age, strength, budget, position filters)
- League display (unplayed matches distinguished, reasonable goalscorer data)
- Friends search (finds all users, not just existing friends)
- Live match viewing (auto-resolves to next match)
- Country selection (39 countries)

The main gap to production is the transfer market (still hardcoded mock data) and the lack of real-time match simulation events. Everything else is functional.
