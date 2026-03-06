# Match Engine Mechanics (Phase 0)

## Phase 0 Step Log
1. Collected match-related constants and lineup-lock behavior from decompiled settings.
2. Extracted table ordering logic and known strength inputs from decompiled viewmodels.
3. Integrated user-provided real match snapshot with explicit bonus components.
4. Marked unresolved server-only event generation as candidate-model territory.
5. Ran parameter search in `tools/phase0/simulate_phase0_formulas.py` and selected a provisional fallback.

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

Selected fallback for Phase 0 (provisional):
- `lambda_home = max(0.2, base + scale * (team_a_total - team_b_total) / 100)`
- `lambda_away = max(0.2, base + scale * (team_b_total - team_a_total) / 100)`
- best current grid result from stored samples: `base = 1.00`, `scale = 0.20`

Confidence note:
- sample size is still small, so this remains a fallback for simulator/bot realism, not a claimed exact original formula.

## Simulated walkthrough
Input sample:
- Team A effective: `6890.6`
- Team B effective: `6878.0` (illustrative composition from your provided components)
- delta: `+12.6`

If using selected fallback:
- `base = 1.00`
- `scale = 0.20`
- delta term: `12.6 / 100 = 0.126`
- `lambda_home = 1.00 + 0.20 * 0.126 = 1.0252`
- `lambda_away = 1.00 - 0.20 * 0.126 = 0.9748`

Result tendency:
- near-even game, slight edge to Team A, with most likely outcomes still in low-score bands.

What this accomplishes:
- keeps simulation sensitive to tactical and role bonuses without producing unrealistic blowouts for small strength deltas.
- provides a deterministic and calibratable fallback until larger historical match logs are captured.
