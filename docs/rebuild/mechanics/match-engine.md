# Match Engine Mechanics (Phase 0)

## Phase 0 Step Log
1. Collected match-related constants and lineup-lock behavior from decompiled settings.
2. Extracted table ordering logic and known strength inputs from decompiled viewmodels.
3. Integrated user-provided real match snapshot with explicit bonus components.
4. Marked unresolved server-only event generation as candidate-model territory.

## Exact from decompiled logic
- Match full-time UI minute constant: `115`.
- Lineup change lock threshold: `60` minutes before kickoff.
- League table ordering logic:
  1. total points desc
  2. goal difference desc
  3. strength desc

## Exact from client/docs
- Match details delivered via `GetMatchDetails` and `Ladder RunMatch` response contracts.
- Match reports and live ticker are server outputs consumed by client.
- Role bonuses and tactic choices are part of lineup payloads.

## Fallback model selected after testing
### Core unresolved formula areas
- chance generation per minute
- conversion from strength delta to goal probability
- card generation rates
- injury generation rates
- event text generation sequence

### Candidate model family to test
Model A (Poisson with strength delta):
- `lambda_home = base_rate * f(delta_strength, home_flag, tactic_effect)`
- `lambda_away = base_rate * f(-delta_strength, away_flag, tactic_effect)`

Model B (per-minute Bernoulli chain):
- each minute produces chance events via weighted random by effective strengths
- chance-to-goal probability modified by set-piece and tactical bonuses

Model C (hybrid expected-goals + event filler):
- compute final goals via xG model then generate coherent event timeline around outcome

Selection rule:
- choose model with best fit against observed score distributions and bonus-impact sensitivity.

## Simulated walkthrough
Input sample:
- Team A effective: `6890.6`
- Team B effective: `6878.0` (illustrative composition from your provided components)
- delta: `+12.6`

If using Model A trial:
- base_rate both teams: `1.2`
- strength_scale: `0.00005`
- `lambda_home = 1.2 + 12.6 * 0.00005 = 1.20063`
- `lambda_away = 1.2 - 12.6 * 0.00005 = 1.19937`

Result tendency:
- near-even game, slight home edge, plausible for 1:0 or 1:1 outcomes.

What this accomplishes:
- keeps simulation sensitive to tactical and role bonuses without producing unrealistic blowouts for small strength deltas.
