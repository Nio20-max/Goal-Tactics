# Injuries, Cards, And Contracts (Phase 0)

## Phase 0 Step Log
1. Extracted contract endpoints and contract DTO structure from decompiled/new API docs.
2. Collected user-provided live behavior limits for injury and red-card suspension.
3. Noted unresolved server-side pricing formulas and linked to sample collection script.
4. Added provisional renewal-cost model from `tools/phase0/simulate_phase0_formulas.py`.

## Exact from client/docs
- Contract routes:
  - `GetPlayerContractCost`
  - `ExtendPlayerContract`
- Contract response includes `Resolution` and `Contracts` list with budget/premium options.
- Squad actions include heal player endpoint.
- Player statistics track yellow and red cards.

## Exact from decompiled logic
- Client contract flow is server-price-driven; no local formula for contract price.
- Contract popup can sum costs across multiple players for bulk renew.
- Client sends selected salary and premium flag when extending contract.

## User empirical evidence integrated
- Injury duration observed max: `3 days`.
- Red-card suspension observed: `1 day` (one league game per day cadence).

## Fallback model selected after testing
Pending formulas:
- contract budget/premium cost curve by age, strength, salary
- injury occurrence probability and exact duration distribution
- yellow-card accumulation threshold to suspension

Selected temporary model:
- injuries sampled from bounded distribution `[1,3]` days
- red card => fixed suspension `1` league game/day
- contract cost fallback:
  - `budget_cost = salary * 0.45 + strength * 650 + age_penalty`
  - `age_penalty = max(0, age - 30) * 12000`
  - `premium_cost_stars = round(budget_cost / 55)`

Confidence note:
- contract pricing remains provisional because no direct renewal-price samples are in `tools/phase0/formula_samples.json` yet.

## Simulated walkthrough
Contract trial model example (fallback):
- salary `209,795`
- strength `415.12`
- age `34`
- `age_penalty = (34 - 30) * 12000 = 48,000`
- `budget_cost = 209,795 * 0.45 + 415.12 * 650 + 48,000 = 412,236`
- `premium_cost_stars = round(412,236 / 55) = 7,495`

What this accomplishes:
- gives a temporary, testable path while waiting for real samples.
- keeps squad retention economically meaningful.
