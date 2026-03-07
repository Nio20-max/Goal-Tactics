# Phase 2 Bot Simulation Analysis (Training Rework)

## Scope and Method
- Run directory: `/mnt/website/goal_tactics/phase2_run_20260307_074420`
- Seasons: 20
- Population: 96 bots (16 teams per league, pyramid 1/2/3 groups)
- Schedule validation: training 08:00 UTC, friendlies 13:00 UTC, league 18:00 UTC
- Training rework inputs came from decompiled clues and your constraints:
  - `Talent` range confirmed as `1..10` in decompiled core (`TransferMarketViewModel` and criteria constants).
  - Training camp model confirms `PriceEuro`, `PriceStars`, `Power`, and premium booking flow.
  - Team training uses `MainSkillIndex` + `SubSkillIndex` and efficiency status.
  - Individual training uses star spend via `TrainPrice` + renew flows.

## Core KPI Results
- Avg matches/season: 1,440
- Avg goals/match: 2.055
- Avg bids/season: 1,179.60
- Avg transfers completed/season: 1,112.05
- Avg transfer fees paid/season: 368,430,232 money
- Avg ads watched/season: 295.70
- Avg chat posts/season: 3,773.80
- Friendly acceptance rate: 64.6%
- Avg sponsors accepted/season: 10.95
- Avg ladder challenges/season: 6,911.50
- Avg stars spent/season: 1,229,095
- Avg stars earned/season: 1,469,570
- Net stars/season: +240,475

## Training Rework Validation
- Aging is now seasonal and active in tracked-player history.
- Talent is modeled only from 1 to 10.
- New transfer players are generated around the requested baseline (strength centered around low 60s to low 70s with elite variance).
- Strength cap is enforced at 700.
- Main+sub training structure is implemented and age/talent/training-center sensitive.
- Individual training is modeled as weekly star investment per player and gives stronger focused gains.
- Training camp is modeled as 7-day boost with money/stars booking options and daily effect.

## Tracked Players (Sorted by Player)
- Output: `tracked-players.csv` sorted by `player_id` then season.
- Tracked cohort expanded to 13 players across personas and starting ages.
- Daily gains for young high-talent players are now in the intended range (many seasons near ~1.1/day on active setups).
- At least one tracked trajectory reached 500+ strength:
  - Max observed: `504.740` (`P-19-NEW-02`, season 20).
- This confirms the new model can produce 500+ for top-talent long-horizon development while keeping the 700 cap difficult.

## Transfers (Sorted by Price)
- Output: `transfer-completions.csv` sorted by fee descending.
- Transfer records now include richer player stats:
  - age, talent, fitness, strength, potential, fee.
- Top fees cluster around high-talent/high-potential profiles, which aligns with expected market valuation behavior.

## Tracked Teams (Sorted by Team)
- Output: `tracked-teams.csv` sorted by team name then season.
- Tracks per team and season:
  - team strength, stadium level, training center level,
  - money/stars balances,
  - money/stars in/out flow.
- Observed behavior:
  - Team strength generally trends strongly upward over seasons (many tracked teams +500 to +570 in this accelerated model).
  - Training center progression is active and often reaches upper tiers in long runs.
  - Stadium progression is conservative in this run due high transfer fee pressure.

## Economy and Flow Takeaways
- Stars are net inflationary in this setup due sponsor + ad inflows against spend sinks.
- Money is strongly net negative for many teams because transfer completion fees dominate outflow in this simulation mode.
- Persona spend exports (`bot-spend-by-persona-money.csv`, `bot-spend-by-persona-stars.csv`) now include training camp and infrastructure categories, improving explainability.

## Risks and Next Tuning Priorities
1. Transfer fee curve is too aggressive relative to simulated money inflows; this suppresses stadium growth and can distort progression realism.
2. Team strength growth is very steep over 20 accelerated seasons; add stronger fatigue/aging drag post-30 for full-roster progression and/or scale down passive team strength gains.
3. Keep 500+ reachable for talent-10 individual-training paths, but gate frequency by stricter resource pressure and training-center level pacing.
4. Add explicit per-team revenue sources (matchday income, sponsor money variant, stadium revenue) to counterbalance transfer spend while preserving scarcity.

## Constraint Check
- 20 seasons: passed
- 3-tier full pyramid: passed
- Schedule checks 08/13/18 UTC: passed
- Sponsor split behavior active (short-cycle + season-cycle): passed
- Tracked players expanded and sorted by player: passed
- Transfer completion track sorted by price: passed
- Team development track sorted by team: passed
