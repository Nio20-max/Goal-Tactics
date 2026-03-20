# 2026-03-19 Simulation + Production Readiness Deep Research

## Scope
- Lower confidence threshold and prevent session-collapse behavior.
- Diagnose prior near-zero training gain outcomes.
- Increase and diversify individual training behavior, with priority for freshly scouted players.
- Ensure team training indices follow requested ranges:
  - `mainSkillIndex` in `[0..3]`
  - `subSkillIndex` in `[4..13]`
- Run larger one-season simulations and iterate on issues.
- Continuously scan backend/API behavior while simulations are running.
- Keep API compatibility with legacy app behavior.

## Areas Deep-Checked
- Bot decision gating and session-skip logic.
- Bot training behavior (team training, individual training, scouting interactions).
- Server-side training persistence and skill mapping compatibility.
- API runtime logs (`api.log`, `worker.log`) for 5xx/error-level events during load.
- Contract-level compatibility indicators from `GoalTactics.ContractTests`.
- Bot registration reliability under bulk registration.

## Implemented Fixes (This Iteration)

### 1) Confidence gating lowered and made adaptive
- File: `bots/BotConfig.cs`
  - Default `DecisionConfidenceThreshold` lowered from `0.45` to `0.22`.
- File: `bots/Humanization/BotHumanizationService.cs`
  - Added adaptive threshold with risk-based softening.
  - Added anti-stall fallback: after 3 low-confidence skips, force execution and reset skip streak.

### 2) Team and individual training behavior strengthened and diversified
- File: `bots/Behaviors/TrainingBehavior.cs`
  - Team training now enforces effective requested index ranges and rotates choices by day/personality:
    - main: `[0..3]`
    - sub: `[4..13]`
  - Individual training throughput increased (more targets based on youth focus and plan slots).
  - Freshly scouted player IDs are persisted and prioritized for individual training.
  - Individual skill choice now varies by positional profile and weakest candidate skills.
  - Position handling normalized to support integer position payloads.

### 3) Bot payload/telemetry enrichment for analysis
- File: `bots/ApiClient/ApiModels.cs`
  - Added `SkillIndex` and `SkillType` fields to bot `IndividualTrainingRequest`.
  - Added `Origin` and `Experience` to `PlayerDto` for richer decision heuristics.
- File: `bots/ApiClient/BotApiTranslator.cs`
  - Added `experience` and `origin` to translated squad snapshots.

### 4) Server training compatibility bug fixes
- File: `src/GoalTactics.Infrastructure/Team/TeamDbStore.cs`
  - `SaveTeamTrainingAsync` now allows full sub-skill index range up to `13`.
  - Fixed `TryResolveSkillIndex` mapping to canonical index order (0..13) for individual training.
  - This removes a long-standing mismatch where valid client skill selections could map to the wrong trained stat.

### 5) Bot registration reliability
- File: `bots/BotFactory.cs`
  - Added retry loop (up to 4 attempts) with fresh identity generation when registration is rejected.
  - Addresses dropped bots during mass registration.

### 6) League/training seed defaults aligned with compatibility expectations
- File: `src/GoalTactics.Infrastructure/Authentication/AuthDbStore.cs`
  - Updated seeded team training defaults to requested ranges:
    - main random in `[0..3]`
    - sub random in `[4..13]`
  - Updated tier-1 league defaults:
    - `Mount = 2`
    - `Dismount = 6`

## Runtime Monitoring (During Simulation)
- Checked `api.log` for:
  - `"LogLevel":"Error"|"Critical"`
  - `StatusCode 5xx`
- Checked `worker.log` for error/exception/fail markers.
- Current result during active run: no backend 5xx/error-level entries detected.

## Simulation Runs

### Run A (active during this report)
- Output dir: `/mnt/website/goal_tactics/simulations/bots_client_sim_20260319_072429`
- Config:
  - `bot-count=48`
  - `simulate-seasons=1`
  - `simulate-matchdays=30`
  - audit + snapshots enabled
  - confidence threshold override `0.18`
- Early indicators:
  - Matchday 1: `47/47` successful sessions.
  - No auth failures in observed early data.
  - High training activity already visible (`SaveIndividualTraining`, `GetTeamTraining`, etc.).

## Findings So Far
- Previous near-zero progression was not primarily HTTP instability; it was behavior collapse from confidence gating and low action throughput.
- After confidence/training changes, early sessions show sustained execution and dense training-related endpoint traffic.
- One registration rejection still occurred in Run A, but retry protection has now been implemented for subsequent runs.

## Open TODO (remaining deep-check items)
- Let Run A complete; compute full-season deltas for:
  - session success consistency by matchday,
  - training endpoint volume trend by matchday,
  - player-level strength/experience/skill deltas,
  - fresh-scout training uptake ratio.
- Deploy post-Run-A fixes (`BotFactory`, `AuthDbStore`) and run Run B for validation.
- Re-run compatibility test subset and assess remaining failures:
  - auth endpoint status semantics in tests vs legacy behavior expectations,
  - friends flow stability,
  - squad skill-card seed assumptions.
- Produce final pass/fail matrix for API/frontend compatibility areas that were deeply checked.
