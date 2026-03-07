# Phase 2 Bot Simulation Analysis (Training Rework)

## Scope and Method
- Output directory: `/mnt/website/goal_tactics/phase2_run_20260307_074420`
- Seasons: 20
- Population: 96 bots (Tier 1: 16, Tier 2: 32, Tier 3: 48)
- Matchdays per season: 30
- Fixed schedule checks: training 08:00 UTC, friendlies 13:00 UTC, league 18:00 UTC
- Sponsor model:
- Short sponsor: renew every 3 days, pays 200 stars/day
- Season sponsor: signed at season start, pays 300 stars/day
- Decompiled training clues used for rework:
- Talent is constrained to 1..10 in core search criteria constants
- Team training uses main and sub training slots with efficiency state
- Training camp data contains `PriceEuro`, `PriceStars`, and `Power`
- Individual training uses star-price flow (`TrainPrice`) and renew mechanics

## Core Metrics (20-Season Average)
- Matches/season: 1,440
- Goals/match: 2.055
- Transfers completed/season: 1,112.05
- Transfer fees paid/season: 368,430,232.05 money
- Bids/season: 1,179.60
- Ads watched/season: 295.70
- Chat posts/season: 3,773.80
- Friendly acceptance rate: 64.6%
- Sponsors accepted/season: 10.95
- Ladder challenges/season: 6,911.50
- Stars earned/season: 1,469,570
- Stars spent/season: 1,229,095
- Net stars/season: +240,475

## Training Rework Validation
- Player aging now increments by one each season.
- Talent range is enforced at 1..10.
- Transfer player generation centers around strength in the 60-70 band with elite variance.
- Strength cap is enforced at 700.
- Main+sub training model is age/talent/training-center sensitive.
- Individual training is modeled as weekly star spend per player and produces stronger focused gains.
- Camp booking is modeled for 7 days with money/stars payment options and daily effect.

## Tracked Player Outcomes (Sorted by Player)
- Output file: `tracked-players.csv` sorted by player ID then season.
- Tracked cohort is expanded to 13 players with mixed starting ages and manager personas.
- Young high-talent players now frequently show ~1.1 daily gain seasons.
- Evidence of high-end development is present:
- Max tracked player strength reached `504.740` at season 20.
- Sold-state tracking remains active and visible over time.

## Transfer Outcomes (Sorted by Price)
- Output file: `transfer-completions.csv` sorted by fee descending.
- Completed transfer rows now include age, talent, fitness, strength, potential, and fee.
- Top-fee transfers correlate with high talent and high potential profiles.

## Team Development Outcomes (Sorted by Team)
- Output file: `tracked-teams.csv` sorted by team then season.
- Per-team seasonal tracking now includes:
- Team strength evolution
- Stadium level evolution
- Training center level evolution
- Money/stars balances
- Money/stars inflow and outflow
- Strength trends are strongly upward across tracked teams.
- Training center progression is active and often reaches high levels.

## Economy and Flow Takeaways
- Star economy is now inflationary due combined sponsor + ad inflow.
- Money economy is strongly negative for many clubs because transfer fee outflow dominates.
- Persona spend breakdown now includes new categories:
- `training.individual.weekly`
- `training.camp.booking`
- `infrastructure.stadium`
- `infrastructure.training_center`

## Risks and Next Tuning Priorities
1. Transfer fee formula is currently too aggressive versus simulated money income.
2. Team strength growth is steep across 20 accelerated seasons; add stronger late-age drag and/or reduce passive gains.
3. Keep the talent-10 path to 500+ possible, but tighten cost pressure and progression pacing.
4. Add explicit money inflow systems (matchday/stadium/business revenue) to avoid structural insolvency drift.

## Constraint Validation
- 20-season run: passed.
- 3-tier full pyramid: passed.
- Fixed schedule checks (08/13/18 UTC): passed.
- Expanded tracked players sorted by player: passed.
- Completed transfers sorted by price: passed.
- Tracked teams sorted by team with development flow: passed.
