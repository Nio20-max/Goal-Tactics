# Bot System Report

## Overview

The GoalTactics production bot system (`bots/`) provides AI-controlled teams that populate leagues, trade players, train squads, and participate in all game mechanics via the live API. Each bot authenticates with the server, executes a sequence of behaviours, and is rescheduled for its next session. This report documents the architecture, recent improvements, and verification status.

## Architecture

### Core Components

| Component | Location | Role |
|-----------|----------|------|
| `Program` | `bots/Program.cs` | CLI entry point — parses arguments and launches `BotRunner` |
| `BotRunner` | `bots/BotRunner.cs` | Main orchestration loop: register → poll scheduler → wake bots → execute behaviours → reschedule |
| `BotFactory` | `bots/BotFactory.cs` | Creates bot accounts via the Register API with unique names, personalities, and credentials |
| `BotScheduler` | `bots/Scheduling/BotScheduler.cs` | Calculates next-wake times based on activity, timezone, and inactivity recovery |
| `BotDatabase` | `bots/Database/BotDatabase.cs` | SQLite persistence for bot credentials, schedules, relationships, and groups |
| `GoalTacticsApiClient` | `bots/ApiClient/GoalTacticsApiClient.cs` | HTTP client wrapping all GoalTactics API endpoints with JWT auth |
| `BotPersonality` | `bots/BotPersonality.cs` | Personality scoring: Activity, Risk, YouthFocus, SocialScore, StarsDaily |

### Behavior System (Priority-Ordered)

Each bot session runs all behaviours in fixed priority order with per-action rate limiting:

| Priority | Behavior | Rate-Limit Group | Purpose |
|----------|----------|-------------------|---------|
| 1 | `DailyRoutineBehavior` | `daily` | Claim daily reward, watch ads for stars, accept best sponsor |
| 2 | `LineupBehavior` | `lineup` | Set match lineups for all unlocked matches, selecting strongest fit players |
| 3 | `TrainingBehavior` | `training` | Team training + individual training for young players + scouting |
| 4 | `SkillCardBehavior` | `skillcard` | Use available skill cards on weakest eligible players |
| 5 | `StadiumBehavior` | `stadium` | Build stadium facilities based on priorities and budget |
| 6 | `TransferMarketBehavior` | `transfer` | Search market and bid on players, respecting friendship levels |
| 7 | `SocialBehavior` | `social` | Send/accept friend requests, chat, manage bot groups |

### Per-Player Stats (API-Driven)

The server returns 14 individual skills per player via `GetSquad`. The production bots now use these per-player stats:

- **`PlayerDto.Skills`**: Array of 14 decimal skill values (`skill_0` through `skill_13`)
- **`PlayerDto.MainSkill`**: Primary skill index for the player's position
- **`PlayerDto.BonusSkills`**: Secondary skill indices for the player's position
- **`PlayerDto.Fitness`**: 0-100 fitness level affecting match performance
- **`PlayerDto.YellowCards`**, **`HasRedCard`**, **`Injured`**: Availability tracking

Server-side, player strength is computed as:
```
strength = (0.55 × mainSkill + 0.25 × bonusAvg + 0.20 × overallAvg) × fitnessFactor × ageFactor × talentFactor
```
where `fitnessFactor = 0.80 + (fitness / 500)`, ranging from 80% to 100%.

Team strength is: `average player strength × fitnessFactor` (average of starting 11 fitness values).

### Lineup Logic

`LineupBehavior` now:
1. **Filters out unavailable players** — injured (`Injured > 0`) or red-carded (`HasRedCard`)
2. Selects the best formation from 6 candidates (4-4-2, 4-3-3, 3-5-2, 4-5-1, 5-3-2, 3-4-3) based on available players by position
3. Picks the 11 strongest eligible players matching the formation
4. Chooses tactic based on Risk personality (>70: Attacking, <30: Defensive, else: Balanced)

### Training Logic

`TrainingBehavior` now:
1. **All bots**: Save team training (main + sub skill selection)
2. **Youth-focused bots** (YouthFocus ≥30): Individual training for young players (age ≤22), prioritising those with the **weakest main skill** and no existing training
3. **Scouting**: Probability scales with youth focus; recruits high-talent players (≥60, or ≥40 for high-focus bots)

### Skill Cards

`SkillCardBehavior`:
1. Fetches available skill cards via `GetSkillCards` API
2. Fetches squad and identifies weakest non-injured, non-red-carded players
3. Applies up to 3 cards per session via `UseSkillCard` API
4. Higher youth-focus bots prefer young, high-talent players

### Transfer Market Logic

`TransferMarketBehavior`:
- Search filters based on youth focus (high: talent 70-100, medium: 50-100, low: no filter)
- Friendship checks prevent overbidding allies (level ≥70: always skip, ≥30: 60% skip)
- Bid budget = money budget + stars budget, with configurable risk factor and minimum reserves

### Social System

`SocialBehavior`:
- Bot-to-bot relationships tracked in SQLite (-100 to +100 friendship levels)
- Groups of up to 5 allied bots (level ≥50)
- Cooperative chat messaging with close friends (level ≥70)
- Spite-bidding mechanics for enemies (level ≤-30)

### Scheduling

`BotScheduler`:
- Next-wake intervals: 5 minutes to 4 hours, inversely proportional to activity
- Timezone-aware peak/quiet/sleep hour multipliers
- Inactivity recovery: pulls bot online sooner after 6+ hours offline
- Urgent scheduling for auction sniping

## Deployment

The production bots run as part of the unified `goaltactics.service` systemd service:

```bash
# Build and deploy
dotnet publish bots/GoalTacticsBots.csproj -c Release -o /opt/goaltactics/bots/

# Run (via goaltactics-wrapper.sh)
/usr/bin/dotnet /opt/goaltactics/bots/GoalTacticsBots.dll \
    --api-url=http://localhost:5195 \
    --db-path=/mnt/website/goal_tactics/data/bots.db \
    --bot-count=900 --max-groups=96 --poll-interval=5
```

## Verification

### Build

Both the main solution and the standalone bots project build successfully:
```
dotnet build GoalTactics.slnx      # Full solution (0 errors, 1 warning)
dotnet build bots/GoalTacticsBots.csproj  # Standalone bots (0 errors, 0 warnings)
```

### Tests

| Test Suite | Status | Tests |
|------------|--------|-------|
| Unit Tests | ✅ Pass | 42/42 |
| Simulation Tests | ✅ Pass | 1/1 |
| Contract Tests | ⚠️ 3 pre-existing failures (unrelated) | 24/27 |

### Key Improvements Made

1. **Per-player skills in API models**: `PlayerDto` now includes `Skills[]`, `MainSkill`, `BonusSkills[]`, `YellowCards`, `HasRedCard`, `Injured`
2. **Skill card support**: New `SkillCardBehavior` + `GetSkillCards`/`UseSkillCard` API methods
3. **Smart lineup**: Filters out injured/red-carded players before formation selection
4. **Targeted training**: Individual training now targets players with the weakest main skill
5. **Rate-limited behaviour**: All 7 behaviours run with configurable per-action cooldowns

## Configuration

```
--api-url       Base URL of the GoalTactics API (default: http://localhost:5000)
--db-path       Path to the SQLite bot database (default: bots.db)
--bot-count     Number of bot accounts to maintain (default: 96)
--max-groups    Maximum bot alliance groups (default: 96)
--poll-interval Seconds between scheduler polls (default: 10)
```
