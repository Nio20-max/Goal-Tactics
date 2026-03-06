# Scouting Mechanics (Phase 0)

## Phase 0 Step Log
1. Extracted scouting endpoint contracts and response fields from recovered docs.
2. Pulled cost fields from decompiled DTOs and settings structures.
3. Integrated user-confirmed live values for cooldown and pricing.
4. Marked prospect-generation internals as unresolved formula area.

## Exact from client/docs
- Standard scout cost: `10,000 money`.
- Standard scout cooldown: `12 hours`.
- Premium scout cost: `2,000 stars`.
- Premium scout cooldown: `3 hours`.
- Premium scout speedup cost: `150 stars`.
- Scouting response returns players and next scout timestamps.

## Exact from decompiled logic
- Scouting response includes:
  - `ScoutingCost`
  - `PremiumScoutingCost`
  - `SpeedupCost`
  - `NextScoutingDate`
  - `NextPremiumScoutingDate`
- Legacy costs container includes `YouthCosts`, `YouthBudgetCosts`, `SpecialScoutSpeedupCosts`.

## Fallback model selected after testing
Pending:
- prospect age/talent distribution
- positional rarity weighting
- premium vs standard quality uplift
- no-result probability

Candidate generation model:
1. sample position by team need weight
2. sample age from weighted distribution
3. sample talent from scout-type curve
4. sample base skills with position matrix
5. compute strength and market value

## Simulated walkthrough
Exact timer/cost flow:
- Team starts premium scout at `12:00`.
- Ready at `15:00`.
- Player uses one speedup at `13:40` for `150 stars`.
- Remaining time reduced according to backend speedup rule; immediate refresh expected via scouting endpoint.

What this accomplishes:
- creates a predictable monetized acceleration loop.
- keeps non-paying path viable via standard scout cadence.
