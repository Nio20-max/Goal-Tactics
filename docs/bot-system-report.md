# Bot System Report

## Overview

The GoalTactics bot simulation system provides AI-controlled teams that populate leagues, trade players, train squads, and participate in all game mechanics. This report documents the architecture, recent improvements, and verification status.

## Architecture

### Core Components

| Component | Role |
|-----------|------|
| `BotRegistry` | Creates the bot population with randomized team profiles, player squads, and starting resources |
| `BotSimulationRunner` | Orchestrates the season loop: matchdays, training ticks, sponsor payouts, construction, promotion/relegation |
| `BotActionScheduler` | Collects intents from all planners and prioritizes them by score |
| `BotActionExecutor` | Executes each intent: modifies bot state, tracks economy, writes log lines |
| `BotHostService` | Entry point that drives the simulation or live-proxy mode |

### Planner System (Intent-Based)

Each planner analyses the bot's current state and the `BotPerceptionSnapshot` and yields scored `BotIntent` objects. The scheduler sorts all intents by score, and the executor processes the top N (configurable via `MaxActionsPerSession`).

| Planner | Intent Type | Purpose |
|---------|-------------|---------|
| `BotLineupPlanner` | `lineup.save` | Prepare lineup before match lock |
| `BotTrainingPlanner` | `training.update` | Train squad, boosting individual player skills |
| `BotScoutingPlanner` | `scouting.standard` / `scouting.premium` | Discover new players |
| `BotTransferPlanner` | `transfer.search` / `transfer.bid` | Complete player transfers |
| `BotFinancePlanner` | `finance.review` / `shop.watch-ad` | Manage economy |
| `BotSponsorPlanner` | `sponsor.accept` / `sponsor.review` | Accept and renew sponsors |
| `BotLadderPlanner` | `ladder.challenge` / `ladder.restore` | Participate in ladder system |
| `BotFriendlyPlanner` | `friendly.invite` | Schedule friendly matches |
| `BotChatPlanner` | `chat.post` | Generate chat messages |
| `BotSkillCardPlanner` | `skillcard.use` | Use skill cards on weakest player before league matches |

### Per-Player Stats

Each bot now maintains a squad of 11 `BotPlayer` objects, each with:
- **14 individual skills** (matching the server's `skill_0` through `skill_13`)
- **Age, Talent, Fitness** attributes
- **Computed Strength** = sum of all 14 skills

Bot team strength is derived from the **average player strength × fitness factor** (80%-100%), ensuring per-player stats drive match outcomes rather than a single team-level integer.

### Skill Cards

Bots receive 1-4 skill cards at initialization. The `BotSkillCardPlanner` triggers usage before league matches, applying the card bonus to the weakest player's weakest skill (+1.5 per card, capped at 20). After each card use:
1. The player's individual skill is boosted
2. The player's strength is recalculated from skills
3. The team's overall strength is recalculated from player averages
4. The card count is decremented

### Match Resolution

Bot league matches use per-player statistics:
1. Home and away strengths are computed from player averages × average fitness factor
2. Score is determined by strength differential + random variance
3. Results update season counters (wins, losses, draws)
4. Stadium income is affected by win/loss record (attendance demand)

### Economy Flow

| Income Source | Description |
|---------------|-------------|
| Stadium tickets | VIP/Sit/Stand seats × tier-based prices, demand-modulated |
| Facility bonuses | Fan shop + parking level bonuses |
| Sponsor payouts | Season + short-term sponsor daily payouts |
| Rewarded ads | Up to 12/day, earning GT Stars |

| Expense | Description |
|---------|-------------|
| Scouting | Standard (money) and premium (stars) |
| Transfer fees | Money-based player acquisition |
| Training camp | Money or stars |
| Individual training | Weekly star cost per player |
| Infrastructure | Office, training center, fan shop, parking, stadium seats |
| Ladder restoration | Star cost to restore stamina |

### League Structure

- **Tier 1**: 1 top league (16 teams)
- **Tier 2**: 5 second-tier leagues (16 teams each)
- **Tier 3**: 15 third-tier leagues (16 teams each)
- **Total**: 336 bot teams (16 × 21 groups)

Promotion/relegation occurs at season end:
- Bottom 5 from Tier 1 → Tier 2
- Top 1 from each Tier 2 group → Tier 1
- Bottom 6 from each Tier 2 group → Tier 3
- Top 2 from each Tier 3 group → Tier 2

## Verification

### Tests

| Test Suite | Status | Tests |
|------------|--------|-------|
| Unit Tests | ✅ Pass | 42/42 |
| Simulation Tests | ✅ Pass | 1/1 (BotSimulationRunner 2-season end-to-end) |
| Contract Tests | ⚠️ 3 pre-existing failures (unrelated to bot system) | 24/27 |

### Simulation Run

The `BotSimulationRunnerTests.RunAsync_Writes_Metrics_For_Two_Seasons` test verifies:
- Bot population creation with per-player stats
- Full 2-season simulation (34 matchdays each)
- Metrics file generation (CSV + JSON)
- Season summary logging
- Promotion/relegation between tiers

### Key Improvements Made

1. **Per-player skills**: Each bot player has 14 individual skills, computed strength, and fitness
2. **Skill card system**: Bots use skill cards strategically before league matches
3. **Training**: Training now improves individual player skills rather than a flat team strength increment
4. **Match resolution**: Uses per-player strength averages with fitness factor instead of flat team strength
5. **Team strength**: Recalculated from player averages after any skill change (training, cards, transfers)

## Configuration

The bot system is configured via command-line arguments:

```
--mode=simulate       # "simulate" for offline, "live" for API proxy
--bot-count=336       # Total bots (auto-calculated from TeamsPerLeague × 21)
--seasons=20          # Number of seasons to simulate
--log-root=/path      # Output directory for logs and metrics
```
