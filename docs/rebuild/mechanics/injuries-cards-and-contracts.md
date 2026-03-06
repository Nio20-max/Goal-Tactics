# Injuries, Cards, And Contracts (Phase 0)

## Phase 0 Step Log
1. Extracted contract endpoints and contract DTO structure from decompiled/new API docs.
2. Collected user-provided live behavior limits for injury and red-card suspension.
3. Noted unresolved server-side pricing formulas and linked to sample collection script.

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

Candidate temporary model:
- injuries sampled from bounded distribution `[1,3]` days
- red card => fixed suspension `1` league game/day
- contract cost baseline proportional to salary and strength with age multiplier

## Simulated walkthrough
Contract trial model example (fallback):
- salary `20,000`
- strength `750`
- age `29`
- base budget renewal = `salary * 6 + strength * 20 = 120,000 + 15,000 = 135,000`
- premium option = budget * 0.75 in stars-equivalent conversion bucket (to be calibrated)

What this accomplishes:
- gives a temporary, testable path while waiting for real samples.
- keeps squad retention economically meaningful.
