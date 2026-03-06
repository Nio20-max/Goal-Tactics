# Training Mechanics (Phase 0)

## Phase 0 Step Log
1. Extracted training data structures and cost fields from decompiled contracts.
2. Extracted explicit UI upgrade cost formula from squad viewmodel.
3. Identified unresolved server-side growth formulas and marked candidate-model flow.
4. Logged missing samples and requested user data collection support.
5. Added simulation-fitted fallback formulas from `tools/phase0/simulate_phase0_formulas.py`.

## Exact from decompiled logic
- Individual training response fields include `TrainPrice`, `RenewPrice`, `RenewAllPrice`.
- Team training data includes `MainSkillIndex`, `SubSkillIndex`, `BoringDate`, `EfficiencyValue`, `NoTraining`.
- Player upgrade pricing in client is computed as:
  - `UpgradeCost = (UpgradeStrength - CurrentStrength) * 10000`
  - rounded strength difference to 2 decimals.
- Max slider strength uses `max(CurrentStrength, MaxUpgradeStrength)`.

## Exact from client/docs
- Training types: team, tactic, individual, camp.
- Individual renew/cancel/all-renew endpoints exist.
- Training progress endpoint exists per player.

## Fallback model selected after testing
Pending formulas:
- base skill gain per day by training type
- boredom decay around `BoringDate`
- tactic progression curve
- camp multipliers and overlap interaction

Selected fitness fallback (high confidence):
- `daily_fitness_gain = 0.2 * training_center_level`
- capped at `100` total fitness
- matches user evidence: level 20 -> `+4` fitness/day

Provisional non-fitness growth fallback:
- `daily_strength_gain = base_skill_gain * level_factor * age_factor * talent_factor * finesse_factor`
- recommended defaults for simulation:
  - `base_skill_gain = 0.05`
  - `level_factor = 0.6 + 0.02 * training_center_level`
  - `age_factor = max(0.55, 1.05 - max(0, age - 24) * 0.015)`
  - `talent_factor = 0.85 + 0.003 * talent`
  - `finesse_factor = 0.85 + 0.003 * finesse`

This non-fitness model is intentionally marked provisional until we collect day-over-day player strength samples.

Where:
- `efficiency_modifier = EfficiencyValue / 100`
- `boredom_modifier` decays after `BoringDate`

## Simulated walkthrough
Upgrade (exact client formula):
- Current strength: `702.35`
- Target upgrade strength: `703.10`
- Delta: `0.75`
- Upgrade cost: `0.75 * 10000 = 7500 stars`

What this accomplishes:
- linear and transparent star sink for direct upgrades.
- easy to validate between UI and backend because client sends both target strength and computed price.

Fitness walkthrough (selected formula):
- training center level: `20`
- gain/day: `0.2 * 20 = 4`
- if player fitness `92` then next-day fitness becomes `96`
- if player fitness `98` then next-day fitness becomes `100` (cap)

Non-fitness walkthrough (provisional formula):
- age `23`, talent `72`, finesse `68`, training center level `15`
- `level_factor = 0.6 + 0.02*15 = 0.90`
- `age_factor = 1.05`
- `talent_factor = 0.85 + 0.003*72 = 1.066`
- `finesse_factor = 0.85 + 0.003*68 = 1.054`
- `daily_strength_gain = 0.05 * 0.90 * 1.05 * 1.066 * 1.054 = 0.0531`

This remains a calibration model until real server-like progression is fitted against longitudinal samples.
