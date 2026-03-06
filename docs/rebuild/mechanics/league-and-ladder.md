# League And Ladder Mechanics (Phase 0)

## Phase 0 Step Log
1. Extracted constants for lineup lock and ladder stamina from decompiled settings.
2. Extracted table sorting logic from decompiled league viewmodel.
3. Combined with known route contracts for ladder challenge and match execution.
4. Confirmed stamina loop behavior with simulation walkthrough assumptions.

## Exact from decompiled logic
- Ladder constants:
  - `LadderStaminaCost = 25`
  - `LadderStaminaMax = 100`
- Lineup lock threshold: `60` minutes before match.
- League ordering: points desc, goal difference desc, strength desc.

## Exact from client/docs
- Ladder flow routes:
  - `GetLadder`
  - `GetLadderChallenge`
  - `RestoreStamina`
  - `RunMatch`
- Ladder challenge response includes `WinPoints`, `LosePoints`, `Stamina`, `StaminaCost`, `MatchCost`.
- League routes expose table, fixtures, and goal-getter outputs.

## Fallback model selected after testing
Pending formulas:
- ladder matchmaking opponent selection
- exact ladder points update function
- season rollover cadence and promotion/demotion batch logic

Candidate ladder points update model:
- on win: `points += WinPoints`
- on loss: `points -= LosePoints`
- stamina consumption per match as returned by challenge payload

Current status:
- stamina constants are exact from decompiled client (`25` per match, `100` max)
- point updates and matchmaking remain server-driven until more match/ladder logs are collected

## Simulated walkthrough
- Team starts with stamina `100`.
- One ladder challenge consumes `25` -> stamina `75`.
- If user restores stamina once (cost endpoint-driven), cap at `100`.

What this accomplishes:
- creates paced repeatable ladder activity with clear premium sink.
