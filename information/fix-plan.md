# Fix Plan — Xamarin Client Compatibility & Feature Gaps

## Root Cause

All C# response contracts were refactored to match the **new Android** Kotlin models (simplified field names, fewer fields, different types). However, the **old Xamarin client** — the only app currently in use — still expects the original field names, types, and nested structures. The backend now returns responses the Xamarin app cannot deserialize correctly, causing blank screens, crashes, and broken features.

### Fix Strategy

For **every** contract, the response must include **both** the old Xamarin fields **and** the new Android fields. JSON serializers on both clients ignore unknown keys, so dual-format responses are safe. This is the same approach that fixed the Sponsors loading-screen blocker.

---

## 1. Squad — Shows Nothing

**Symptom**: Squad screen shows nothing (no crash).

**Root cause**: `SquadPlayerData` changed types that break Xamarin deserialization.

| Field | Old (Xamarin) | New (Android) | JSON difference |
|-------|--------------|---------------|-----------------|
| `Injured` | `int` (0/1) | `bool` | `0` vs `false` |
| `Strength` | `decimal` | `double` | Serialization identical for whole numbers but Xamarin may expect decimal-precision JSON |
| `Experience` | `decimal` | `int` | `167.0` vs `167` |
| `Fitness` | `decimal` | `double` | Usually identical |
| `Salary` | `decimal` | `long` | Identical in JSON for integer values |
| `Skills` | `decimal[]` | `double[]` | Identical in JSON |

**Fix** (files):
- `src/GoalTactics.Contracts/Squad/SquadPlayerData.cs` — Revert `Injured` back to `int` (Xamarin needs 0/1 integer), OR add a dual field `InjuredDays` (int) alongside `Injured` (bool). The simplest fix: keep `Injured` as `bool` but add `public int InjuredDays => Injured ? 1 : 0;` for backward compat.  
  Actually the safest approach: change `Injured` back to `int` in the contract. The Android app expects `bool` but Gson will coerce `0`→`false` and `1`→`true`, so `int` works for both.
- `src/GoalTactics.Application/Squad/SquadService.cs` — Change `Injured = false` back to `Injured = 0`.
- Also consider: `Experience` must be `decimal` (not `int`) in the contract so Xamarin gets `167.0` format. Or make it dual: keep `int Experience` and add `decimal ExperienceValue`.

**Also affects**: Viewing another club's squad crashes (same `SquadPlayerData` contract).

---

## 2. Lineup — Crashes

**Symptom**: Game crashes when opening Lineup.

**Root cause**: `MatchLineupPlayerData` was drastically simplified. The Xamarin client expects it to **inherit from `SquadPlayerData`** (full player data + per-position strengths).

| Old (Xamarin) | New (Android) |
|---------------|---------------|
| All `SquadPlayerData` fields + `List<PositionStrength>` | Just `PlayerId`, `Name`, `Position`, `IsStarting` |
| `List<MatchSystemData>` Systems | `List<string>` Systems |
| `TacticData[]` Tactics | `string[]` Tactics |
| `MatchFormationData` + `HomeShirt` + bonus fields | Removed |

**Fix** (files):
- `src/GoalTactics.Contracts/Lineup/MatchLineupPlayerData.cs` — **Restore inheritance** from `SquadPlayerData` and re-add `List<PositionStrength>`. Also keep `PlayerId`, `Name`, `Position`, `IsStarting` for Android compat.
- `src/GoalTactics.Contracts/Lineup/MatchLineupResponse.cs` — Restore `IReadOnlyList<MatchSystemData> Systems`, `TacticData[] Tactics`, `MatchFormationData? FormationData`, `HomeShirt`, `CaptainBonus`, `PenaltyBonus`, `CornerBonus`, `FreekickBonus`. Keep the string-based alternatives for Android.
- `src/GoalTactics.Application/Lineup/LineupService.cs` — Populate both old detailed fields and new simple fields.

---

## 3. Training — Won't Load (Infinite Loading)

**Symptom**: Training screen stays on loading spinner forever.

**Root cause**: Likely the Xamarin client fails to parse the training response. `TrainingPlayerData.Skills` changed from `decimal[]` to `double[]` but this should serialize identically. Need to check if the client also reads `players` top-level (which doesn't exist — the response has `individualTraining.players`). 

**Investigation needed**: The training response structure (`teamTraining`, `tacticTraining`, `trainingCamp`, `individualTraining`) appears correct. The issue may be that `TrainingPlayerData` inherits `SquadPlayerData`, and the `SquadPlayerData` type changes (see Squad fix above: `Injured` bool→int) break deserialization of training player data too.

**Fix**:
- Fix `SquadPlayerData` types first (see Squad section) — this will cascade to `TrainingPlayerData`.
- Also ensure `TrainingPlayerData.Skills` uses `decimal[]` (Xamarin type) or verify `double[]` doesn't break.
- Also: the starting of individual training doesn't work — check that `SaveIndividualTraining` endpoint correctly accepts the Xamarin request format (sends `SkillIndex` + `PlayerID` fields, which the `IndividualTrainingRequest` already handles via `ResolvedPlayerId` and `ResolvedSkillType`).

**Files**: `src/GoalTactics.Contracts/Squad/SquadPlayerData.cs`, `src/GoalTactics.Contracts/Training/TeamTrainingResponse.cs`, `src/GoalTactics.Application/Training/TrainingService.cs`

---

## 4. Scouting — Instruct Endpoint 404 + Wrong Prices

**Symptom**: Clicking "Instruct" gives an error; scout prices are wrong.

**Root cause (404)**: Xamarin app calls `POST /api/Scouting/Instruct`. Nginx catch-all strips prefix → `/api/Instruct`. But the backend endpoint is named `InstructScout` (not `Instruct`).

**Fix (route)**: Add nginx rewrite rule:
```nginx
rewrite ^/api/Scouting/Instruct$ /api/InstructScout break;
```
Add this BEFORE the catch-all rewrite in `/etc/nginx/sites-enabled/gt.nikolai-linschmann.de` under `location /api/`.

**Fix (prices)**: Check `ScoutingService.cs` — verify `ScoutingCost`, `PremiumScoutingCost`, `SpeedupCost` values match what the Xamarin app expects. These should likely be:
- Regular scouting: free or low cost
- Premium scouting: paid in Stars  
- Speedup: paid in Stars

**Files**: nginx config, `src/GoalTactics.Application/Scouting/ScoutingService.cs`

---

## 5. Transfermarket — Search Filters Wrong + Player Details Don't Load

**Symptom**: Filtering by age/talent/strength/position shows wrong players. Clicking a player to view details shows nothing.

### 5a. Search filters

**Root cause**: `TransferMarketService.SearchAsync` only filters on `MinimumBid`, `Strength`, and `OnlyKeeper`. The Xamarin app sends `Talent` (range), `SkillIndex`, and position-based filters that are ignored.

**Fix**: Add filtering for:
- `Talent` (RangeValue with Min/Max)
- Position (needs a `Position` field in `TransferSearchRequest`, or decode from `SkillIndex`)
- Age range (add `Age` RangeValue to request model)

**Files**: `src/GoalTactics.Application/TransferMarket/TransferMarketService.cs`, `src/GoalTactics.Contracts/TransferMarket/TransferSearchRequest.cs`

### 5b. Player details don't load

**Root cause**: `TransferPlayerData` was simplified from 15+ fields to 6 fields. The Xamarin detail view expects: `ID` (not `Id`), `Country`, `Head`, `Talent`, `Age`, `AuctionId`, `IsFrozen`, `BidTeamName`, `BidTeamLogo`, `Bid`, etc.

**Fix**: Restore all old `TransferPlayerData` fields alongside the new ones. The service must populate both:

| Restore field | Source |
|--------------|--------|
| `ID` | Same as `Id` (Xamarin uses uppercase `ID`) |
| `Country`, `Head`, `Talent`, `Age` | From the player entity |
| `AuctionId` | From the auction entity |
| `IsFrozen`, `BidTeamName`, `BidTeamLogo`, `Bid` | From bid state |

**Files**: `src/GoalTactics.Contracts/TransferMarket/TransferPlayerData.cs`, `src/GoalTactics.Application/TransferMarket/TransferMarketService.cs`

---

## 6. Stadium — Crashes on Build + Level 0 Can't Upgrade

**Symptom**: Building seats crashes. Level-0 buildings can't upgrade to level 1.

**Root cause (crash)**: `StadiumResponse` moved `Name`, `GrassQuality`, `Capacity`, `EarningsAverage` into a nested `StadiumData` object. The Xamarin client expects these at the top level.

**Fix (format)**: In `StadiumResponse.cs`, restore the flat fields (`Name`, `GrassQuality`, `Capacity`, `EarningsAverage`) AS WELL AS the nested `StadiumData`. In `StadiumService.cs`, populate both.

**Root cause (level 0)**: Check `StadiumService.BuildAsync` — there may be a guard that prevents building from level 0 (e.g., `if (currentLevel < 1`) or a cost formula that produces 0 or negative for level 0. The cost formula `4000 + (level² × 1250)` at level 0 = 4000, which should work. Check the store for off-by-one errors.

**Root cause (seat building crash)**: Stadium seat blocks are stored as absolute seat counts. When building, the conversion between "block level" and "seat count" may fail. Check `StadiumService.BuildStadiumAsync` for integer overflow or division-by-zero with block sizes.

**Upgrade times**: Already implemented correctly (30 min → 50 hours, linear).

**Files**: `src/GoalTactics.Contracts/Stadium/StadiumResponse.cs`, `src/GoalTactics.Application/Stadium/StadiumService.cs`, `src/GoalTactics.Infrastructure/Stadium/StadiumDbStore.cs`

---

## 7. Equipment — Nothing Shown

**Symptom**: No trikots/emblems displayed.

**Root cause**: `ShopEquipmentResponse` changed from `Shirts`/`Emblems`/`MyShirts`/`MyEmblems` (4 lists) to single `Equipment` list. Xamarin reads the old field names and gets `null`.

Also: `EquipmentData` changed from `Image`/`Cost`/`InUse` to `Name`/`CostStars`.

**Fix**:
- Restore `Shirts`, `Emblems`, `MyShirts`, `MyEmblems` fields in `ShopEquipmentResponse.cs` (keep `Equipment` for Android).
- Restore `Image`, `Cost`, `InUse` in `EquipmentData.cs` (keep `Name`, `CostStars` for Android).
- In `ShopService.cs`, populate both old and new fields.

**Files**: `src/GoalTactics.Contracts/Shop/ShopEquipmentResponse.cs`, `src/GoalTactics.Contracts/Shop/EquipmentData.cs`, `src/GoalTactics.Application/Shop/ShopService.cs`

---

## 8. Shop / Ads — Nothing Loads

**Symptom**: Shop and ads don't load.

**Root cause (products)**: `ShopProductData` changed from `Identifier`/`Image`/`Money`/`Medipacks`/`GTStars` to `Id`/`Name`/`Category`/`Price`. Xamarin can't parse.

**Fix**: Restore old fields in `ShopProductData.cs` alongside new ones. In `ShopService.cs`, populate both. 

**Ads**: The `WatchAd`/`ClaimAdReward` endpoint exists but may not return the right format. The Xamarin app expects ads to be marked as "available." Check what the Xamarin client checks to decide if ads are available, and ensure the response includes that flag.

**Medi Packs**: Add a product to the shop: 1000 Stars for 1 Medi Pack, with declining prices for bulk.

**Files**: `src/GoalTactics.Contracts/Shop/ShopProductData.cs`, `src/GoalTactics.Application/Shop/ShopService.cs`

---

## 9. Friends — Search Doesn't Work

**Symptom**: Searching for friends returns nothing.

**Root cause**: The `FriendData` contract was simplified. Xamarin expects: `UserName`, `TeamName`, `Country`, `TeamLogo`, `Strength`, `LastActivity`, `Language`, `MyLike`, `LikesMe`, `TeamId`, `ChallengeId`, `ChallengeStatus`. Current response has different fields (`Id`, `ForeignUserId`, `ForeignTeamId`, `Name`, `IsFriend`, etc.).

The search itself (`GetFriends` with `SearchRequest.Text`) likely works but the Xamarin app can't display results due to missing field names.

**Fix**: Restore all old `FriendData` fields, keep new ones.

Also: `ChallengeData` was similarly stripped — restore `Date`, `HomeLogo`, `AwayLogo`, `HomeName`, `AwayName`, `MyTeam`, `HomeCountry`, `AwayCountry`, `HomeScore`, `AwayScore`, `OpponentTeamId`, `IsAccepted`, `IsDeclined`, `MatchId`, etc.

**Files**: `src/GoalTactics.Contracts/Friends/FriendData.cs`, `src/GoalTactics.Contracts/Friends/ChallengeData.cs`, `src/GoalTactics.Application/Friends/FriendsService.cs`

---

## 10. Live — Shows "Waiting for Match"

**Symptom**: Live match shows waiting message, no match details.

**Root cause**: `LiveMatchResponse` changed from `MatchData? Match` (team-shared type with many fields) to `LiveMatchData? Match` (new slim type). The old `MatchData` included fields like `HomeCountry`, `AwayCountry`, `HomeStrength`, `AwayStrength`, `HomeTrikot`, `AwayTrikot`, `HasLineup`, `IsFriendly` etc. Also, `Report` was at response level but is now inside `Match`.

Also: if no league matches exist yet (matches not being simulated daily), there's nothing to show.

**Fix**:
- Restore `LiveMatchData` to include all fields from the old `MatchData` type: HomeCountry, AwayCountry, HomeScore, AwayScore, HomeStrength, AwayStrength, HasLineup, HomeTrikot, AwayTrikot, IsFriendly.  
- Keep `Report` at both response level and inside `Match`.
- Ensure league matches are being generated and simulated so there are results to show.

**Files**: `src/GoalTactics.Contracts/Live/LiveMatchResponse.cs`, `src/GoalTactics.Application/Live/LiveService.cs`

---

## 11. Inbox — No Emails

**Symptom**: Shows that there are no emails.

**Root cause**: Likely no mail records exist in the database. The mail service returns an empty list because no game events (training reports, match results, transfer outcomes) are generating inbox messages.

**Fix**: Implement mail generation:
- Training reports should generate daily mail entries (see pattern in `information/original_API_requests/logs/`) 
- Match results should create result mails
- Transfer outcomes should create notification mails

**Files**: Add mail generation logic to worker or event handlers.

---

## 12. Accomplishments — No Trophies

**Symptom**: Shows no trophies.

**Root cause**: No accomplishment records exist. Accomplishments should be awarded for season achievements (league champion, top goalscorer).

**Fix**: Implement accomplishment generation after season ends:
- "Meisterschaft" + league name + season number for first place
- "Torschützenkönig" + player name + season number for top scorer
- Format: `"name": "Torschützenkönig{0}Robert Lewandowski{0}Saison #116"` with `{0}` as separator
- Images: `"02.png"` for top scorer, `"04.png"` for championship

**Files**: League result processing service, accomplishments store.

---

## 13. Finances — No Transactions

**Symptom**: Finance tab shows no transactions.

**Root cause**: No transaction records are being saved. Every money/star spending event (training camp, scouting, stadium building, transfers, etc.) should create a finance record with date, amount, and category.

**Fix**: Add transaction logging to all money-changing operations. The finance endpoint already exists; it just needs data.

**Files**: `src/GoalTactics.Application/Team/TeamService.cs` (or wherever money is spent), finance store.

---

## 14. League — Player Strengths Over 700

**Symptom**: Some players have strength over 700. Cap should be 700.

**Fix**: Add strength capping in player creation and strength calculation:
```csharp
strength = Math.Min(strength, 700);
```

**Files**: `src/GoalTactics.Application/Squad/SquadService.cs`, player generation logic, `TeamStrengthCalculator`.

---

## 15. GT Ladder — Match Cost 1000 → 50

**Symptom**: Ladder match costs 1000 energy instead of 50.

**Root cause**: `LadderDbStore.cs` line 15: `private const int MatchCost = 1000;`

**Fix**: Change to `private const int MatchCost = 50;`

**File**: `src/GoalTactics.Infrastructure/Ladder/LadderDbStore.cs`

---

## 16. Ladder — LadderTeamData Format

**Root cause**: `LadderTeamData` fields changed:
- `Name` → removed (was `string`)
- `Logo` → `TeamLogo` 
- `Country` → removed
- `Strength` → type changed from `decimal` to `int`
- `Played`, `GoalsScored`, `GoalsReceived` → removed
- New: `TeamName`, `Rank`

**Fix**: Restore old fields alongside new ones.

**File**: `src/GoalTactics.Contracts/Ladder/LadderTeamData.cs`, `src/GoalTactics.Application/Ladder/LadderService.cs`

---

## Priority Order

1. **Squad** (blocks Squad, Training, Lineup, Scouting, Transfermarket — all use `SquadPlayerData`)
2. **Scouting nginx rewrite** (one-line config fix for 404)
3. **Lineup** (restore full player data + formation fields)
4. **Transfermarket** (restore detailed player data + add search filters)
5. **Stadium** (restore flat fields + fix level 0 upgrade)
6. **Equipment / Shop** (restore old field names)
7. **Friends** (restore old field names)
8. **Live** (restore match detail fields)
9. **Ladder cost** (one-line constant change)
10. **Ladder contract** (restore old fields)
11. **League strength cap** (add Math.Min)
12. **Inbox / Accomplishments / Finances** (data generation — larger feature work)
