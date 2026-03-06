# Training Mechanics (Phase 0)

## Phase 0 Step Log
1. Extracted training data structures and cost fields from decompiled contracts.
2. Extracted explicit UI upgrade cost formula from squad viewmodel.
3. Identified unresolved server-side growth formulas and marked candidate-model flow.
4. Logged missing samples and requested user data collection support.

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

Proposed candidate model skeleton:
`daily_gain = base_gain(skill) * efficiency_modifier * camp_modifier * boredom_modifier`

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

Candidate training test walkthrough (fallback model):
- base gain: `0.08`
- efficiency: `85` -> `0.85`
- camp modifier: `1.10`
- boredom modifier: `0.90`
- gain/day: `0.08 * 0.85 * 1.10 * 0.90 = 0.06732`

This is only a test harness model until real server-like progression is calibrated.
