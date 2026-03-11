# Bot System Overview

This document explains the design and behaviour of the bot simulation code located under `src/GoalTactics.Bots/`.

## 🧠 Personas & Profiles

Bots are created with one of several *personas* defined in `Profiles/*.cs`. Each persona implements `IBotProfile` and exposes a set of tuning parameters:

| Persona Name           | RiskTolerance | SocialDrive | TransferAppetite | LadderFocus | TrainingDiscipline |
|------------------------|---------------|-------------|------------------|-------------|--------------------|
| NewManagerBot          | 0.25          | 0.45        | 0.30             | 0.35        | 0.70               |
| ConservativeBot        | 0.15          | 0.35        | 0.20             | 0.25        | 0.80               |
| AggressiveTraderBot    | 0.80          | 0.40        | 0.95             | 0.35        | 0.40               |
| YouthFocusedBot        | 0.45          | 0.35        | 0.45             | 0.30        | 0.95               |
| SocialBot              | 0.40          | 0.95        | 0.40             | 0.45        | 0.55               |
| LadderGrinderBot       | 0.65          | 0.30        | 0.35             | 0.95        | 0.70               |

These values are used by various *planners* to bias decision‑making (e.g. SocialBots score chat intents higher).

## 👤 Population Generation

`BotRegistry` builds a deterministic population of clubs. Inputs include:

- `BotOptions.TeamsPerLeague` and `BotCount` for tier/group layout (1 top league, 5 second‑tier, 15 third‑tier).
- A rotating list of nationality/time‑zone values.
- A seeded `Random` instance per‑bot (seed = hash of index+persona) for reproducible starting money, stars, strength, building levels, activity windows, etc.

Every `BotClubProfile` tracks state such as finances, squad strength, facilities, sponsor status and a build queue.

## 🔁 Scheduler & Planners

The heart of behaviour is `BotActionScheduler`, which asks a set of planner services to produce `BotIntent` objects given a `BotClubProfile` and a fresh `BotPerceptionSnapshot` (current money, stars, risks and upcoming events).

Planners live under `Services/` and include:

- `BotLineupPlanner` (pick starters)
- `BotTrainingPlanner` (choose training focus)
- `BotScoutingPlanner` (look for new players)
- `BotTransferPlanner` (search/participate in the market)
- `BotFinancePlanner` (review budgets, watch ads)
- `BotSponsorPlanner` (sign/renew sponsors)
- `BotLadderPlanner` (enter ladders)
- `BotFriendlyPlanner` (schedule friendlies)
- `BotChatPlanner` (post in chat)

Each planner returns zero or more intents, scored and optionally annotated with metadata. Scores are affected by persona constants and snapshot flags (e.g. `HasAuctionExpiringSoon`). The scheduler then orders intents by score and type for execution.

`PlannerUtilities` provides helpers such as `CreateIntent` and a persona multiplier function.

## 📆 Simulation Loop

`BotSimulationRunner` runs a full multi‑season simulation:

1. **Bootstrapping** – create population, start metrics and career trackers, log the initial state.
2. **Season loop** – for each season:
   - Reset counters, assign sponsors, run `RunSeasonAsync`.
   - During each matchday:
     - Advance a `BotWorldClock` to fixed times for training (08:00 UTC), friendlies (13:00) and league matches (18:00).
     - Call `ExecuteBotLoopAsync` with appropriate flags so planners can see what events are due.
     - Resolve matches, apply income, construction progress, training costs, etc.
   - At season end collect metrics, apply transfers to career tracker, track team records, and perform promotion/relegation.
3. **Post‑simulation** – write CSV/JSON logs (metrics, careers, team seasons) via `BotMetricsCollector`, `BotPlayerCareerTracker`, and `BotTeamSeasonTracker`.

Support classes like `BotWorldClock`, `BotLogWriter` and `BotCooldownTracker` assist with timing, logging, and rate‑limiting actions.

## 🔍 Behavioural Differences

All bots share the same overall framework; differences arise from:

1. **Persona parameters** – affect base scores in planners, leading to varied priorities (e.g. TransferAppetite high ⇒ more frequent transfer intents).
2. **Profile‑specific rules** – some planners check for a persona explicitly, e.g. transfer planner gives `baseScore` 0.92 for AggressiveTraderBot.
3. **Random seeds** – initial money/stars/strength differ per club but stay deterministic.
4. **Decision time windows** – `ActiveFromLocal`/`ActiveToLocal` built in registry determine when bots are considered online (not shown above but used elsewhere).

### Examples of persona‑driven differences

- **SocialBot** posts in chat whenever there’s an upcoming match or auction (higher base chat score).
- **AggressiveTraderBot** uses an elevated base score for browsing the transfer market, and participates in late bids more often.
- **ConservativeBot** may skip transfers entirely when low on money.
- **LadderGrinderBot** weights ladder events more heavily and thus enters competitive ladders frequently.
- **YouthFocusedBot** has high training discipline, resulting in more training‑related intents.

## 📄 Output & Tracking

During simulation the bots generate extensive logs and CSV/JSON exports under a configurable root path (often `analysis/…`). These include:

- `simulation-events.log` / `season-summary.log` – chronological trace of key actions.
- Tracked player and team season records for later analysis.
- Metrics such as matches played, goals, auction bids, ads watched, chat messages.

## 🛠 Extension Points

Given the modular design, adding new bot types or planners is straightforward:

1. **New persona** – implement `IBotProfile` and add to `BotRegistry` list.
2. **New planner** – create service with `Plan` method, register in DI and add to `BotActionScheduler` constructor list.
3. **Metrics/behaviour** – use existing helpers or extend `BotMetricsCollector`/`BotActionExecutor`.

Feature flags and `BotOptions` control population size, league structure, sponsor parameters, etc., supporting experimentation and rollouts.

## 📌 Summary

The bot framework simulates a population of club managers with different personalities. Behaviour is driven by a set of small, composable planners whose outputs are ranked and executed by a scheduler. Persona attributes and occasional hard‑coded profile checks yield varied decision-making patterns. The simulation runner advances time, triggers events, collects telemetry, and writes detailed reports, supporting both analytic research and regression testing of gameplay mechanics.

---
*This report is generated automatically based on the source tree in `src/GoalTactics.Bots/`.*
