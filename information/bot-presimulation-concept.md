# Bot Pre-Simulation Concept

## Goal
When resetting the database with bots enabled via `python3 /opt/goaltactics/bin/admin.py`, admins can choose to pre-simulate bot club history so fresh bot teams do not look brand new.

## Entry Point
- During reset (`Reset database (with bots)`), prompt:
  - `Pre-simulate bot teams after reset (fictional team age, stadium growth, trained squad)?`
- If accepted:
  - Wait for bot registration to appear in both DBs.
  - Apply pre-simulation to matched bot teams.

## Data Inputs
- From `bots.db` / `Bots`:
  - `BotId`, `Activity`, `YouthFocus`, `TeamName`
- From `goaltactics.db`:
  - `users`, `teams`, `team_resources`, `team_players`, `league_teams`

## Team Age Model
- Derive fictional age in years from activity plus deterministic noise:
  - `age_years = clamp(0.1, 7.5, 0.15 + 3.6 * activity_norm + U(0, 2.8))`
- Update account timeline:
  - `users.created_at = now - age_years * 365 days`
  - `users.last_login_at` and `users.last_activity_at` move based on activity.

## Stadium / Facilities Model
Rules requested by product are enforced:
- If team is at least 1 year old:
  - Side buildings are set to level 20:
    - office, training center, medical center, youth academy, fan shop, parking
- Seat growth starts after year 1 and is capped:
  - Tier 1 caps: VIP 2,800 / Sit 35,000 / Stand 60,000
  - Tier 2 caps: VIP 2,300 / Sit 28,500 / Stand 48,000
  - Tier 3 caps: VIP 1,900 / Sit 24,000 / Stand 38,000
  - Tier 4+ caps: VIP 1,700 / Sit 20,000 / Stand 30,000
- Additional hard rule:
  - Standing seats never exceed 60,000.

## Squad Generation Model
- Existing non-scouted team players are replaced with a new generated 18-player squad.
- Position mix follows default squad structure:
  - `GK x2, DEF x6, MID x6, FWD x4`
- Age mix depends on team age, activity, and youth focus:
  - High youth focus + high activity => more young players (`17-22`) and higher talents.
  - Older teams still include prime/veteran players (`23-34`).

## Strength Model (Training-Inspired)
- Player strength is projected using the same daily main training gain curve as backend mechanics:
  - age-dependent bonus/penalty from `TrainingProgressService` equivalent.
- A synthetic yearly progression integrates:
  - age
  - talent
  - training center level
  - activity and youth focus
- Realism constraints:
  - Peak caps and age decline limit unrealistic outliers.
  - Final strength clamped to `[48, 97]`.

## Team Metrics Update
After squad generation:
- `teams.strength` updated from best 11 generated strengths.
- `teams.market_value` updated from generated player values.
- `league_teams.strength` synchronized.

## Safety / Robustness
- Deterministic per-team random seed to make runs reproducible.
- If not enough bot teams are registered yet, process waits up to a timeout.
- Summary is printed after pre-simulation:
  - bot count, matched teams, updated teams, skipped teams, players regenerated.

## Test Strategy
Unit tests validate core rules:
- Stadium caps by league tier and global standing max (60,000).
- 1+ year old teams receive level-20 side buildings.
- Training-curve projection produces realistic age behavior.
- High youth focus/activity trends younger squad age profile vs low youth focus.
