# Bot System Behavior Report

## 1. Overview

The bot system is a **standalone .NET 10 console application** located in `bots/`. It simulates realistic player behavior by calling the real GoalTactics API endpoints via HTTP, just like a human player's client would.

Key characteristics:
- **External client**: Communicates exclusively through HTTP API calls — no internal service references
- **Persistent state**: Maintains its own SQLite database for bot personalities, relationships, schedules, and groups
- **Realistic behavior**: Timezone-aware scheduling, personality-driven decisions, social dynamics
- **Based on**: The bot concept specification in `information/bot_concept_new.md`

The bot system is separate from the existing simulation-based bot system in `src/GoalTactics.Bots/`, which runs offline analytics without calling any API.

---

## 2. Architecture

### Entry Point

```
bots/Program.cs → parses CLI args → creates BotRunner
```

### Component Flow

```
Program.cs
  └── BotRunner (orchestrator)
        ├── BotDatabase (SQLite persistence)
        │     └── 4 tables: Bots, BotRelationships, BotSchedule, BotGroups
        ├── BotFactory (bot creation/registration)
        ├── BotScheduler (wake-up time calculation)
        ├── GoalTacticsApiClient (HTTP client wrapper)
        └── Behaviors/
              ├── TransferMarketBehavior
              ├── StadiumBehavior
              ├── TrainingBehavior
              ├── SocialBehavior
              ├── DailyRoutineBehavior
              └── LineupBehavior
```

### Key Components

| Component | File | Responsibility |
|-----------|------|----------------|
| `BotRunner` | `bots/BotRunner.cs` | Orchestrates: database init → bot registration → scheduler loop → behavior execution |
| `GoalTacticsApiClient` | `bots/ApiClient/GoalTacticsApiClient.cs` | Wraps all HTTP calls to confirmed API endpoints |
| `BotDatabase` | `bots/Database/BotDatabase.cs` | Manages SQLite persistence (4 tables) |
| `BotScheduler` | `bots/Scheduling/BotScheduler.cs` | Calculates wake-up times based on timezone, activity, inactivity recovery |
| `BotFactory` | `bots/BotFactory.cs` | Creates and registers new bot accounts |
| `BotPersonality` | `bots/BotPersonality.cs` | Defines personality traits and generation |
| `BotConfig` | `bots/BotConfig.cs` | CLI configuration and defaults |
| `ApiModels` | `bots/ApiClient/ApiModels.cs` | Request/response DTOs for API communication |

---

## 3. Bot Personality System

Each bot has a unique personality defined by several traits that control all behavioral decisions.

### Activity (1–99)

Controls how frequently the bot comes online. Higher activity = shorter intervals between sessions.

```csharp
// Base interval inversely proportional to activity
double baseMinutes = 240.0 - (bot.Activity / 99.0 * 235.0); // 5-240 minutes
```

- Activity 1: ~240 minutes between sessions (casual player)
- Activity 50: ~120 minutes between sessions
- Activity 99: ~5 minutes between sessions (hardcore player)

### Risk (1–99)

Controls auction aggressiveness in the transfer market. Higher risk = later bids, bigger bid amounts.

```csharp
// Max bid calculation
decimal maxBid = resources.Money * (bot.Risk / 100m) * 0.8m;
maxBid = Math.Min(maxBid, resources.Stars - 1000); // Keep 1000 star reserve
```

- Risk 1–29: Defensive tactic, early bids, conservative spending
- Risk 30–70: Balanced tactic, moderate spending
- Risk 71–99: Attacking tactic, snipe bids, aggressive spending

### YouthFocus (1–99)

Controls priority given to training, scouting, and youth development vs. immediate team performance.

- High youth focus (≥70): Prioritizes training center, scouting, academy; trains youngest players; recruits players with talent ≥40
- Medium youth focus (30–69): Balanced approach; trains 1–3 young players
- Low youth focus (<30): Prioritizes main stadium, seating, VIP; minimal scouting; recruits only talent ≥60

### SocialScore (1–100)

Derived from activity with randomness. Controls frequency and type of social interactions.

```csharp
// Social score derivation
int baseSocial = (int)(activity * 0.6 + rng.Next(1, 41));
```

- High social score: Frequent friend requests, chat messages, challenges
- Low social score: Minimal social interaction

### StarsDaily (0–50,000)

Daily star income from ad watching, calculated at bot creation:

```csharp
int starsDaily = Random(0, 500) * activity;
```

- Activity 1: 0–500 stars/day
- Activity 99: 0–49,500 stars/day

---

## 4. Scheduling System

### Timezone-Based Activity Windows

Each bot is assigned a timezone. Activity probability varies throughout the day:

| Time Window | Description | Probability Factor |
|-------------|-------------|-------------------|
| **22:00–06:00** | Sleep hours | Near 0 (very rare activity) |
| **06:00–08:00** | Morning wake | Low-medium |
| **08:00–16:00** | Quiet hours (work/school) | Reduced probability |
| **16:00–18:00** | Afternoon | Medium |
| **18:00–22:00** | Peak hours | Highest probability |

### Wake-Up Interval Formula

```
nextInterval = baseInterval × timezoneFactor × jitter × inactivityRecovery
```

Where:
- `baseInterval` = 240 − (activity/99 × 235) minutes
- `timezoneFactor` = multiplier based on current hour in bot's timezone
- `jitter` = random factor (0.7–1.3) to prevent synchronized behavior
- `inactivityRecovery` = if offline >6 hours, interval shortened to catch up

### Inactivity Recovery

If a bot has been offline for more than 6 hours, its next interval is shortened to simulate the behavior of a player who "just remembered" to check their game:

```
if (hoursSinceLastActive > 6)
    recoveryFactor = 0.3; // Come back faster
```

### BotSchedule Table

The `BotSchedule` table provides **O(1) lookup** for bots that are due to wake up:

```sql
SELECT * FROM BotSchedule WHERE NextWakeUp <= datetime('now') ORDER BY NextWakeUp;
```

This avoids scanning all bots on every scheduler tick.

---

## 5. Behavior Details

### 5.1 Transfer Market (`Behaviors/TransferMarketBehavior.cs`)

**API Routes:**
- `POST /api/SearchTransfermarket` — Search for available players
- `POST /api/BidPlayer` — Place a bid on a player

**Search Strategy:**
- High youth focus → filters for young talent (age ≤21, high potential)
- Low youth focus → filters for experienced players (high current ability)

**Bidding Logic:**
```csharp
decimal maxBid = resources.Money * (bot.Risk / 100m) * 0.8m;
maxBid = Math.Min(maxBid, resources.Stars - 1000); // Always keep 1000 star reserve
```

**Snipe Behavior:**
- Bid timing probability rises as auction countdown shrinks
- High-risk bots wait until the last moments to bid
- Low-risk bots bid earlier and more conservatively

**Social Constraints:**
- **Friendship check**: Skips auctions where friends (friendship level ≥70) are currently bidding
- **Overbidding penalty**: If bot overbids a friend, friendship decreases by 3 points
- **Spite bidding**: Bots with enemies (friendship ≤-30) may intentionally drive up prices
- **Level ≥30 friendship**: Reduced overbidding chance
- **Level ≥70 friendship**: No overbid, cooperative chat, co-bidding possible

### 5.2 Stadium Building (`Behaviors/StadiumBehavior.cs`)

**API Routes:**
- `POST /api/GetStadium` — Get current stadium state
- `POST /api/BuildStadium` — Build/upgrade a stadium section

**Priority Order (High Youth Focus):**
1. Training Center
2. Scouting Facility
3. Youth Academy
4. Main Stadium
5. Seating
6. VIP Area
7. Standing Places
8. Parking

**Priority Order (Low Youth Focus):**
1. Main Stadium
2. Seating
3. VIP Area
4. Training Center
5. Scouting Facility
6. Youth Academy
7. Standing Places
8. Parking

**Special Rules:**
- Standing places: Only built if all seats are full
- Parking: Always last priority, only if capacity is full

### 5.3 Training & Scouting (`Behaviors/TrainingBehavior.cs`)

**API Routes:**
- `POST /api/GetTeamTraining` — Get current training settings
- `POST /api/SaveTeamTraining` — Set team-wide training
- `POST /api/SaveIndividualTraining` — Set individual player training
- `POST /api/GetScoutedPlayers` — Get scouted player list
- `POST /api/InstructScout` — Send scout to find players
- `POST /api/RecruitScoutedPlayer` — Recruit a scouted player

**Team Training:**
- All bots save team training settings each session

**Individual Training:**
- Youth focus ≥30: Trains 1–3 youngest squad players individually
- Youth focus <30: Skips individual training

**Scouting:**
- Scouting probability = `youthFocus / 100.0`
- Recruitment criteria:
  - Standard: Recruit if talent ≥60
  - High youth focus (≥70): Recruit if talent ≥40 (lower threshold)

### 5.4 Social Behavior (`Behaviors/SocialBehavior.cs`)

**API Routes:**
- `POST /api/GetFriends` — Get friends list
- `POST /api/Accept` — Accept a friend request
- `POST /api/Like` — Send a like/friend request
- `POST /api/SendChallenge` — Challenge another player
- `POST /api/PostChatMessage` — Send a chat message

**Friendship System:**
- Friendship levels range from **-100 to +100**
- Includes human player accounts (bots interact with real players)

| Level | Effect |
|-------|--------|
| ≥70 | No overbid, cooperative chat, co-bidding |
| ≥50 (mutual) | Group formation eligible |
| ≥30 | Reduced overbidding chance |
| 0 | Neutral |
| ≤-30 | Spite bidding behavior |

**Group Formation:**
- Groups form when mutual friendliness ≥50
- Maximum 5 groups per bot
- Groups enable cooperative behavior in auctions and challenges

### 5.5 Daily Routine (`Behaviors/DailyRoutineBehavior.cs`)

**API Routes:**
- `POST /api/ClaimDailyReward` — Claim the daily login reward
- `POST /api/WatchAd` — Watch an advertisement for stars
- `POST /api/GetSponsorOffers` — Get available sponsor offers
- `POST /api/AcceptSponsor` — Accept a sponsor deal

**Execution Order:**
1. **Claim daily reward** — Always first action of the day
2. **Watch ads** for stars:
   ```csharp
   int adsToWatch = Math.Min(Random(0, 500) * activity, 5000); // per session
   ```
3. **Accept best sponsor** — Selects the offer with highest stars/day

### 5.6 Lineup Management (`Behaviors/LineupBehavior.cs`)

**API Routes:**
- `POST /api/GetSquad` — Get current squad
- `POST /api/GetLineups` — Get saved lineups
- `POST /api/SaveLineup` — Save a new lineup

**Formation Selection:**

Based on squad composition analysis:

| Formation | When Selected |
|-----------|--------------|
| 4-4-2 | Default/balanced squad |
| 4-3-3 | Strong attacking options |
| 3-5-2 | Strong midfield |
| 4-5-1 | Defensive with midfield control |
| 5-3-2 | Very defensive |
| 3-4-3 | Very attacking |

**Player Selection:**
- Picks the 11 strongest available players fitting the chosen formation

**Tactic Selection (based on Risk):**
- `risk > 70` → Attacking
- `risk < 30` → Defensive
- `30 ≤ risk ≤ 70` → Balanced

---

## 6. API Endpoints Used

Complete list of every API endpoint called by the bot system:

| Endpoint | HTTP Method | Used In | Purpose |
|----------|-------------|---------|---------|
| `/api/Register` | POST | `BotFactory.cs` | Register new bot account |
| `/api/Login` | POST | `BotRunner.cs` | Authenticate bot session |
| `/api/GetMyResources` | POST | `BotRunner.cs` | Get current stars/money |
| `/api/GetSquad` | POST | `LineupBehavior.cs` | Get squad players |
| `/api/GetLineups` | POST | `LineupBehavior.cs` | Get saved lineups |
| `/api/SaveLineup` | POST | `LineupBehavior.cs` | Save lineup changes |
| `/api/SearchTransfermarket` | POST | `TransferMarketBehavior.cs` | Search for players |
| `/api/BidPlayer` | POST | `TransferMarketBehavior.cs` | Place auction bid |
| `/api/GetTeamTraining` | POST | `TrainingBehavior.cs` | Get training settings |
| `/api/SaveTeamTraining` | POST | `TrainingBehavior.cs` | Set team training |
| `/api/SaveIndividualTraining` | POST | `TrainingBehavior.cs` | Set player training |
| `/api/GetScoutedPlayers` | POST | `TrainingBehavior.cs` | Get scouted players |
| `/api/InstructScout` | POST | `TrainingBehavior.cs` | Send scout |
| `/api/RecruitScoutedPlayer` | POST | `TrainingBehavior.cs` | Recruit scouted player |
| `/api/GetStadium` | POST | `StadiumBehavior.cs` | Get stadium state |
| `/api/BuildStadium` | POST | `StadiumBehavior.cs` | Build/upgrade section |
| `/api/GetFriends` | POST | `SocialBehavior.cs` | Get friends list |
| `/api/Accept` | POST | `SocialBehavior.cs` | Accept friend request |
| `/api/Like` | POST | `SocialBehavior.cs` | Send like/friend request |
| `/api/SendChallenge` | POST | `SocialBehavior.cs` | Challenge a player |
| `/api/PostChatMessage` | POST | `SocialBehavior.cs` | Send chat message |
| `/api/ClaimDailyReward` | POST | `DailyRoutineBehavior.cs` | Claim daily reward |
| `/api/WatchAd` | POST | `DailyRoutineBehavior.cs` | Watch ad for stars |
| `/api/GetSponsorOffers` | POST | `DailyRoutineBehavior.cs` | Get sponsor offers |
| `/api/AcceptSponsor` | POST | `DailyRoutineBehavior.cs` | Accept sponsor deal |

**Total: 25 API endpoints**

---

## 7. Database Schema

The bot system uses its own SQLite database with 4 tables:

### Bots

Stores bot identity and personality traits.

```sql
CREATE TABLE Bots (
    Id              INTEGER PRIMARY KEY AUTOINCREMENT,
    Username        TEXT NOT NULL UNIQUE,
    Email           TEXT NOT NULL UNIQUE,
    Password        TEXT NOT NULL,
    ApiToken        TEXT,
    TeamId          INTEGER,
    Activity        INTEGER NOT NULL,       -- 1-99
    Risk            INTEGER NOT NULL,       -- 1-99
    YouthFocus      INTEGER NOT NULL,       -- 1-99
    SocialScore     INTEGER NOT NULL,       -- 1-100
    StarsDaily      INTEGER NOT NULL,       -- 0-50000
    Timezone        TEXT NOT NULL,
    CreatedAt       TEXT NOT NULL,
    LastActiveAt    TEXT
);
```

### BotRelationships

Tracks friendship/enemy levels between bots and other players.

```sql
CREATE TABLE BotRelationships (
    Id              INTEGER PRIMARY KEY AUTOINCREMENT,
    BotId           INTEGER NOT NULL REFERENCES Bots(Id),
    TargetUserId    INTEGER NOT NULL,
    FriendshipLevel INTEGER NOT NULL DEFAULT 0,  -- -100 to +100
    LastInteraction TEXT,
    UNIQUE(BotId, TargetUserId)
);
```

### BotSchedule

Enables O(1) lookup for bots that need to wake up.

```sql
CREATE TABLE BotSchedule (
    Id              INTEGER PRIMARY KEY AUTOINCREMENT,
    BotId           INTEGER NOT NULL UNIQUE REFERENCES Bots(Id),
    NextWakeUp      TEXT NOT NULL,
    LastWakeUp      TEXT,
    ConsecutiveMisses INTEGER NOT NULL DEFAULT 0
);
```

### BotGroups

Tracks cooperative groups of friendly bots.

```sql
CREATE TABLE BotGroups (
    Id              INTEGER PRIMARY KEY AUTOINCREMENT,
    GroupName       TEXT NOT NULL,
    BotId           INTEGER NOT NULL REFERENCES Bots(Id),
    JoinedAt        TEXT NOT NULL,
    UNIQUE(GroupName, BotId)
);
```

---

## 8. Running the Bot

### CLI Usage

```bash
dotnet run --project bots/GoalTacticsBots.csproj -- \
    --api-url=https://goaltactics.example.com \
    --db-path=./bots.db \
    --bot-count=96
```

### Parameters

| Parameter | Default | Description |
|-----------|---------|-------------|
| `--api-url` | `http://localhost:5000` | Base URL of the GoalTactics API |
| `--db-path` | `./bots.db` | Path to the bot SQLite database |
| `--bot-count` | `96` | Number of bots to create/manage |

### Prerequisites

- .NET 10 SDK
- Running GoalTactics API server
- Network access from bot host to API server

### Typical Deployment

```bash
# Start the API server
dotnet run --project src/GoalTactics.Api/GoalTactics.Api.csproj &

# Start the bot system
dotnet run --project bots/GoalTacticsBots.csproj -- \
    --api-url=http://localhost:5000 \
    --db-path=./bots.db \
    --bot-count=96
```

The bot system will:
1. Initialize the SQLite database
2. Create/register bots up to `--bot-count`
3. Enter the scheduler loop
4. Wake bots based on their schedule and execute behaviors
5. Update schedules and go back to step 3
