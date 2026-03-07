# Phase 2 Bot Simulation Analysis

## Run Scope
- Seasons: 20
- Population: 96 bots (Tier 1: 16, Tier 2: 32, Tier 3: 48)
- Matchdays per season: 30
- Fixed UTC schedule: training 08:00, friendlies 13:00, league 18:00
- Economy constants: bid=200 stars, sponsor=500 stars/day, ad=100 stars/ad
- Output directory: `/mnt/website/goal_tactics/phase2_run_20260307_000159`

## Core Results
- Total matches: 28,800
- Average matches/season: 1,440
- Average goals/match: 2.064
- Average bids/season: 1,197.15
- Average ads watched/season: 57.60
- Average chat posts/season: 3,792.50
- Friendly acceptance rate: 64.6%
- Average sponsors accepted/season: 2,149.75
- Average ladder challenges/season: 6,842.45
- Average stars spent/season: 1,094,430
- Average stars earned/season: 1,080,635
- Average net stars/season: -13,795

## Competition
- Match volume stayed perfectly stable, confirming league pyramid sizing and scheduler consistency.
- Goal output was tightly distributed season-to-season, indicating predictable simulation health.
- Home/away/draw distribution looked balanced enough for large-scale economy testing.

## Economy
- Star economy is slightly net-deflationary overall, largely from transfer bids and ladder restores.
- Rewarded ads are still heavily front-loaded (season 1 active, then near-zero), suggesting ad logic is valid but currently dominated by sponsor inflows.
- Sponsor loop remains the largest recurring inflow and can suppress low-star stress behavior.

## Transfers and Auctions
- Bid throughput remained high and stable with low season-to-season drift.
- Auction-expiry wakeups are active and credible: bid events occurred at all scheduled checks (08/13/18 UTC).
- The fixed 200-star bid sink provided a consistent and useful pressure valve.

## Training and Progression
- Training events occurred at 08:00 UTC only.
- Team progression remains linear and low-noise; good for baseline balance runs, but still simplified for long-term realism.

## Social and Friendlies
- Friendly invitation behavior is now tied to the 13:00 UTC friendly window only.
- Friendly requests halved versus prior run and became cadence-correct.
- Chat volume remained strong and context-sensitive across all seasons.

## Ladder
- Ladder activity remained the largest high-frequency subsystem.
- 500-star restores are a significant sink and materially influence star liquidity.

## Validation Against Required Constraints
- 20 seasons: passed.
- 3-tier full pyramid (1/2/3 groups, 16 teams each): passed.
- Fixed schedule checks (08/13/18 UTC): passed in logs.
- Bid stars 200, sponsor 500/day, ads 100/ad: passed in action execution and logs.
- Auction-expiry wakeups: passed.

## Takeaways and Next Tunings
1. Keep current constants for baseline, but add sponsor fatigue or cooldown scaling to preserve ad relevance in late seasons.
2. Add persona-specific ad thresholds so highly active, low-liquidity personas remain ad-engaged beyond season 1.
3. Add fatigue/injury/rotation effects to training output to avoid overly smooth progression.
4. Add optional transfer budget guards by tier/persona to improve long-tail diversity.
