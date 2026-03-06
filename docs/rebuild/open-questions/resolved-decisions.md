# Resolved Decisions And Open Gaps (Phase 0)

## Phase 0 Step Log
1. Captured explicit scope and architecture choices from user Q/A.
2. Logged additional empirical values provided during Phase 0 execution.
3. Recorded remaining unknowns and data requests.
4. Added simulation-driven fallback selections and confidence boundaries.

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
- League-dependent seat earnings and seat caps for upper leagues.
- Auction increment behavior around 5,000,000 threshold.
- Auction time extension rule (reset to 20s when under 20s).
- Injury max 3 days; red-card suspension 1 day.

## Exact from client/docs
- New backend target for rebuild is `/api/*` plus `/chat` and `/auc`.
- Core contract routes for ladder, training, transfer, stadium, contracts, and social are documented and mapped.

## Exact from decompiled logic
- Ladder stamina constants and lineup lock thresholds are extracted and frozen.
- Bid increment boundaries and related constants are extracted and then validated against samples.
- Team-strength and upgrade-cost client formulas are extracted from executable client logic.

## Remaining open gaps
- Match event RNG and score-generation internals are not recovered from client code.
- Training progression samples are still too sparse for high-confidence long-horizon fitting.
- Contract pricing examples still lack direct renewal output values.
- Full attendance/occupancy model still needs more data points despite a tested fallback.

## Data collection action
- Script created: `tools/phase0/collect_formula_samples.py`.
- Output target: `tools/phase0/formula_samples.json`.
- Use this to add match, attendance, training, contract, auction, and injury/card samples for model fitting.

## Fallback model selected after testing
- Frozen/tested for current rebuild baseline:
  - transfer bid increment at 3% with min/max clamps
  - stadium running-cost coefficients and known league seat rates
  - fitness recovery per training center level
  - auction anti-sniping timer reset behavior
- Provisional with explicit caveats:
  - match score generation from strength-delta Poisson model
  - contract renewal pricing curve
  - standing occupancy and non-fitness growth curves

## Phase 0 completion checklist
- [x] Route and transport inventory documented.
- [x] Realtime behavior spec documented.
- [x] Initial mechanics docs with formulas and walkthroughs created.
- [x] Database schema draft created.
- [x] Reference-data plan created.
- [x] Candidate models validated against currently available sample set.
- [x] Unresolved formulas frozen as tested fallback models (with provisional markers where confidence is low).

## Residual risks (post-Phase-0 hardening)
- Increase sample volume for match scoring, training growth, and contract renewals.
- Refit provisional formulas when real backend telemetry becomes available.
