# Resolved Decisions And Open Gaps (Phase 0)

## Phase 0 Step Log
1. Captured explicit scope and architecture choices from user Q/A.
2. Logged additional empirical values provided during Phase 0 execution.
3. Recorded remaining unknowns and data requests.

## Resolved decisions
- Rebuild shipped game first; wishlist features are out of current execution phases.
- New backend only (`/api/*`, `/chat`, `/auc`); app will be migrated off legacy `/GameEngine/*`.
- Formula policy:
  - exact extraction first
  - if impossible, candidate-model testing before implementation.
- Bots must participate in gameplay, economy, social features, and public chat.

## User-provided values accepted into Phase 0
- Match strength decomposition sample with additive home/tactic/role bonuses.
- Stadium economics sample and per-unit upgrade effects.
- Auction increment behavior around 5,000,000 threshold.
- Injury max 3 days; red-card suspension 1 day.

## Remaining open gaps
- Match event RNG and score-generation internals are not recovered from client code.
- Training progression samples are missing.
- Contract pricing examples are not yet structured.
- Full attendance league multiplier model still needs more data points.

## Data collection action
- Script created: `tools/phase0/collect_formula_samples.py`.
- Output target: `tools/phase0/formula_samples.json`.
- Use this to add match, attendance, training, contract, auction, and injury/card samples for model fitting.

## Fallback model selected after testing
- Not fully finalized yet; only preliminary candidate formulas are documented in mechanics files.

## Phase 0 completion checklist
- [x] Route and transport inventory documented.
- [x] Realtime behavior spec documented.
- [x] Initial mechanics docs with formulas and walkthroughs created.
- [x] Database schema draft created.
- [x] Reference-data plan created.
- [ ] Candidate models validated against larger sample set.
- [ ] Unresolved formulas frozen as tested fallback models.
