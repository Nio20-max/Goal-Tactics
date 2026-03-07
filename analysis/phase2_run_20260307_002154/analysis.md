# Phase 2 Bot Simulation Analysis (Enhanced)

## Run Scope
- Output directory: `/mnt/website/goal_tactics/phase2_run_20260307_002154`
- Seasons: 20
- Population: 96 bots (Tier 1: 16, Tier 2: 32, Tier 3: 48)
- Matchdays per season: 30
- Fixed schedule checks: training 08:00 UTC, friendlies 13:00 UTC, league 18:00 UTC
- Economy constants: bid 200 stars, ad 100 stars
- Sponsor model:
  - Short sponsor: renew every 3 days, pays 200 stars/day
  - Season sponsor: signed at season start, pays 300 stars/day

## Core Metrics (20-Season Average)
- Matches/season: 1,440
- Goals/match: 2.052
- Transfers completed/season: 1,120.55
- Transfer fees paid/season: 222,211,030.65 money
- Season sponsors signed/season: 96.0
- Short sponsor renewals/season: 960.0
- Stars earned/season: 1,445,700
- Stars spent/season: 1,107,890
- Net stars/season: +337,810
- Friendly acceptance rate: 72.9%

## Competition Takeaways
- Throughput is stable and deterministic enough for balancing comparisons.
- Goal output remains in a realistic range with no visible schedule-induced anomalies.

## Sponsor and Star Economy Takeaways
- The new dual sponsor model is being applied exactly and consistently (full season-sign coverage and periodic short renewals).
- Star economy flipped from slight deflation to strong inflation (+337,810/season), driven by high sponsor inflow.
- Ad usage persists but has low relative importance under current sponsor payouts.

## Transfer System Takeaways
- Completed transfer tracking is active and detailed (`transfer-completions.csv`).
- Transfer fee throughput is very high and now dominates money outflow for most personas.
- Current fee formula likely overshoots sustainable club budgets over long horizons.

## Persona Spend Split Takeaways
- Money spend by persona is heavily uneven:
  - `AggressiveTraderBot`: 1,231,265,553 money total
  - `ConservativeBot`: 2,880,830 money total
  - `LadderGrinderBot`: 816,236,109 money total
  - `NewManagerBot`: 799,662,125 money total
  - `SocialBot`: 808,015,950 money total
  - `YouthFocusedBot`: 789,200,046 money total
- Stars spend is more compressed across personas, dominated by ladder restores and bid costs.
- Conservative persona transfer behavior appears under-active relative to all other archetypes.

## Tracked Player Career Takeaways
- Longitudinal tracking is active (`tracked-players.csv`) with per-season age/strength/sale flags.
- Example outcomes from this run:
  - `Luca Weber` (NewManagerBot): sold, ended at age 23 strength 75.
  - `Nils Berger` (YouthFocusedBot): sold early, preserved at age 21 strength 60.
  - `Mateo Costa` (AggressiveTraderBot): sold, age 29 strength 72.
  - `Rene Novak` (SocialBot): sold, age 25 strength 72.
  - `Ivan Rossi` (ConservativeBot): unsold, age 45 strength 74.
- The tracker now provides direct evidence for age-curve and persona-driven career outcomes.

## Validation Against Requested Changes
- Two-sponsor system implemented as specified: passed.
- Completed-transfer tracking (not only bids) with player stats and fee: passed.
- Multi-year tracked players with different ages and manager types: passed.
- Persona-separated spend by money and stars with category splits: passed.

## More Educated Recommendations
1. Reduce sponsor inflation pressure by lowering one payout or adding sponsor churn/eligibility gates.
2. Re-scale transfer fee formula to align with realistic long-run money budgets.
3. Add persona-specific transfer caps so conservative managers still participate without becoming outliers.
4. Extend tracked-player cohort size (10-20 players) and include position/injury context for stronger tuning signals.
5. Add a season-to-season club liquidity KPI (money floor breaches) to detect insolvency drift early.
